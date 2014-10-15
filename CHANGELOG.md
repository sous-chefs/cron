v1.6.1 (2014-10-15)
-------------------
- [#48] fix typo apry -> apr

v1.6.0 (2014-09-24)
-------------------
- [36] Add environment parameter to LWRP
- [38] Allow user to specify file permissions

v1.5.0 (2014-09-15)
-------------------
- [#25] Fixes NameError exception on :delete
- [#33] Updates README
- [#40] Fixes local test-kitchen config
- [#20] Implements a comment for cron_d provider

v1.4.3 (2014-09-09)
-------------------
- [#46] Fixes a broken case statement causing cron_d to fail

v1.4.2 (2014-09-08)
-------------------
#31 - Fix up validate_month for Fixnums
#32 - Fix upvalidate_dow for Fixnums

v1.4.0 (2014-05-07)
-------------------
- [COOK-4628] Adding cron_manage to allow or deny users


v1.3.12 (2014-04-23)
--------------------
- [COOK-4550] - cron_d resource sometimes does not print the time in the cron output
- PR #23 fix validate month and dow
- Updating test harness, adding specs


v1.3.10 (2014-04-10)
--------------------
- [COOK-4507] - restore ability to use @ fields


v1.3.8 (2014-04-10)
-------------------
- [COOK-4544] fixing NameError exception on :delete action


v1.3.6 (2014-04-09)
-------------------
- [COOK-4337] fixing validations


v1.3.4 (2014-04-09)
-------------------
- Reverting [COOK-4337] - cron cookbook does no input validation


v1.3.2 (2014-03-27)
-------------------
- [COOK-4337] - cron cookbook does no input validation
- [COOK-4229] - Support the Gentoo package


v1.3.0 (2014-02-25)
-------------------
### New Feature
- **[COOK-4112](https://tickets.opscode.com/browse/COOK-4112)** - Solaris 11 support for cron

### Bug
- **[COOK-3813](https://tickets.opscode.com/browse/COOK-3813)** - Add metadata for recipes in the cron cookbook


v1.2.8
------
### Bug
- **[COOK-3452](https://tickets.opscode.com/browse/COOK-3452)** - Add support for raspbian platform

v1.2.6
------
### Improvement
- **[COOK-3005](https://tickets.opscode.com/browse/COOK-3005)** - Remove blankline in template

v1.2.4
------
- [COOK-3058]: simplify conditionals in cron recipe

v1.2.2
------
- [COOK1829] - `cron_d` LWRPtemplate should imply cron cookbook by default

v1.2.0
------
- [COOK-938] - don't default to upgrading cron and fix rhel6 package name
- [COOK-1622] - add LWRP for cron.d files

v1.0.4
------
- [COOK-1514] - Cron cookbook manages wrong service name on SuSE

v1.0.0
------
- [COOK-1124] - add RHEL platform support
