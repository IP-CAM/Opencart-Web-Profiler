<?php
class ControllerCommonWebProfiler extends Controller {
    public function ajax() {
        $valid_types = array(
            'vqmod_cache',
            'vqmod_log',
            'system_cache',
            'system_log',
            'toggle_wplog',
            'toggle_wptemplate'
        );

        $json = array();

        if (!isset($this->request->post['type']) || !in_array($this->request->post['type'], $valid_types)) {
            die();
        }

        if ($this->request->post['type'] == 'vqmod_cache') {
            $json['type'] = 'vqmod_cache';
            $json['success'] = $this->clearVqmodCache();
        }

        if ($this->request->post['type'] == 'system_cache') {
            $json['type'] = 'system_cache';
            $json['success'] = $this->clearSystemCache();
        }

        if ($this->request->post['type'] == 'toggle_wplog') {
            $json['type'] = 'toggle_wplog';
            $json['success'] = $this->toggleWpLog();
        }

        if ($this->request->post['type'] == 'toggle_wptemplate') {
            $json['type'] = 'toggle_wptemplate';
            $json['success'] = $this->toggleWpTemplate();
        }

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
    }

    private function clearVqmodCache() {
        $error = array();

		$files = glob(DIR_SYSTEM . '../vqmod/vqcache/*');
		foreach($files as $file) {
            if (!$this->deleteFile($file)) {
                $error[] = 'Failed to delete ' . $file;
            }
		}

		if (file_exists(DIR_SYSTEM . '../vqmod/mods.cache')) {
			if (!unlink(DIR_SYSTEM . '../vqmod/mods.cache')) {
                $error[] = 'Failed to delete mods.cache';
            }
		}

		if (file_exists(DIR_SYSTEM . '../vqmod/checked.cache')) {
			if (!unlink(DIR_SYSTEM . '../vqmod/checked.cache')) {
                $error[] = 'Failed to delete checked.cache';
            }
		}

        if (empty($error)) {
            $success = 'vQmod cache cleared.';
        } else {
            $success = false;
        }

		return $success;
    }

    private function clearSystemCache() {
        $error = array();

		$files = glob(DIR_SYSTEM . 'cache/*');
		foreach($files as $file) {
            if (!$this->deleteFile($file)) {
                $error[] = 'Failed to delete ' . $file;
            }
		}

        if (empty($error)) {
            $success = 'System cache cleared.';
        } else {
            $success = false;
        }

		return $success;
    }

    private function toggleWpLog() {
        $error = array();

        if (isset($this->request->cookie['wplog'])) {
            if ($this->request->cookie['wplog'] == 0) {
                setcookie('wplog', 1, time() + (86400 * 30), '/', $this->request->server['HTTP_HOST']);
            } else {
                setcookie('wplog', 0, time() + (86400 * 30), '/', $this->request->server['HTTP_HOST']);
            }
        } else {
            setcookie('wplog', 0, time() + (86400 * 30), '/', $this->request->server['HTTP_HOST']);
        }

        if (empty($error)) {
            $success = 'Successful';
        } else {
            $success = false;
        }

		return $success;
    }

    private function toggleWpTemplate() {
        $error = array();

        setcookie('wptemplate', 0, time() + (86400 * 30), '/', $this->request->server['HTTP_HOST']);

        if (empty($error)) {
            $success = 'Toolbar removed. Clear cookies to re-enable.';
        } else {
            $success = false;
        }

		return $success;
    }

    private function deleteFile($name) {
        $excludes = array(
            'index.html',
            '.htaccess'
        );

		if (file_exists($name)) {
			if (is_dir($name)) {
				$dir = opendir($name);

				while ($filename = readdir($dir)) {
					if ($filename != '.' && $filename != '..') {
						$file = $name . '/' . $filename;
						$this->deleteFile($file);
					}
				}

				closedir($dir);

                return true;
            } else {
                if (!in_array(basename($name), $excludes)) {
                    return unlink($name);
                } else {
                    return true;
                }
			}
		}
	}
}
?>