# See https://just.systems/man/en/settings.html
set allow-duplicate-recipes
set allow-duplicate-variables
set shell := ["bash", "-euo", "pipefail", "-c"]
set unstable

# ---------------------------------------------------------------------------- #
#                                 DEPENDENCIES                                 #
# ---------------------------------------------------------------------------- #

bun := require("bun")
uv := require("uv")

prettier := "bunx --no-install prettier"
prettier_cache := ".cache/prettier/.prettier-cache"
prettier_globs := "\"**/*.{md,json,jsonc,yaml,yml}\""

# ---------------------------------------------------------------------------- #
#                                   COMMANDS                                   #
# ---------------------------------------------------------------------------- #

# Show available commands
default:
    @just --list

# Install local formatting and Python dependencies
install:
    bun install
    uv sync --all-groups

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
    {{ uv }} run ruff check .
    {{ uv }} run ruff format --check .

# Auto-fix Python formatting and linting with ruff
ruff-write:
    {{ uv }} run ruff check --fix .
    {{ uv }} run ruff format .

# Check types with pyright
pyright-check:
    {{ uv }} run pyright

# Check documentation and configuration formatting
prettier-check +globs=prettier_globs:
    {{ prettier }} \
        --check \
        --cache \
        --cache-location {{ prettier_cache }} \
        --log-level warn \
        --no-error-on-unmatched-pattern \
        {{ globs }}

# Format documentation and configuration
prettier-write +globs=prettier_globs:
    {{ prettier }} \
        --write \
        --cache \
        --cache-location {{ prettier_cache }} \
        --log-level warn \
        --no-error-on-unmatched-pattern \
        {{ globs }}

# Run staged-file checks
pre-commit:
    sh .husky/pre-commit

# Run tests with pytest
test *args:
    {{ uv }} run pytest {{ args }}

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
