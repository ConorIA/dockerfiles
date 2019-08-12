#!/bin/bash
SENDMAIL=/usr/sbin/sendmail
GPGIT=/opt/gpgit/gpgit.pl
GPGIT_ARGS='' 
#encrypt and resend directly from stdin
set -o pipefail
${GPGIT} ${GPGIT_ARGS} "$4" | ${SENDMAIL} "$@"
 
exit $?

