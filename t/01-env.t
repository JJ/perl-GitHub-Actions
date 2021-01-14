use Test::More; # -*- mode: cperl -*-

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
  is( $github{'EVENT_NAME'}, 'push', "Activated by push" );
  is( lc($github{'REPOSITORY'}), 'jj/perl-github-actions', 'We are in the «main» branch' );
  is( $github{'REF'}, 'refs/heads/main', 'We are in the «main» branch' );
  is( $github{'SERVER_URL'}, 'https://github.com', 'We are in the «main» branch' );
  for my $n (qw(RUN_ID RUN_NUMBER) ) {
    like( $github{$n}, qr/\d+/, 'Run-related numbers are numbers' );
  }
  like( $github{'WORKSPACE'}, qr/GitHub/, "Workspace includes repo name" );
}


done_testing;
