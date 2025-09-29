from .game import Game


def main() -> None:  # pragma: no cover
    print("Welcome to Guess! I'm thinking of a number between 1 and 10.")
    game = Game()
    while True:
        try:
            raw = input("Your guess: ").strip()
            if not raw:
                print("Bye!")
                return
            n = int(raw)
        except ValueError:
            print("Please enter a number.")
            continue

        result = game.guess(n)
        if result == "too-low":
            print("Too low!")
        elif result == "too-high":
            print("Too high!")
        elif result == "out-of-range":
            print("Stay within 1..10.")
        else:
            print("Correct! 🎉")
            break


if __name__ == "__main__":  # pragma: no cover
    main()
