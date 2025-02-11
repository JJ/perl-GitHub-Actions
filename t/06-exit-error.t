use Test::More; # -*- mode: cperl -*-

use lib qw(lib ../lib);

use GitHub::Actions;

is( $EXIT_CODE, 0, "Default is 0");

error( "foo ");
is( $EXIT_CODE, 1, "error sets non-zero exit code");

$EXIT_CODE = 0; # Reset
error_on_file( "foo ", 33 );
is( $GitHub::Actions::EXIT_CODE, 1, "error_on_file sets non-zero exit code");

done_testing;
