# Python/uv Application Template

This is a non-package Python 3.13+ application. Keep executable code in `src/` and tests in `tests/`.

## Setup and validation

- Run `just install` after cloning to install the locked Bun and uv dependencies and enable the pre-commit hook.
- `just full-check`/`just full-write` also format TOML files via `taplo`, which must be installed separately (e.g.
  `brew install taplo` or `cargo install taplo-cli`) — it is not managed by `just install`.
- Run `just full-check` for formatting, linting, and type checks; use `just full-write` for safe fixes.
- Run `just test [pytest args]`; use `uv run pytest --cov=src` when coverage is needed.
- Run `just pre-commit` to invoke the staged-file hook manually.

## Dependencies and generated state

- Add runtime dependencies with `uv add <package>` and development-only dependencies with
  `uv add --group dev <package>`.
- Keep Ruff, pytest, and Prettier caches below `.cache/`; do not add generated dependency or cache directories to Git.
- Use the local Bun-pinned Prettier through just recipes rather than a globally installed formatter.
