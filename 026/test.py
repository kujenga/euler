import unittest
from decimal import getcontext

from main import str_for_frac, repeating_seq_len

class TestMain(unittest.TestCase):

    def test_repeating_seq_len(self):
        # Extended precision to find cycles accurately.
        getcontext().prec = 10000

        for (i, expect) in [
            (2, -1),
            (3, 1),
            (4, -1),
            (5, -1),
            (6, 1),
            (7, 6),
            (997, 166),
        ]:
            frac = str_for_frac(i)
            got = repeating_seq_len(frac)
            print(frac, got)
            self.assertEqual(got, expect, "Should match")


if __name__ == '__main__':
    unittest.main()
