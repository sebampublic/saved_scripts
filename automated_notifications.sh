WEBHOOK=""

send_discord() {
  local message="$1"

  curl -s -H "Content-Type: application/json" \
       -X POST \
       -d "{\"content\": \"$message\"}" \
       "$WEBHOOK"
}

send_discord "test3"
