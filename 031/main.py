"""
https://projecteuler.net/problem=31
"""

import itertools


def main():
    # Value in pence (p)
    coins = [
        1,
        2,
        5,
        10,
        20,
        50,
        100,
        200,
    ]
    # Target amount is: £2 (200p)
    target_amt = 200
    # Build a purse of the max amount of coins we could use from each type.
    purse = []
    max_l = 0
    for coin in coins:
        l = int(target_amt / coin)
        if l > max_l:
            max_l = l
        purse.extend([coin] * l)
    print('Purse:', purse)

    ways = set()
    for n in range(max_l + 1):
        print('Testing combinations of length:', n)
        for c in itertools.combinations(purse, n):
            s = sum(c)
            if s == 200 and c not in ways:
                ways.add(c)
                print(s, c)
    print('Possible ways:', len(ways), ways)


if __name__ == '__main__':
    main()
