isPrime :: Int -> Bool
isPrime n = ( [] == [ i | i <- [2..floor (sqrt (fromIntegral n))], mod n i == 0]) 

primesBelow :: Int -> [Int]
primesBelow n = [ x | x <- [1..n], isPrime x ]

--gbMakeup :: Int -> [(Int,Int)]
gbMakeup n = [ (p+2*s*s,p,s) | p <- primesBelow n, s <- [1..floor (sqrt (fromIntegral n))], p+2*s*s == n ]


firstExcept = [ a | a <- [1,3..1000000], gbMakeup a == [], not (isPrime a) ]