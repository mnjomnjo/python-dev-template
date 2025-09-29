import unittest
from guess.game import Game


class TestGameClass(unittest.TestCase):
    def test_init_default_object(self):
        g = Game(secret=5)
        self.assertEqual(g.lower, 1)
        self.assertEqual(g.upper, 10)
        self.assertEqual(g.secret, 5)

    def test_guess_too_low(self):
        g = Game(secret=7)
        self.assertEqual(g.guess(3), "too-low")

    def test_guess_too_high(self):
        g = Game(secret=7)
        self.assertEqual(g.guess(9), "too-high")

    def test_guess_correct(self):
        g = Game(secret=7)
        self.assertEqual(g.guess(7), "correct")

    def test_guess_out_of_range(self):
        g = Game(secret=7)
        self.assertEqual(g.guess(0), "out-of-range")
        self.assertEqual(g.guess(11), "out-of-range")

    def test_guess_type_error(self):
        g = Game(secret=7)
        with self.assertRaises(TypeError):
            g.guess("3")  # type: ignore[arg-type]


if __name__ == "__main__":
    unittest.main()
