function activate() {
	source ./.venv/bin/activate
}

functions bats() {
  BATS_RUN_SKIPPED=true command bats *.bats
}

layout_uv() {
  UV=$(which uv || true)
  if [ -z "$UV" ]; then
    log_error "uv not found"; return
  fi

  export VIRTUAL_ENV="$PWD/.venv"

  [ -f pyproject.toml ] || $UV init --no-readme

  [ -d ".venv" ] || $UV python install -q && $UV venv .venv -q

  $UV sync

  PATH_add "$VIRTUAL_ENV/bin"
}
