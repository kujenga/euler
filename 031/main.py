"""
https://projecteuler.net/problem=31
"""


def main():
    # Target amount is: £2 (200p)
    target_amt = 200

    def count_range(amount):
        return range(0, int(target_amt/amount) + 1)

    ways = 0
    wealth = 0
    for twolbs in count_range(200):
        for onelbs in count_range(100):
            for fifties in count_range(50):
                for twenties in count_range(20):
                    print(f"{ways} ways found: 200*{twolbs} + 100*{onelbs} + 50*{fifties} + 20*{twenties} ...")
                    for tens in count_range(10):
                        for fives in count_range(5):
                            for twos in count_range(2):
                                for ones in count_range(1):
                                    wealth = twolbs*200 + onelbs*100 + fifties*50 + twenties*20 + tens*10 + fives*5 + twos*2 + ones*1
                                    if wealth == target_amt:
                                        ways += 1


    print('Possible ways:', ways)


if __name__ == '__main__':
    main()
