# UV Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A minimal Python 3.13+ application template using uv, Ruff, Pyright, pytest, Bun-managed Prettier, taplo, and just.

## Get Started

1. Create a repository from this template and update the metadata in `pyproject.toml`.
2. Install the local development toolchain:

   ```bash
   just install
   ```

3. Run the starter application:

   ```bash
   uv run python src/main.py
   ```

`just install` installs the locked Bun and Python dependencies and enables the local pre-commit hook. Install
[`taplo`](https://taplo.tamasfe.dev/) separately (e.g. `brew install taplo`) for TOML formatting.

## Development

```bash
# Check formatting, linting, and types
just full-check

# Apply safe formatting and lint fixes
just full-write

# Run tests, optionally passing pytest arguments
just test
just test tests/test_main.py
uv run pytest --cov=src

# Run the staged-file hook manually
just pre-commit
```

Tool caches are kept below `.cache/`; generated dependencies and local agent state are ignored.

## Dependencies

```bash
# Add an application dependency
uv add requests

# Add a development-only dependency
uv add --group dev pytest-mock

# Remove a dependency
uv remove requests
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
