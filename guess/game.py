from dataclasses import dataclass
import random


@dataclass
class Game:
    """Simple number guessing game."""

    lower: int = 1
    upper: int = 10
    secret: int | None = None

    def __post_init__(self) -> None:
        if self.secret is None:
            self.secret = random.randint(self.lower, self.upper)

    def guess(self, n: int) -> str:
        if not isinstance(n, int):
            raise TypeError("guess must be an int")
        if n < self.lower or n > self.upper:
            return "out-of-range"
        if n < self.secret:  # type: ignore[operator]
            return "too-low"
        if n > self.secret:  # type: ignore[operator]
            return "too-high"
        return "correct"
