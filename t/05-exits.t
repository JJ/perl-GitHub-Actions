use Test::More; # -*- mode: cperl -*-
use Test::Exit;

use lib qw(lib ../lib);

use GitHub::Actions;

exits_zero { exit_action; } "exit_action exits";

$EXIT_CODE = 1;
exits_ok { exit_action; } "exit_action exits with nonzero code";

$EXIT_CODE = 33;
is exit_code { exit_action; }, 33, "Exits with correct exit code";

done_testing;
