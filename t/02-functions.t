use Test::More; # -*- mode: cperl -*-

use lib qw(lib ../lib);

use GitHub::Actions;
use Test::Output;

sub setting_output {
  set_output('FOO','BAR');
}

stdout_is(\&setting_output,"::set-output name=FOO::BAR\n", "Sets output" );

sub setting_empty_output {
  set_output('FOO');
}

stdout_is(\&setting_empty_output,"::set-output name=FOO::\n", "Sets output with empty value" );

done_testing;
