<?php
class WebProfiler {
    protected $config;
    protected $db;
    protected $request;
    protected $session;
    protected $start_time;
    protected $finish_time;
    protected $start_memory;
    protected $finish_memory;
    protected $entries = array();
    protected $stopwatch = array();
    protected $response_code;
    protected $main_controller;
    protected $main_method;

    public function __construct() {
        $this->setStartTime(microtime(true));
        $this->setStartMemory(memory_get_usage(true));
    }

    public function finish() {
        $this->setFinishTime(microtime(true));
        $this->setFinishMemory(memory_get_usage(true));
        $this->setResponseCode(http_response_code());
    }

    public function formatTime($time) {
        return round($time, 4);
    }

    public function formatMemory($memory) {
        $unit = array('B', 'KB', 'MB', 'GB');

        if ($memory) {
            return round(($memory) / pow(1024, ($i = floor(log(($memory), 1024)))), 2) . ' ' . $unit[$i];
        } else {
            return '0 B';
        }
    }

    public function log() {
        if (isset($this->request->cookie['wplog']) && $this->request->cookie['wplog'] == 1) {
            $log = new Log('web_profiler.txt');
            $log->write('START: ' . $this->request->server['REQUEST_URI'] . ' Response: ' . $this->getResponseCode() . ' Action: ' . $this->getMainController() . '::' . $this->getMainMethod());
            $log->write('TIME TAKEN: ' . $this->formatTime($this->getFinishTime() - $this->getStartTime()));

            $entry_groups = $this->getEntries('', 500);

            foreach ($entry_groups as $entry_group) {
                foreach ($entry_group['entries'] as $entry) {
                    $text  = $entry['time_taken'] . ' seconds ';
                    $text .= $entry['type'] . ' ';
                    $text .= $entry['text'];

                    $log->write(print_r($text, true));
                }
            }

            $log->write(print_r('Memory Used: ' . $this->formatMemory($this->getFinishMemory() - $this->getStartMemory()), true));
            $log->write('FINISH');
        }
    }

    public function template() {
        if (isset($this->request->cookie['wptemplate']) && $this->request->cookie['wptemplate'] == 0) {
            return '';
        }

        $template = array();
        $template['response_code'] = $this->getResponseCode();
        $template['memory_used'] = $this->formatMemory($this->getFinishMemory() - $this->getStartMemory());
        $template['time_taken'] = $this->formatTime($this->getFinishTime() - $this->getStartTime());
        $template['controller'] = $this->getMainController();
        $template['method'] = $this->getMainMethod();

        $method = array();
        $entries = $this->getEntries('method');
        if (isset($entries['method']) && !empty($entries['method'])) {
            $method = $entries['method'];
        }

        $template['type_method'] = $method;

        $query = array();
        $entries = $this->getEntries('query');
        if (isset($entries['query']) && !empty($entries['query'])) {
            $query = $entries['query'];
        }

        $template['type_query'] = $query;

        $template_data = array();
        $entries = $this->getEntries('template');
        if (isset($entries['template']) && !empty($entries['template'])) {
            $template_data = $entries['template'];
        }

        $template['type_template'] = $template_data;

        $query = array();
        $entries = $this->getEntries('stopwatch');
        if (isset($entries['stopwatch']) && !empty($entries['stopwatch'])) {
            $query = $entries['stopwatch'];
        }

        $template['type_stopwatch'] = $query;

        $template['vqmod_logs'] = glob(DIR_SYSTEM . '../vqmod/logs/*.log');

        $system_logs = glob(DIR_SYSTEM . 'logs/*');

        $exclude_logs = array(
            'index.html'
        );

        $template['system_logs'] = array();
        foreach ($system_logs as $system_log) {
            if (!in_array(basename($system_log), $exclude_logs) && filesize($system_log)) {
                $template['system_logs'][] = array(
                    'name' => basename($system_log),
                    'size' => $this->formatMemory(filesize($system_log)),
                );
            }
        }

        return $this->fetchTemplate('default/template/common/web_profiler.tpl', $template);
    }

