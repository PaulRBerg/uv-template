# UV Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A modern Python project template using uv for fast, reliable dependency management.

## What's Inside

- [uv](https://github.com/astral-sh/uv) - Fast Python package and project manager
- [Python 3.12+](https://www.python.org/) - Modern Python with type hints
- [Ruff](https://github.com/astral-sh/ruff) - Fast Python linter and formatter
- [pytest](https://pytest.org/) - Testing framework
- [Pyright](https://github.com/microsoft/pyright) - Static type checker
- [Prettier](https://prettier.io/) - Markdown formatter
- [just](https://github.com/casey/just) - Command runner

## Getting Started

### Using as a Template

1. Create a new repository from this template on GitHub
2. Clone your new repository
3. Update `pyproject.toml` with your project details
4. Run `uv sync` to install dependencies

### Manual Setup

```bash
# Clone the repository
git clone <your-repo-url>
cd <your-project>

# Install dependencies
uv sync

# Run the application
uv run python src/main.py
```

## Features

### Fast Dependency Management

uv provides 10-100x faster package installation compared to pip, with automatic virtual environment management and
cross-platform lockfiles.

### Type Safety

Pyright provides static type checking to catch errors before runtime:

```bash
just pyright-check
```

### Code Quality

Ruff handles both linting and formatting with extreme speed:

```bash
just ruff-check  # Check for issues
just ruff-write  # Auto-fix issues
```

### Testing

pytest makes writing and running tests simple:

```bash
just test
```

## Sensible Defaults

This template includes configuration for:

- `.gitignore` - Common Python artifacts
- `.prettierrc.yml` - Markdown formatting
- `.python-version` - Python version pinning
- `pyproject.toml` - Project metadata and tool configuration
- `pyrightconfig.json` - Type checking rules
- `ruff.toml` - Linting and formatting rules
- `justfile` - Common development commands

## Usage

### Common Commands

```bash
# Run all checks
just full-check

# Run all checks and auto-fix issues
just full-write

# Run specific checks
just ruff-check
just pyright-check
just prettier-check
just test

# Auto-fix specific issues
just ruff-write
just prettier-write
```

### Adding Dependencies

```bash
# Add a runtime dependency
uv add requests

# Add a development dependency
uv add --dev black

# Remove a dependency
uv remove requests
```

### Python Version Management

```bash
# Install Python versions
uv python install 3.12

# Pin Python version
uv python pin 3.12
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
