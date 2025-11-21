# See https://just.systems/man/en/settings.html
set allow-duplicate-recipes
set allow-duplicate-variables
set shell := ["bash", "-euo", "pipefail", "-c"]
set unstable

# ---------------------------------------------------------------------------- #
#                                   COMMANDS                                   #
# ---------------------------------------------------------------------------- #

# Install dependencies
install:
    uv sync --all-extras --dev

# ---------------------------------------------------------------------------- #
#                                    CHECKS                                    #
# ---------------------------------------------------------------------------- #

# Run all code checks
[group("checks")]
@full-check:
    just _run-with-status prettier-check
    just _run-with-status ruff-check
    just _run-with-status pyright-check
    echo ""
    echo -e '{{ GREEN }}All code checks passed!{{ NORMAL }}'
alias fc := full-check

# Run all code fixes
[group("checks")]
@full-write:
    just _run-with-status prettier-write
    just _run-with-status ruff-write
    echo ""
    echo -e '{{ GREEN }}All code fixes applied!{{ NORMAL }}'
alias fw := full-write

# Check Python formatting and linting with ruff
ruff-check:
    uv run ruff check .
    uv run ruff format --check .

# Auto-fix Python formatting and linting with ruff
ruff-write:
    uv run ruff check --fix .
    uv run ruff format .

# Check types with pyright
pyright-check:
    uv run pyright

# Check Markdown formatting with prettier (readonly)
prettier-check:
    prettier --check "**/*.{json,jsonc,md}"

# Auto-fix Markdown formatting with prettier
prettier-write:
    prettier --write "**/*.{json,jsonc,md}"

# Run tests with pytest
test:
    uv run pytest

# ---------------------------------------------------------------------------- #
#                                   UTILITIES                                  #
# ---------------------------------------------------------------------------- #

# Private recipe to run a check with formatted output
[no-cd]
@_run-with-status recipe:
    echo ""
    echo -e '{{ CYAN }}→ Running {{ recipe }}...{{ NORMAL }}'
    just {{ recipe }}
    echo -e '{{ GREEN }}✓ {{ recipe }} completed{{ NORMAL }}'
alias rws := _run-with-status
