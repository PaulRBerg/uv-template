"""Tests for the main module."""

from src.main import greet


def test_greet_default() -> None:
    """Test greet with default argument."""
    assert greet() == "Hello, World!"


def test_greet_custom_name() -> None:
    """Test greet with custom name."""
    assert greet("Python") == "Hello, Python!"
