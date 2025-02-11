use Test::More; # -*- mode: cperl -*-
use Test::Exit;

use lib qw(lib ../lib);

use GitHub::Actions;

subtest "Test assignment directly" => sub {
  exits_zero { exit_action; } "exit_action exits";

  $EXIT_CODE = 1;
  exits_ok { exit_action; } "exit_action exits with nonzero code";

  $EXIT_CODE = 33;
  is exit_code { exit_action; }, 33, "Exits with correct exit code";
};

subtest "Test exit after actions" => sub {
  error("Foo");
  is exit_code { exit_action; }, 1, "Exits with correct exit code";

  $EXIT_CODE= 0;
  error_on_file( "foo ", 33 );
  is exit_code { exit_action; }, 1, "Exits with correct exit code";
};

done_testing;
