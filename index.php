<?php

const PHPUP_VERSION = '0.2.0';

// Ensure Phar extension is loaded
if (!extension_loaded('phar')) {
    die("Phar extension is not loaded. Please rebuild with Phar support.\n");
}

// Set up autoloader
$autoloadPath = __DIR__ . '/vendor/autoload.php';
if (file_exists($autoloadPath)) {
    require_once $autoloadPath;
} else {
    die("Autoloader not found. Please ensure the project is correctly built.\n");
}

use Symfony\Component\Console\Application;
use Pronskiy\Phpup\Command\ListCommand;
use Pronskiy\Phpup\Command\ComposerCommand;
use Pronskiy\Phpup\Command\ConductorCommand;
use Pronskiy\Phpup\Command\LocusCommand;

$application = new Application('phpup', PHPUP_VERSION);

$application->add(new ListCommand());
$application->add(new ComposerCommand());
$application->add(new ConductorCommand());
// $application->add(new LocusCommand());

$application->run();
