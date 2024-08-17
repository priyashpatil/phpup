<?php

namespace Pronskiy\Phpup\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Application as SymfonyApplication;

class ConductorCommand extends Command
{
    protected static $defaultName = 'conductor';

    protected function configure()
    {
        $this->setDescription('Run Conductor');
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        putenv('CONDUCTOR_ALLOW_XDEBUG=1');

        // Create a new Symfony Console Application for Conductor
        $conductorApp = new SymfonyApplication('Conductor', '0.2.0');

        // Try to load the Conductor commands dynamically
        $commandClasses = [
            'ArtisanBuild\Conductor\Console\Commands\InstallCommand',
            'ArtisanBuild\Conductor\Console\Commands\UninstallCommand',
            'ArtisanBuild\Conductor\Console\Commands\RunCommand'
        ];
        foreach ($commandClasses as $class) {
            if (class_exists($class)) {
                $conductorApp->add(new $class());
            } else {
                $output->writeln("<error>Could not load Conductor command: {$class}</error>");
            }
        }

        // Run the Conductor application
        return $conductorApp->run($input, $output);
    }
}
