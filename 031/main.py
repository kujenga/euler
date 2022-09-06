"""
https://projecteuler.net/problem=31

Helper: https://www.geeksforgeeks.org/combinational-sum/
"""


def combinations_sum(coins, sum):
    results = []

    # TODO: Figure out the answer!

    return results


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

    ways = combinations_sum(coins, target_amt)
    print('Possible ways:', len(ways), ways)


if __name__ == '__main__':
    main()
