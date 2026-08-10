/** @type {import("lint-staged").Configuration} */
export default {
  "**/*.{md,json,jsonc,yaml,yml}":
    "bunx --no-install prettier --write --cache --cache-location .cache/prettier/.prettier-cache --log-level warn",
  "*.py": [() => "just ruff-check", () => "just pyright-check", () => "just test"],
};
