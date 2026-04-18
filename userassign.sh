#!/usr/bin/env bash
set -euo pipefail

add_to_group() {
  local group="$1"
  local user="$2"

  if ! ipa group-show "$group" >/dev/null 2>&1; then
    echo "Grupo no encontrado: $group"
    return 1
  fi

  if ! ipa user-show "$user" >/dev/null 2>&1; then
    echo "Usuario no encontrado: $user"
    return 1
  fi

  echo "Agregando usuario '$user' al grupo '$group'..."
  ipa group-add-member "$group" --users="$user"
}

add_to_group "linux-admins" "admin"
add_to_group "infra-admins" "infra"
add_to_group "infra-admins" "backups"
add_to_group "security-admins" "itsecurity"
add_to_group "devops-admins" "automation"
add_to_group "monitoring-admins" "alerts"
add_to_group "readonly-auditors" "support"

echo
echo "Asignacion de grupos completada."
echo "Pendientes de clasificar: postmaster, noreply, info, billing"