    public function addEntry($type, $text, $start = null, $primary = false) {
        if ($primary && $type == 'method') {
            $front = explode('::', $text);

            $this->setMainController($front[0]);
            $this->setMainMethod($front[1]);
        }

        if (!$start && $type == 'stopwatch' && isset($this->stopwatch[$text])) {
            $start = $this->stopwatch[$text];
        }

		$this->entries[] = array(
			'type'       => $type,
            'text'       => trim(preg_replace('/\s+/', ' ', $text)),
			'time_taken' => $this->formatTime(microtime(true) - $start),
		);
    }

	public function getEntries($entry_type = '', $limit = 10) {
        $type = $text = $time_taken = $sorted_entries = $count = array();

        $all_entries = $this->entries;

        foreach ($this->entries as $key => $row) {
            $type[$key]       = $row['type'];
            $time_taken[$key] = $row['time_taken'];
        }

        array_multisort($type, SORT_ASC, $time_taken, SORT_DESC, $all_entries);

        foreach ($all_entries as $all_entry) {
            if (!isset($sorted_entries[$all_entry['type']]['quantity_total'])) {
                $sorted_entries[$all_entry['type']]['quantity_total'] = 0;
            }

            if (!isset($sorted_entries[$all_entry['type']]['quantity_entries'])) {
                $sorted_entries[$all_entry['type']]['quantity_entries'] = 0;
            }

            if (!isset($sorted_entries[$all_entry['type']]['time_taken_total'])) {
                $sorted_entries[$all_entry['type']]['time_taken_total'] = 0;
            }

            if (!isset($sorted_entries[$all_entry['type']]['time_taken_entries'])) {
                $sorted_entries[$all_entry['type']]['time_taken_entries'] = 0;
            }

            $sorted_entries[$all_entry['type']]['quantity_total']++;

            $sorted_entries[$all_entry['type']]['time_taken_total'] += $all_entry['time_taken'];

            if ($sorted_entries[$all_entry['type']]['quantity_entries'] < $limit) {
                $sorted_entries[$all_entry['type']]['entries'][] = $all_entry;

                $sorted_entries[$all_entry['type']]['quantity_entries']++;

                $sorted_entries[$all_entry['type']]['time_taken_entries'] += $all_entry['time_taken'];
            }
        }

        if (!empty($entry_type)) {
            return array_intersect_key($sorted_entries, array($entry_type => array()));
        }

		return $sorted_entries;
	}

    public function stopwatch($key) {
		$this->stopwatch[$key] = microtime(true);
    }

    public function setRegistries($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');
    }

	public function fetchTemplate($filename, $data) {
		$file = DIR_TEMPLATE . $filename;

		if (file_exists($file)) {
			extract($data);

      		ob_start();

	  		include($file);

	  		$content = ob_get_contents();

      		ob_end_clean();

      		return $content;
    	}
	}

    public function startTimer() {
        return microtime(true);
    }

    public function getStartTime() {
        return $this->start_time;
    }

    public function getFinishTime() {
        return $this->finish_time;
    }

    public function setStartTime($start_time) {
        $this->start_time = $start_time;
    }

    public function setFinishTime($finish_time) {
        $this->finish_time = $finish_time;
    }

    public function getStartMemory() {
        return $this->start_memory;
    }

    public function getFinishMemory() {
        return $this->finish_memory;
    }

    public function setStartMemory($start_memory) {
        $this->start_memory = $start_memory;
    }

    public function setFinishMemory($finish_memory) {
        $this->finish_memory = $finish_memory;
    }

    public function getResponseCode() {
        return $this->response_code;
    }

    public function setResponseCode($response_code) {
        $this->response_code = $response_code;
    }

    public function getMainController() {
        return $this->main_controller;
    }

    public function getMainMethod() {
        return $this->main_method;
    }

    public function setMainController($main_controller) {
        $this->main_controller = $main_controller;
    }

    public function setMainMethod($main_method) {
        $this->main_method = $main_method;
    }
}
?>