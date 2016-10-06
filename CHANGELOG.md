# cron Cookbook CHANGELOG
This file is used to list changes made in each version of the cron cookbook.

## 3.0.0 (2016-10-06)
- Remove support for Arch and Gentoo as we lack the ability to test these platforms
- Fix the installation of the core-os package on Solaris

## 2.0.0 (2016-09-15)
- Update supported OS releases in the readme
- Switch to kitchen-dokken and test on more platforms
- Resolve foodcritic warnings
- Split out unit testing in travis and use the rakefile with cookstyle
- Require chef 12.1
- Properly define the chefspec matcher
- Use multipackage for installs

## v1.7.6 (2016-03-23)
- Cleanup the cron.d jobs with the non-santized filenames to prevent duplicate job jobs if cron < 1.7.4 was ever run on the node

## v1.7.5 (2016-03-01)
- Fixes '* is not valid value for validate_numeric' errors

## v1.7.4 (2016-02-16)
- Sanitize cron job names in the custom resource to replace '.' with '-'

## v1.7.3 (2015-12-20)
- Re-release to remove DS Store file that snuck in

## v1.7.2 (2015-12-14)
- Fixed the inability to delete a cron job without specifying the command. Expanded tests to cover this scenario and the create_if_missing action

## v1.7.1 (2015-12-11)
- #65 - Added action create_if_missing for cron jobs you want to create, but not modify later

## v1.7.0 (2015-10-05)
- Added Arch Linux support
- Added FreeBSD support, which emulates /etc/cron.d folder support and builds a single /etc/crontab file using the contents of /etc/cron.d
- Ensure that the cron package is installed on Debian based systems
- Updated Kitchen CI to use new format and additional platforms
- Added standard Rubocop config for Chef managed cookbooks and resolved all warnings
- Added Travis CI testing for foodcritic, rubocop, and chefspec
- Added Serverspec tests for Kitchen CI
- Updated Berkfile to the latest format
- Updated contributing and testing documentation
- Updated Gemfile dependencies to the latest releases of testing gems
- Removed pre-1.9 Ruby hash rocket syntax
- Added maintainers.md and maintainers.toml files
- Added cookbook version and Travis CI badges to the readme
- Clarified that the minimum supported Chef release is 11.0
- Added a Rakefile for easier testing
- Added chefignore file to limit what files are uploaded to the Chef server
- Added long_description to the metadata.rb file
- Added source_url and issues_url to the metadata.rb file for Supermarket
- Updated Chefspec for 4.X format

## v1.6.1 (2014-10-15)
- [#48] fix typo apry -> apr

## v1.6.0 (2014-09-24)
- [36] Add environment parameter to LWRP
- [38] Allow user to specify file permissions

## v1.5.0 (2014-09-15)
- [#25] Fixes NameError exception on :delete
- [#33] Updates README
- [#40] Fixes local test-kitchen config
- [#20] Implements a comment for cron_d provider

## v1.4.3 (2014-09-09)
- [#46] Fixes a broken case statement causing cron_d to fail

## v1.4.2 (2014-09-08)
- [#31] Fix up validate_month for Fixnums
- [#32] Fix upvalidate_dow for Fixnums

## v1.4.0 (2014-05-07)
- [COOK-4628] Adding cron_manage to allow or deny users

## v1.3.12 (2014-04-23)
- [COOK-4550] - cron_d resource sometimes does not print the time in the cron output
- PR #23 fix validate month and dow
- Updating test harness, adding specs

## v1.3.10 (2014-04-10)
- [COOK-4507] - restore ability to use @ fields

## v1.3.8 (2014-04-10)
- [COOK-4544] fixing NameError exception on :delete action

## v1.3.6 (2014-04-09)
- [COOK-4337] fixing validations

## v1.3.4 (2014-04-09)
- Reverting [COOK-4337] - cron cookbook does no input validation

## v1.3.2 (2014-03-27)
- [COOK-4337] - cron cookbook does no input validation
- [COOK-4229] - Support the Gentoo package

## v1.3.0 (2014-02-25)
### New Feature
- **[COOK-4112](https://tickets.chef.io/browse/COOK-4112)** - Solaris 11 support for cron

### Bug
- **[COOK-3813](https://tickets.chef.io/browse/COOK-3813)** - Add metadata for recipes in the cron cookbook

## v1.2.8
### Bug
- **[COOK-3452](https://tickets.chef.io/browse/COOK-3452)** - Add support for raspbian platform

## v1.2.6
### Improvement
- **[COOK-3005](https://tickets.chef.io/browse/COOK-3005)** - Remove blankline in template

## v1.2.4
- [COOK-3058]: simplify conditionals in cron recipe

## v1.2.2
- [COOK1829] - `cron_d` LWRPtemplate should imply cron cookbook by default

## v1.2.0
- [COOK-938] - don't default to upgrading cron and fix rhel6 package name
- [COOK-1622] - add LWRP for cron.d files

## v1.0.4
- [COOK-1514] - Cron cookbook manages wrong service name on SuSE

## v1.0.0
- [COOK-1124] - add RHEL platform support
