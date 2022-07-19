"""
https://projecteuler.net/problem=26
"""
from decimal import Decimal, getcontext


def repeating_seq_len(s):
    # Look through the first quarter of the string for repeats
    for idx in range(1, int(len(s)/4)):
        # For each location in the string, look back at all possible repeats
        # that might not include the start of the decimal.
        for lookback in range(1, idx):
            # Figure out what the target is that we are looking for this
            # iteration.
            target = s[idx - lookback:idx]
            # Basic check if the target is repeated going forward.
            repeat1 = s[idx:idx + len(target)]
            if target != repeat1:
                continue
            repeat2 = s[idx + len(target):idx + 2*len(target)]
            if target != repeat2:
                continue

            return len(target)
    return -1


def str_for_frac(i):
    return str(Decimal(1)/Decimal(i))


def main():
    # Extended precision to find cycles accurately.
    getcontext().prec = 100000

    lMax = -1
    iMax = -1
    for i in range(1, 1000):
        frac = str_for_frac(i)
        seqLen = repeating_seq_len(frac)
        if seqLen > lMax:
            lMax = seqLen
            iMax = i
        print(f'1/{i}: {seqLen}')
    print(f'Longest: {lMax}, for 1/{iMax}')


if __name__ == '__main__':
    main()
