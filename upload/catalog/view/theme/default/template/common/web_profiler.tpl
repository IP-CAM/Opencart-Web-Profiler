<style>

/******************** MAIN MENU ********************
 ********************           *******************/

.ocwp-menu {
    width: 25%;
    height: 100%;
    background: #121B34;
    position: fixed;
    bottom: 0;
    left: 0;
    margin-left: -25%;
    font-size: 1.2em;
    color:white;
    transition: 0.2s;
    font-family: oswald;
    line-height: 1.4;
}

.ocwp-ul {
    padding: 0;
    margin: 0;
    list-style: none;
}

.ocwp-span {padding-left: 5px;}

.ocwp-list-item {list-style: none;}

.ocwp-toggle-nav {z-index: 5005;}

.ocwp-toggle-nav {
    margin-left: 0!important;
    transition: 0.2s!important;
}

.ocwp-active {
    display: block !important;
}

/******************** LINKS ********************
 ********************       *******************/

a.wp-ajax {
    font-size: 1em!important;
    padding: 5px;
    display: block;
    text-decoration: none!important;
}

/******************** CONTAINERS ******************
 ********************            ******************/

.ocwp-dropdown-container-styles {
    padding: 0;
    background: rgba(37, 63, 97, .9);
}

.ocwp-container-push {
    margin-left: 30%!important;
    overflow: hidden;
}

.ocwp-ul > li > ul > ul {padding: 20px;}

.method-col-view, .method-col {padding: 10px 0;}

@media (min-width: 570px) {
    .method-col {
        width: 80%;
        float: left;
    }

    .ocwp-ul > li > ul.ocwp-dropdown-nav-templates > ul {width: 380px;}

    .time-col {
        width: 20%;
        float: left;
        padding: 10px 0;
    }

    .ocwp-ul > li > ul.ocwp-dropdown-nav-common > ul, .ocwp-ul > li > ul.ocwp-dropdown-nav-templates > ul {padding: 20px;}

    .method-col-view {
        width: 50%;
        float: left;
    }

    .time-col-view {
        width: 50%;
        float: left;
        height: 41px;
        padding: 10px 0;
    }
}

.ocwp-list-item {text-align: left;}

 .time-col-view {text-align: center;}

/******************** DROPDOWN MENU ***************
 ********************               ***************/

.ocwp-tab {
    cursor: pointer;
}

.ocwp-dropdown {
    position: relative;
    padding: 15px 0;
}

.ocwp-dropdown > img {
    margin-left: 10px;
    display: inline-block;
}

.ocwp-dropdown > .fa-clock-o, .ocwp-dropdown > span > .fa-medium, .ocwp-dropdown > .fa-wrench {
    margin-left: 10px;
    display: inline-block;
    font-size: 18px;
}

