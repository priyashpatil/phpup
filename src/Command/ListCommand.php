<?php

namespace Pronskiy\Phpup\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class ListCommand extends Command
{
    protected static $defaultName = 'list';

    protected function configure()
    {
        $this->setDescription('List available commands');
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $vendorBinPath = __DIR__ . '/../../vendor/bin/';
        $files = scandir($vendorBinPath);
        foreach ($files as $file) {
            if ($file === '.' || $file === '..') {
                continue;
            }
            $output->writeln($file);
        }

        return Command::SUCCESS;
    }
}
