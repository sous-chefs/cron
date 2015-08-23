#!/usr/bin/env bats

CRON_D='/etc/cron.d'


@test "creates bizarrely-scheduled-usage-report file" {
  grep "\*/5 1,23 2-5 \* \* appuser /srv/app/scripts/generate_report" ${CRON_D}/bizarrely-scheduled-usage-report
}

@test "creates multiple_commands file" {
  grep "10 \* \* \* \* root /opt/pkg/lib/test1.sh" ${CRON_D}/multiple_commands
  grep "10 \*/3  \* \* \* root /opt/pkg/lib/test2.sh" ${CRON_D}/multiple_commands
}

@test "creates nil_value_check file" {
  grep "\* \* \* \* \* appuser /bin/true" ${CRON_D}/nil_value_check
}

@test "creates no_value_check file" {
  grep "\* \* \* \* \* appuser /bin/true" ${CRON_D}/no_value_check
}

@test "creates predefined_value_check file" {
  grep "@midnight appuser /bin/true" ${CRON_D}/predefined_value_check
}

@test "creates fixnum-job file" {
  grep "0 1 2 \* \* appuser /bin/true" ${CRON_D}/fixnum-job
}

@test "creates test-weekday-usage-report file" {
  grep "45 13 \* \* 7 appuser /srv/app/scripts/generate_report" ${CRON_D}/test-weekday-usage-report
}

@test "creates test-month-usage-report file" {
  grep "0 6 \* 1 \* appuser /srv/app/scripts/generate_report" ${CRON_D}/test-month-usage-report
}
