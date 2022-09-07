# project euler problem 14
# 


def power(x,n):
    result = x
    for i in range(n-1):
        result = result * x
    return result

def main():
    n = power(2,1000)
    print n
    nStr = str(n)
    sum = 0
    for c in nStr:
        sum += int(c)    
    print sum

if __name__ == "__main__":
    main()
