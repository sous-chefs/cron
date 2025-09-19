# cron Cookbook CHANGELOG

This file is used to list changes made in each version of the cron cookbook.

## Unreleased

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

## 7.0.29 - *2025-09-04*

## 7.0.28 - *2024-11-18*

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

## 7.0.27 - *2024-07-15*

Standardise files with files in sous-chefs/repo-management

## 7.0.26 - *2024-05-23*

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

## 7.0.25 - *2024-05-02*

## 7.0.24 - *2024-05-02*

## 7.0.23 - *2023-12-21*

## 7.0.22 - *2023-09-28*

## 7.0.21 - *2023-09-04*

## 7.0.20 - *2023-07-10*

## 7.0.19 - *2023-05-17*

## 7.0.18 - *2023-04-17*

## 7.0.17 - *2023-04-07*

Standardise files with files in sous-chefs/repo-management

## 7.0.16 - *2023-04-01*

## 7.0.15 - *2023-04-01*

## 7.0.14 - *2023-04-01*

Standardise files with files in sous-chefs/repo-management

## 7.0.13 - *2023-03-20*

Standardise files with files in sous-chefs/repo-management

## 7.0.12 - *2023-03-15*

Standardise files with files in sous-chefs/repo-management

## 7.0.11 - *2023-03-02*

- Standardise files with files in sous-chefs/repo-management

## 7.0.10 - *2023-02-23*

- Standardise files with files in sous-chefs/repo-management

## 7.0.9 - *2023-02-23*

- Standardise files with files in sous-chefs/repo-management
- Remove delivery

## 7.0.8 - *2023-02-16*

Standardise files with files in sous-chefs/repo-management

## 7.0.7 - *2023-02-15*

Standardise files with files in sous-chefs/repo-management

## 7.0.6 - *2023-02-14*

## 7.0.5 - *2022-12-11*

Standardise files with files in sous-chefs/repo-management

Standardise files with files in sous-chefs/repo-management

## 7.0.4 - *2022-02-17*

- Standardise files with files in sous-chefs/repo-management
- Remove delivery folder

## 7.0.3 - *2021-08-30*

- Standardise files with files in sous-chefs/repo-management

## 7.0.2 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 7.0.1 - *2021-05-13*

- Make unified_mode calls conditional for Chef < 15.3 compatibility

## 7.0.0 - *2021-05-13*

- Replace recipes and attributes with Chef 17 compliant resources
  - Remove attributes
  - Remove recipes
  - Replace default recipe with package and service resource
  - Enable unified_mode on all resources
- Correct cron.allow/deny permissions for Debian base distros

## 6.4.0 - *2021-01-24*

- Sous Chefs Adoption
- Standardise files with files in sous-chefs/repo-management

## 6.3.1 (2020-06-09)

- Ensure we have both resource_name and provides in resources - [@tas50](https://github.com/tas50)

## 6.3.0 (2020-03-24)

- Expand tests and fix Amazon tests - [@tas50](https://github.com/tas50)
- Update copyrights - [@tas50](https://github.com/tas50)
- Remove support for SLES 11 and simplify package logic - [@tas50](https://github.com/tas50)
- Update specs for newer platforms - [@tas50](https://github.com/tas50)
- Simplify platform check logic - [@tas50](https://github.com/tas50)
- Require Chef 12.15+ - [@tas50](https://github.com/tas50)
- Update platforms we test on - [@tas50](https://github.com/tas50)
- Update how we define the resource names / provides - [@tas50](https://github.com/tas50)

## 6.2.2 (2019-09-30)

- Avoid deprecation warnings post Chef 14.4 - [@tas50](https://github.com/tas50)
- Resolve cookstyle warnings - [@tas50](https://github.com/tas50)

## 6.2.1 (2018-09-04)

- Added a note to the readme announcing the deprecation of the cron_d and cron_access resources in this cookbook. As both of these resources shipped in Chef 14.4 they will be deprecated when Chef 15.4 ships in Aug 2019.

## 6.2.0 (2018-07-24)

- Finish the random_delay property begun [in](https://github.com/chef-cookbooks/cron/pull/103)

## 6.1.1 (2018-05-11)

- Add missing type for cron_name property
- Add specs for additional platforms
- Faise with a better message on non-Linux platforms in the cron_d resource

## 6.1.0 (2018-05-11)

- Converted chef_manage definition to a custom resource using the accumulator pattern. This will allow for reporting and notification from these resources as they are now real resources. The existing cron_manage name was changed to cron_access, but the existing name will continue to function.
- Remove the file used with monolithic cron file hosts to fake cron.d. This was unused since 6.0 removed that functionality.

## 6.0.0 (2018-05-11)

- The cron_d resource no longer provides crontab emulation on FreeBSD or Solaris. This is outside the scope of this resource and users on platforms without cron.d support should instead use Chef's build in cron resource which manages the monolithic cron config.
- define pld linux package and service name used for cron
- Simplify how we validate the predfined_value property to provide better error messages
- Add a name_property if you want a more descriptive resource name
- Make sure cron files are 0600 not 0644 for CIS compliance
- Document the comment property in the readme
- Create a single test suite to speed up testing

## 5.1.0 (2018-03-19)

- Add support for Amazon Linux 2.0
- Remove Chef 12 testing since Chef 12 goes EOL in just a few weeks
- Test Amazon Linux / Ubuntu 18.04 and Chef 14
- Remove ChefSpec matchers since these are autogenerated now. If this causes failurs then you need to update to the latest ChefDK release

## 5.0.1 (2017-11-16)

- Remove the redundant name property in the cron_d resource

## 5.0.0 (2017-10-23)

- Require Chef 12.7+ and remove compat_resource dependency
- Improve the readme layout
- Update Travis CI testing to test Chef 12/13 and also Debian 9

## 4.2.0 (2017-10-23)

- Activate RANDOMDELAY in cron.d template
- Add support and testing for SLES 11
- Update and improve testing setup

## 4.1.3 (2017-06-01)

- Converting integration testing to InSpec

## 4.1.2 (2017-05-30)

- Remove class_eval usage
- Require Chef 12.1 not 12.5 since we use compat_resource

## 4.1.1 (2017-04-11)

- Ensure compatibility with Chef 12.5-12.6
- chef-client 13 amazon linux fix

## 4.1.0 (2017-03-13)

- Move files out of default dirs since only Chef 11 required that
- Fix the namespacing and cookstyle violations in validators (Fixes #80)
- Add compat_resource depends so that Chef 12.5 is really supported
- Remove the hostname from templates
- Rename the test cookbook to test
- make env variables safe if they span lines

## 4.0.0 (2017-03-07)

- Convert cron_d from a LWRP to a custom resource, which raises the requirement for chef-client to 12.5+
- Fix failures on Suse and add it to the readme/metadata as a supported platform
- Test with Local Delivery and not Rake

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

- Fixes `* is not valid value for validate_numeric` errors

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
