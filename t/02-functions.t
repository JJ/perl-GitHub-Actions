use Test::More; # -*- mode: cperl -*-

use lib qw(lib ../lib);

use GitHub::Actions;
use Test::Output;

sub setting_output {
  set_output('FOO','BAR');
}

stdout_is(\&setting_output,"::set-output name=FOO::BAR\n", "Sets output" );


done_testing;
