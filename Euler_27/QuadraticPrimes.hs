-- (c) 2013 Aaron M. Taylor

isPrime n = 0



numPrimes = [ n^2 + a*n + b | n <- [1..], (a,b) <- allQuads, isPrime ( n^2 +a*n +b ) ]
    where allQuads = [ (a,b) | a <- [(-1000),(-999)..1000], b <- [(-1000),(-999)..1000] ]
