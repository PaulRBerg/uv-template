# Python/uv Application Template

This repository is a non-package Python 3.13+ application. Keep executable code in `src/` and tests in `tests/`. Tests
import application code as `src.<module>`.

## Setup and Validation

- Install `taplo` before you run any `just` recipe. The justfile requires it at load time, so `just install` also fails
  without it. `just install` does not install `taplo`.
- Run `just install` after cloning. It installs the locked Bun and uv dependencies and enables the pre-commit hook.
- Run `just full-check` for formatting, linting, and type checks. Use `just full-write` for safe fixes.
- Run `just test [pytest args]`. Use `uv run pytest --cov=src` when you need coverage.
- Run `just pre-commit` to run the staged-file hook manually.

## Commits

- Stage whole files. The pre-commit hook rejects a commit when a staged file also has unstaged changes.
- Expect a staged `*.py` file to trigger Ruff, Pyright, and the full test suite in the hook.

## Dependencies and Generated State

- Add runtime dependencies with `uv add <package>`. Add development-only dependencies with
  `uv add --group dev <package>`.
- Keep Ruff, pytest, and Prettier caches below `.cache/`. Do not add generated dependency or cache directories to Git.
- Use the local Bun-pinned Prettier through `just` recipes, not a globally installed formatter.
