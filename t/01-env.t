use Test::More tests => 2; # -*- mode: cperl -*-

use lib qw(lib ../lib);

BEGIN {
  $ENV{'GITHUB_FOO'} = 'foo';
  $ENV{'GITHUB_BAR'} = 'bar';
}

use GitHub::Actions;

for my $k (qw( foo bar ) ) {
  is( $github{uc($k)}, $k, "Key «$k» set" );
}


done_testing;
