use Test::More tests; # -*- mode: cperl -*-

use lib qw(lib ../lib);

BEGIN {
  $ENV{'GITHUB_FOO'} = 'foo';
  $ENV{'GITHUB_BAR'} = 'bar';
}

use GitHub::Actions;

for my $k (qw( foo bar ) ) {
  is( $github{uc($k)}, $k, "Key «$k» set" );
}

if ( $ENV{CI} ) { # We're in an actual Github Action
  is( $github{'ACTOR'}, 'JJ', 'Action run by us' );
  for my $n (qw(RUN_ID RUN_NUMBER) ) {
    like( $n, /\d+/, 'Run-related numbers are numbers' );
  }
}


done_testing;