.ocwp-dropdown:nth-last-of-type(odd) {background: #253F61;}

.ocwp-dropdown-nav {
    display: none;
    z-index: 100;
    position: absolute;
    left: 100%;
    top: 0px;
}

.ocwp-dropdown-nav > .list-title {
    background: rgba(18, 27, 52, .5);
    color: white;
    display: inline-block;
    width: 100%;
    padding: 20px 0;
    text-align: center;
    font-weight: bold;
    font-size: 1.2em;
}

.ocwp-dropdown-nav > h3 + span {
    background: none;
    color: white;
    font-size: inherit;
    padding: 0;
    text-align: inherit;
    font-weight: inherit;
}

.ocwp-dropdown-nav-common {
    width: 350px;
    z-index: 101;
}

.ocwp-dropdown-nav-queries {
    z-index: 102;
    width: 200px;
}

.ocwp-dropdown-nav-queries > ul > li {
    list-style: none;
    padding: 15px 5px;
    width: 80px;
    margin: 0 auto;
}

.ocwp-dropdown-nav-templates {
    width: 350px;
    z-index: 103;
    overflow: hidden;
}

.ocwp-dropdown-nav-settings {
    padding: 0 10px 0 0;
    z-index: 100;
    background: rgba(37, 63, 97, .9);
    width: 170px;
}

.ocwp-dropdown-nav-logs {
    z-index: 105;
    width: 160px;
    padding: 0 5px 5px 5px;
}

.ocwp-dropdown-nav > h3, .log-title {
    color: white;
    margin-top: 5px!important;
    font-size: 1.1em;
    font-weight: inherit;
    border-bottom: 1px solid white;
    padding: 5px 0;
    margin: 10px 0;
}

.ocwp-dropdown-nav > h3:first-child {margin-top: 0!important;}

.ocwp-dropdown-nav > h3:nth-of-type(1) {margin-top: 5px;}

.ocwp-dropdown-nav > h3 {color: white!important;}

.ocwp-dropdown > .ocwp-span-text {padding-left: 8px!important;}

.ocwp-dropdown > .ocwp-span-text-templates {padding-left: 5px!important;}

@media (max-width: 500px) {.ocwp-dropdown > .ocwp-span-text-templates {display: none;}}

.ocwp-dropdown > .ocwp-span-text-dynamic {padding-left: 9px!important;}

@media (max-width: 500px) {
    .ocwp-dropdown > .ocwp-span-text-dynamic {
        display: block!important;
        padding: 5px 0!important;
    }
}

.ocwp-view-list {
    width: auto!important;
    padding: 0!important;
}

/******************** SUB-QUERIES DROPDOWN ********************
 ********************                      *******************/

.sub-queries-ocwp-dropdown {
    width: 600px;
    background: rgba(37, 63, 97, .9);
    position: absolute;
    left: 100%;
    top: 0;
    display: none;
}

.sub-queries-ocwp-dropdown > span {
    background: rgba(18, 27, 52, .4);
    color: white;
    display: inline-block;
    width: 100%;
    padding: 20px 0;
    text-align: center;
    font-weight: bold;
    font-size: 1.2em;
}

.sub-queries-ocwp-dropdown > li {
    list-style: none!important;
    padding: 15px 5px!important;
    width: 500px!important;
    margin: 0 auto!important;
}

@media (max-width: 1100px) {
    .sub-queries-ocwp-dropdown > li {
        list-style: none!important;
        padding: 15px 5px!important;
        width: 390px!important;
        margin: 0 auto!important;
    }

    .sub-queries-ocwp-dropdown {
        width: 440px;
        overflow: hidden;
    }
}

/******************** ICONS ********************
 ********************       *******************/

.ocwp-bars-container {
    width: 35px;
    height: 35px;
    position: fixed;
    top: 0px;
    left: 0px;
    z-index:5000;
    cursor: pointer;
}

@media (min-width: 250px) {
    .ocwp-cross-container {
        top: 610px;
        width: 60%;
        right: inherit;
        margin-left: 20%;
        text-align: center;
        position: absolute;
        cursor: pointer;
        z-index: 5000;
    }
}

@media (min-width: 450px) {
    .ocwp-cross-container {
        top: 600px;
        width: 60%;
        right: inherit;
        margin-left: 20%;
        text-align: center;
        position: absolute;
        cursor: pointer;
        z-index: 5000;
    }
}

@media (min-width: 500px) {
    .ocwp-cross-container {
    width: 25px;
    height: 30px;
    position: fixed;
    top: 5px;
    right: 5px;
    z-index: 5000;
    position: absolute;
    cursor: pointer;
}
}

.ocwp-web-icon {
    width: 20px;
    position: relative;
    top: 4px;
}

.ocwp-query-icon {top: 4px;}

@media (max-width: 500px) {
    .ocwp-query-icon {
        top: 2px;
    }
}

/******************** SLIDESHOW/Z-INDEX ********************
 ********************                   *******************/

div#slideshow0 {z-index: -100;}

.slideshow {z-index: -999;}

#menu > ul > li {z-index: 0;}

/******************** MEDIA QUERIES ********************
 ********************               *******************/

@media (max-width: 880px) {
    .ocwp-menu {
        width: 40%;
        margin-left: -40%;
    }

    .ocwp-container-push {
        margin-left: 45%!important;
        overflow: hidden;
    }

    .sub-queries-ocwp-dropdown {
        width: 200px;
        background: rgba(37, 63, 97, .9);
        position: absolute;
        left: 0;
        top: 100%;
        display: none;
    }

    .ocwp-dropdown-nav-queries {
        display: none;
        z-index: 100;
        position: absolute;
        left: 100%;
        top: -159px;
    }
}

@media (max-width: 560px) {
    .ocwp-menu {
        width: 45%;
        margin-left: -45%;
    }

    .ocwp-container-push {
        margin-left: 50%!important;
        overflow: hidden;
    }
}

@media (max-width: 500px) {
    .ocwp-menu {
        width: 15%;
        margin-left: -15%;
    }

    .ocwp-container-push {
        margin-left: 18%!important;
        overflow: hidden;
    }

    .ocwp-span-text {display: none;}

    .ocwp-web-icon {
        width: 24px;
        margin: 0 auto;
        display: block;
    }

    .ocwp-cross {
        font-size: 1.5em;
        position: relative;
        left: 1px;
        top: 2px;
        z-index: 100;
        display: inline-block;
    }

    li.ocwp-dropdown {
        width: 100%;
        text-align: center;
    }

    .ocwp-dropdown > img {
        margin-left: 0;
        display: inline-block;
    }

    .ocwp-dropdown-nav-queries {
        display: none;
        z-index: 100;
        position: absolute;
        left: 100%;
        top: -167px;
    }

    .ocwp-dropdown-nav-templates {width: 280px;}
}

img[src*='welford.png'] {
    position: relative;
    top: 1px;
    left: 2px;
}

.ocwp-menu a, .ocwp-menu a:visited, .ocwp-menu a{
    font-size: 1.05em;
    text-decoration: none;
}

/********************  HELPERS  ********************
 ********************           *******************/

.ocwp-text-white {color: white;}

.ocwp-pull-right {margin-left: 30%;}

.ocwp-center {text-align: center;}

.ocwp-cf:before,
.ocwp-cf:after {
    content: " ";
    display: table;
}

.ocwp-cf:after {clear: both;}

* {box-sizing: border-box;}

.pd-0 {
    padding: 0;
}

</style>
<link href="//fonts.googleapis.com/css?family=Oswald" rel="stylesheet" type="text/css" />
<div class="ocwp-bars-container"><img src="image/web_profiler/bars.svg"></div>
<div class="ocwp-menu">
    <div class="ocwp-cross-container"><img src="image/web_profiler/times.png"></div>
    <ul class="ocwp-ul">
        <li class="ocwp-dropdown">
            <img src="image/web_profiler/welford.png" class="ocwp-web-icon"><span class="ocwp-span-text ocwp-span web-profiler-title">OpenCart Web Profiler&nbsp;&nbsp;&nbsp;</span>
        </li>
        <li class="ocwp-dropdown">
            <img src="image/web_profiler/web-icon.png" class="ocwp-web-icon"><span class="ocwp-span-text ocwp-span">HTTP Status: <?php echo $response_code; ?>&nbsp;&nbsp;&nbsp;</span>
        </li>
        <?php if ($type_method) { ?>
            <li class="ocwp-dropdown ocwp-tab">
                <img src="image/web_profiler/home.png" class="ocwp-web-icon"><span class="ocwp-span-text ocwp-span"><?php echo $controller; ?>::<?php echo $method; ?>&nbsp;&nbsp;&nbsp;</span>
                <ul class="ocwp-dropdown-nav ocwp-dropdown-container-styles ocwp-dropdown-nav-common ocwp-text-white">
                    <li class="list-title">Methods (<?php echo $type_method['quantity_entries']; ?>)</li>
                    <ul class="ocwp-ul ocwp-cf">
                        <?php foreach ($type_method['entries'] as $entry) { ?>
                            <li class="ocwp-list-item ocwp-cf"><div class="method-col"><?php echo $entry['text']; ?></div><div class="time-col"><?php echo $entry['time_taken']; ?></div></li>
                        <?php } ?>
                    </ul>
                </ul>
            </li>
        <?php } ?>
        <?php if ($type_query) { ?>
            <li class="ocwp-dropdown ocwp-query ocwp-tab">
                <img src="image/web_profiler/query.png" class="ocwp-web-icon ocwp-query-icon"><span class="ocwp-span-text ocwp-span"><?php echo $type_query['quantity_total']; ?> queries: <?php echo $type_query['time_taken_total']; ?> secs</span>
                <ul class="ocwp-dropdown-nav ocwp-dropdown-container-styles ocwp-dropdown-nav-queries ocwp-text-white ocwp-ul">
                    <li class="list-title">Slowest <?php echo $type_query['quantity_entries']; ?> took <?php echo $type_query['time_taken_entries']; ?></li>
                    <ul class="ocwp-ul ocwp-cf">
                        <?php foreach ($type_query['entries'] as $key => $entry) { ?>
                            <li class="ocwp-list-item ocwp-center ocwp-view-list"><div class="method-col-view"><a href="#" data-id="<?php echo $key; ?>" class="view-link">View</a></div><div class="time-col-view"><?php echo $entry['time_taken']; ?></div></li>
                        <?php } ?>
                    </ul>
                    <?php foreach ($type_query['entries'] as $key => $entry) { ?>
                        <ul data-id="<?php echo $key; ?>" class="sub-queries-ocwp-dropdown ocwp-ul" style="display: none;">
                            <li class="ocwp-list-item"><?php echo $entry['text']; ?></li>
                        </ul>
                    <?php } ?>
                </ul>
            </li>
        <?php } ?>
        <?php if ($type_template) { ?>
            <li class="ocwp-dropdown ocwp-tab">
                <img src="image/web_profiler/code.png" class="ocwp-web-icon">
                <span class="ocwp-span-text-templates ocwp-span"><?php echo $type_template['quantity_total']; ?> templates: <?php echo $type_template['time_taken_total']; ?> secs</span>
                <ul class="ocwp-dropdown-nav ocwp-dropdown-container-styles ocwp-dropdown-nav-templates ocwp-text-white ocwp-ul">
                    <li class="list-title">Slowest <?php echo $type_template['quantity_entries']; ?> took <?php echo $type_template['time_taken_entries']; ?></li>
                    <ul class="ocwp-ul">
                        <?php foreach ($type_template['entries'] as $entry) { ?>
                            <li class="ocwp-list-item ocwp-cf"><div class="method-col"><?php echo $entry['text']; ?></div><div class="time-col"><?php echo $entry['time_taken']; ?></div></li>
                        <?php } ?>
                    </ul>
                </ul>
            </li>
        <?php } ?>
        <?php if ($type_stopwatch) { ?>
        <li class="ocwp-dropdown ocwp-tab">
            <img src="image/web_profiler/stopwatch.png" class="ocwp-web-icon">
            <span class="ocwp-span-text-stopwatch ocwp-span"><?php echo $type_stopwatch['quantity_total']; ?> stopwatch entries : <?php echo $type_stopwatch['time_taken_total']; ?> secs</span>
            <ul class="ocwp-dropdown-nav ocwp-dropdown-container-styles ocwp-dropdown-nav-templates ocwp-text-white ocwp-ul">
                <li class="list-title">Slowest <?php echo $type_stopwatch['quantity_entries']; ?> took <?php echo $type_stopwatch['time_taken_entries']; ?></li>
                <ul class="ocwp-ul">
                    <?php foreach ($type_stopwatch['entries'] as $entry) { ?>
                        <li class="ocwp-list-item ocwp-cf"><div class="method-col"><?php echo $entry['text']; ?></div><div class="time-col"><?php echo $entry['time_taken']; ?></div></li>
                    <?php } ?>
                </ul>
            </ul>
        </li>
        <?php } ?>
        <li class="ocwp-dropdown">
            <img src="image/web_profiler/clock.svg" class="ocwp-web-icon"><span class="ocwp-span-text-dynamic ocwp-span"><?php echo $time_taken; ?> secs</span>
        </li>
        <li class="ocwp-dropdown">
            <img src="image/web_profiler/medium.svg" class="ocwp-web-icon"><span class="ocwp-span-text-dynamic ocwp-span"><?php echo $memory_used; ?></span>
        </li>
        <li class="ocwp-dropdown ocwp-tab">
            <img src="image/web_profiler/wrench.svg" class="ocwp-web-icon"><span class="ocwp-span-text-dynamic ocwp-span">Settings</span>
            <ul class="ocwp-dropdown-nav ocwp-dropdown-nav-settings ocwp-ul">
                <li><a class="wp-ajax" data-type="vqmod_cache">Clear vQmod cache</a></li>
                <li><a class="wp-ajax" data-type="system_cache">Clear OpenCart cache</a></li>
                <li><a class="wp-ajax" data-type="toggle_wptemplate">Turn off Web Profiler toolbar</a></li>
                <li><a class="wp-ajax" data-type="toggle_wplog">Toggle Web Profiler log</a></li>
            </ul>
        </li>
        <li class="ocwp-dropdown ocwp-tab">
            <img src="image/web_profiler/log.png" class="ocwp-web-icon"><span class="ocwp-span-text ocwp-span">Logs</span>
            <ul class="ocwp-dropdown-nav ocwp-dropdown-container-styles ocwp-dropdown-nav-logs ocwp-text-white ocwp-ul">
                <li><h3 class="log-title">vQmod Logs</h3></li>
                <?php if ($vqmod_logs) { ?>
                    <li>Check vQmod logs</li>
                <?php } else { ?>
                    <li>No vQmod logs found</li>
                <?php } ?>
                <li><h3 class="log-title">System Logs</h3></li>
                <?php if ($system_logs) { ?>
                <?php foreach ($system_logs as $system_log) { ?>
                <li><?php echo $system_log['name'] . ' (' . $system_log['size'] . ')'; ?><a class="wp-ajax" data-type="delete_log" data-file="<?php echo $system_log['name']; ?>">Delete</a></li>
                <?php } ?>
                <?php } else { ?>
                <li>No system logs found</li>
                <?php } ?>
            </ul>
        </li>
    </ul>
</div>
<script type="text/javascript"><!--
$('.wp-ajax').bind('click', function() {
    var data = {
        type: $(this).attr('data-type')
    };

    if ($(this).attr('data-file')) {
        data.file = $(this).attr('data-file');
    }

    $.ajax({
        url: 'index.php?route=common/web_profiler/ajax',
        type: 'post',
        data: data,
        dataType: 'json',
        success: function(json) {
            if (json['success']) {
                if (json['file']) {
                    $('a[data-file="' + json['file'] + '"]').text(json['success']);
                } else {
                    $('a[data-type=' + json['type'] + ']').text(json['success']);
                }
            } else {
                if (json['file']) {
                    $('a[data-file="' + json['file'] + '"]').text('Failed');
                } else {
                    $('a[data-type=' + json['type'] + ']').text('Failed');
                }
            }
        }
    });
});

//-->
</script>

<script type="text/javascript">
$(document).ready(function() {
    $(".ocwp-bars-container").on("click", function(){
        $(this).toggle();
        $(".ocwp-menu").toggleClass("ocwp-toggle-nav");
        $("#container").toggleClass("ocwp-container-push");
    });

    $('.ocwp-cross-container').on('click', function(){
        $("#container").toggleClass("ocwp-container-push");

        $('.ocwp-dropdown-nav').removeClass('ocwp-active');

        $(".ocwp-bars-container").show();
    });

    $(".ocwp-cross-container").on("click", function(){
        $(".ocwp-menu").toggleClass("ocwp-toggle-nav");
    });

    $('.ocwp-query .view-link').on('click', function(event) {
        event.preventDefault();

        $('.sub-queries-ocwp-dropdown').hide();

        $(".sub-queries-ocwp-dropdown[data-id='" + $(this).attr('data-id') + "']").show();
    });

    $("a.wp-ajax").on("click", function(event) {
        event.stopPropagation();
    });

    $('.ocwp-tab').on('click', function() {
        var addClass = true;

        if ($(this).find('.ocwp-dropdown-nav').hasClass('ocwp-active')) {
            addClass = false;
        }

        $('.ocwp-dropdown-nav').removeClass('ocwp-active');

        if (addClass) {
            $(this).find('.ocwp-dropdown-nav').addClass('ocwp-active');
        }
    });
});
</script>
