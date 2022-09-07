# finds the all 1-9 pandigital multiplier, multiplicand, and product sets
# Project Euler problem 32

def main():
    l = []
    grandTotal = 0
    a = 1
    b = 1
    while a < 1000000000:
        while 1:
            c = a*b
            string = str(a)+str(b)+str(c)
            string = ''.join(sorted(string))
            if len(string) > 9:
                break
            if len(string) < 9:
                b += 1
                continue
            tst = 0
            if len(string) == 9:
                for i, ch in enumerate(string):
                    if int(ch) != i+1:
                        tst = 0
                        break
                    tst += 1
            if tst != 0:
                if c not in l:
                    grandTotal += c
                    l.append(c)
                else:
                    print "repeat"
                print string + " for " + str(a) + " " + str(b) + " " + str(c)
                print "grandTotal: " + str(grandTotal)
            b += 1
        #print a
        b = 1
        a += 1


if __name__ == "__main__":
    main()
