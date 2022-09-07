"""
https://projecteuler.net/problem=29
"""

import argparse


def distinct_powers(max):
    s = set()
    for a in range(2, max + 1):
        for b in range(2, max + 1):
            power = a ** b
            s.add(power)
            print(a, b, a ** b)
    return len(s)


def main():
    parser = argparse.ArgumentParser(description='Solve Euler Problem 29')
    parser.add_argument('--max', type=int, default=5)
    args = parser.parse_args()

    count = distinct_powers(args.max)
    print(f'Distinct powers of a^b for 2 ≤ a ≤ {args.max} and 2 ≤ b ≤ {args.max}: {count}')  # noqa


if __name__ == '__main__':
    main()
