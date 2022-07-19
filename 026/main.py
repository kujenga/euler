"""
https://projecteuler.net/problem=26
"""
import logging
from decimal import Decimal, getcontext


logging.basicConfig(level=logging.INFO)


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
            repeats = True
            repeatIdx = 0
            while True:
                start = idx + repeatIdx * len(target)
                end = idx + (repeatIdx + 1) * len(target)
                if end + 1 > len(s):
                    # It repeats through the end of the string
                    break
                val = s[start:end]
                if val != target:
                    repeats = False
                    break
                repeatIdx += 1
            if not repeats:
                continue

            return len(target)
    return -1


def str_for_frac(i):
    return str(Decimal(1)/Decimal(i))


def main():

    # Extended precision to find cycles accurately.
    getcontext().prec = 1000000

    lMax = -1
    iMax = -1
    for i in range(1, 1000):
        frac = str_for_frac(i)
        seqLen = repeating_seq_len(frac)
        if seqLen > lMax:
            lMax = seqLen
            iMax = i
        logging.debug(f'1/{i}: {frac}')
        logging.info(f'1/{i}: {seqLen}')
    print(f'Longest: {lMax}, for 1/{iMax}')


if __name__ == '__main__':
    main()
