"""
https://projecteuler.net/problem=30
"""

import argparse
import functools


def digit_nth_power(i, power):
    num = i
    # First digit is the accumulator in the reduce call below
    digits = [0]
    while num != 0:
        d = num % 10
        num = int(num / 10)
        digits.append(d)

    nth_power = functools.reduce(lambda acc, d: acc + d ** power, digits)
    if i == nth_power:
        print(i, digits, nth_power)
        return True
    else:
        return False



def main():
    parser = argparse.ArgumentParser(description='Solve Euler Problem 29')
    # Setup for brute force
    parser.add_argument('--max', type=int, default=10000000)
    parser.add_argument('--power', type=int, default=5)
    args = parser.parse_args()

    digit_powers = []
    for i in range(2, args.max):
        if digit_nth_power(i, args.power):
            digit_powers.append(i)

    powers_sum = sum(digit_powers)
    print(f'Digit fifth powers: {digit_powers} sum to: {powers_sum}')


if __name__ == '__main__':
    main()
