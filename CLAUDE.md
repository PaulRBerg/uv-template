# Context

This is a Python project using uv for dependency management.

## Project Structure

```
.
├── .venv/         # Virtual environment (auto-created by uv)
├── src/           # Source code
├── tests/         # Test files
├── justfile       # Development commands
└── pyproject.toml # Project configuration
```

## Development Workflow

### Setup

```bash
# Install dependencies
uv sync
```

### Running Code

```bash
# Run the main script
uv run python src/main.py

# Run any Python command
uv run python -m <module>
```

### Testing

```bash
# Run all tests
just test

# Run specific test file
uv run pytest tests/test_main.py

# Run with coverage
uv run pytest --cov=src
```

### Code Quality

```bash
# Full check (all validations)
just full-check

# Full write (auto-fix everything possible)
just full-write

# Individual checks
just ruff-check      # Linting and formatting
just pyright-check   # Type checking
just prettier-check  # Markdown formatting
```

### Adding Dependencies

```bash
# Runtime dependency
uv add <package>

# Development dependency
uv add --dev <package>

# Remove dependency
uv remove <package>
```

## Tool Configuration

- **Ruff**: Configured in `ruff.toml`
- **Pyright**: Configured in `pyrightconfig.json`
- **Pytest**: Configured in `pyproject.toml` under `[tool.pytest.ini_options]`
- **Prettier**: Configured in `.prettierrc.yml`

## Guidelines

- Keep functions small and focused
- Write tests for new features
- Run `just full-check` before committing
- Use type hints for all function signatures
- Follow PEP 8 style (enforced by Ruff)
