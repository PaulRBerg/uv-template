"""Main module for the application."""


def greet(name: str = "World") -> str:
    """Return a greeting message.

    Args:
        name: The name to greet. Defaults to "World".

    Returns:
        A greeting message.
    """
    return f"Hello, {name}!"


def main() -> None:
    """Run the main application."""
    message = greet()
    print(message)


if __name__ == "__main__":
    main()
