# Sums one-hundered 50-digit numbers and prints ou the first ten digits
# numbers are in LgNums.txt

def main():
    f = open("LgNums.txt","r")
    sum = 0
    
    #if f.mode() == 'r':
    numList = f.readlines()
    for x in numList:
      sum += int(x)
    f.close()
    print str(sum)

if __name__ == "__main__":
    main()