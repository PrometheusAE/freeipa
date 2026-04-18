#!/usr/bin/env bash
set -euo pipefail

DOMAIN="automata.engineer"
DEFAULT_SHELL="/bin/bash"

create_user() {
  local uid="$1"
  local first="$2"
  local last="$3"
  local email="${uid}@${DOMAIN}"

  echo "Creando usuario: ${uid} (${email})"

  ipa user-add "$uid" \
    --first="$first" \
    --last="$last" \
    --email="$email" \
    --shell="$DEFAULT_SHELL"
}

create_user "postmaster" "Postmaster" "Service"
create_user "admin" "Admin" "Service"
create_user "support" "Support" "Service"
create_user "alerts" "Alerts" "Service"
create_user "noreply" "NoReply" "Service"
create_user "itsecurity" "IT" "Security"
create_user "backups" "Backups" "Service"
create_user "infra" "Infra" "Service"
create_user "automation" "Automation" "Service"
create_user "info" "Info" "Service"
create_user "billing" "Billing" "Service"

echo "Todos los usuarios fueron procesados."
