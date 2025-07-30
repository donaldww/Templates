export MY_CONFIG_DIR="$HOME/Developer/Templates"
. "$HOME/.cargo/env"

MY_ENV=home

if [[ "$USER" == "donwilso" ]]; then
  MY_ENV=work
fi

export MY_ENV
