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

sub setting_debug {
  debug('FOO');
}

stdout_is(\&setting_debug,"::debug::FOO\n", "Sets output with empty value" );

sub setting_error {
  error('FOO');
}

stdout_is(\&setting_error,"::error::FOO\n", "Sets error with FOO value" );

sub setting_error_on_file {
  error_on_file('FOO', 'foo.pl', 1,1 );
}
stdout_is(\&setting_error_on_file,"::error file=foo.pl,line=1,col=1::FOO\n", "Sets error with FOO value" );

done_testing;
