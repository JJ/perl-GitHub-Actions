#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use Git;

my $repo = Git->repository (Directory => '.');

my $user_name = $ENV{'USER_NAME'} // $ENV{'GITHUB_ACTOR'};
my $email = $ENV{'EMAIL'};
my $commit_msg = $ENV{'MY_COMMIT_MSG'} // "No message";
if ( $repo->command( 'status', '-s' ) ) {
  $repo->command('config', '--global', 'user.email', $email);
  $repo->command('config', '--global', 'user.name', $user_name );
  $repo->command('commit', '-am', $commit_msg );
  $repo->command('push');
}
