# UV Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A minimal Python 3.14+ application template using uv, Ruff, Pyright, pytest, Bun-managed Prettier, taplo, and just.

## Get Started

1. Create a repository from this template and update the metadata in `pyproject.toml`.
2. Install [`taplo`](https://taplo.tamasfe.dev/) (e.g. `brew install taplo`). Every `just` recipe requires it.
3. Install the local development toolchain:

   ```bash
   just install
   ```

4. Run the starter application:

   ```bash
   uv run python src/main.py
   ```

`just install` installs the locked Bun and Python dependencies and enables the local pre-commit hook.

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

Ruff, pytest, and Prettier caches are kept below `.cache/`. Dependency directories and tool state are git-ignored.

## Dependencies

```bash
# Add an application dependency
uv add requests

# Add a development-only dependency
uv add --group dev pytest-mock

# Remove a dependency
uv remove requests
```

## Contributing

See [AGENTS.md](AGENTS.md) for development rules.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
