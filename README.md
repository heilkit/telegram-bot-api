# Telegram Bot API (Docker)

The solo purpose of this package is to provide the most hands-free experience of running your own Telegram Bot API
server.

## Advantages of your own Telegram Bot API:

- Download files without a size limit.
- Upload files up to 2000 MB.
- Upload files using their local path and the file URI scheme.-
- Use an HTTP URL for the webhook.
- Use any local IP address for the webhook.
- Use any port for the webhook.
- Set max_webhook_connections up to 100000.
- Receive the absolute local path as a value of the file_path field without the need to download the file after a
  getFile request.

Official source: https://github.com/tdlib/telegram-bot-api.

## Setup via `docker compose` (recommended)

> **NOTE:** If you don't have Telegram app API keys, you could get them
> at https://core.telegram.org/api/obtaining_api_id.

> **NOTE:** These commands include `sudo`, you might need to replace/delete it depending on your system.

1. `git clone https://github.com/heilkit/telegram-bot-api && cd telegram-bot-api`
2. Provide your API ID and HASH in `.env` file.
3. `USER_ID="$(id -u)" GROUP_ID="$(id -g)" sudo docker compose up -d`

---
*Or you could use a
one-liner: `git clone https://github.com/heilkit/telegram-bot-api && cd telegram-bot-api && nano .env && USER_ID="$(id -u)" GROUP_ID="$(id -g)" sudo docker compose up`*

## Setup via classic Docker

1. `git clone https://github.com/heilkit/telegram-bot-api && cd telegram-bot-api`
2. Create storage directory, i.e., `/var/lib/telegram-bot-api` (replace it with something custom, if you wish, but make
   sure it matches the `-d` argument of `telegram-bot-api`).
3. Ensure, you put good permissions on the directory, `sudo setfacl -m u:$(id -u):rwx -R /var/lib/telegram-bot-api`.
4. `STORAGE=/var/lib/telegram-bot-api sudo docker run --name telegram-bot-api -u "$(id -u):$(id -g)" --restart=always -v $STORAGE:$STORAGE -d heilkit/telegram-bot-api -d $STORAGE -v 1 --local --api-id=<API_ID> --api-hash=<API_HASH>`

### [Project page on DockerHub](https://hub.docker.com/r/heilkit/telegram-bot-api)