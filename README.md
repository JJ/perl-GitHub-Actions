# GitHub::Actions [![Checks the github action using itself](https://github.com/JJ/perl-GitHub-Actions/actions/workflows/self-test.yml/badge.svg)](https://github.com/JJ/perl-GitHub-Actions/actions/workflows/self-test.yml)

Use GitHub Actions workflow commands directly from Perl, generally using the
system Perl included in the runner.

## INSTALLATION

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test
	make install


## DEPENDENCIES

None (intentionally).

## HOW TO

After installation, use `perldoc GitHub::Actions` for the commands available
(generally a camel_cased version of the corresponding GitHub Action commands).

If you want to use this inside a GitHub action, you will have to use fatpack to
create a single command. For instance, 

```perl
#!/usr/bin/env perl

use strict;
use warnings;
use GitHub::Actions;

warning("Installed")
```

saved to `src/warning.pl` will have to be fatpacked via:

```
fatpack pack src/warning.pl > dist/warning
chmod +x dist/warning
```

and then, within a step:

```yaml
 	  - name: Test set_failed
        run: dist/warning
```

> Remember that Perl is installed, by default, in Linux GitHub runners

Remember this distribution has been created for use with the *system* Perl, so generally you will have to write `sudo cpan GitHub::Actions` in a prior step. Once it's been installed, this will work:

```yaml
	  - name: Test set_failed
        shell: perl {0}
        run: |
          use GitHub::Actions;
          system(".github/workflows/set_failed.pl");
          set_output( "Exit code is $?" );
```

## COPYRIGHT AND LICENCE

Copyright (C) 2021, JJ Merelo

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
