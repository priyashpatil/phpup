<?php

namespace Pronskiy\Phpup\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Composer\Console\Application as ComposerApplication;

class ComposerCommand extends Command
{
    protected static $defaultName = 'composer';

    protected function configure()
    {
        $this->setDescription('Run Composer');
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        putenv('COMPOSER_ALLOW_XDEBUG=1');
        $composerApp = new ComposerApplication();
        return $composerApp->run();
    }
}
