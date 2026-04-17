WEBHOOK="https://discord.com/api/webhooks/1494795796351291393/1xxq28VskSQS9SiSgy1ftWI-CkBRUTF7baTB_vrQ3Abyhj3giUTFBYbV7CT-Itt62HN5"

send_discord() {
  local message="$1"

  curl -s -H "Content-Type: application/json" \
       -X POST \
       -d "{\"content\": \"$message\"}" \
       "$WEBHOOK"
}

send_discord "test3"