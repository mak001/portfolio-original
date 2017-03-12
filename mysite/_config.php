<?php

global $project;
$project = 'mysite';

global $databaseConfig;
$databaseConfig = array(
	'type' => 'MySQLDatabase',
	'server' => 'localhost',
	'username' => 'root',
	'password' => '',
	'database' => 'SS_portfolio',
	'path' => ''
);

// Set the site locale
i18n::set_locale('en_US');

BreadcrumbNavigation::$includeHome = false;
BreadcrumbNavigation::$includeSelf = true; 
BreadcrumbNavigation::$maxDepth = 20; 
BreadcrumbNavigation::$stopAtPageType = false; 
BreadcrumbNavigation::$showHidden = false; 
BreadcrumbNavigation::$homeURLSegment = 'home';

if (!Director::isDev()) {
    SS_Log::add_writer(new SS_LogFileWriter('../ss_error-warning.log', SS_Log::WARN, '<='));
    SS_Log::add_writer(new SS_LogFileWriter('../ss_error.log', SS_Log::ERR));
    SS_Log::add_writer(new SS_LogFileWriter('../ss_notices.log', SS_Log::NOTICE));
}