--Aaron Taylor (c) 2014

import Data.Char

-- functions for handling fractions
-- fracting stored in an (Integer,Integer) tuple, with fst as numerator and snd as denominator

gcd' :: Int -> Int -> Int
gcd' a 0 = a
gcd' a b = gcd b (a `mod` b)

addFrac :: (Integer, Integer) -> (Integer, Integer) -> (Integer, Integer)
addFrac (xn,xd) (yn,yd) = ( n `div` g, d `div` g)
    where n = xn * yd + yn * xd
          d = xd * yd
          g = gcd n d

invFrac :: (Integer, Integer) -> (Integer, Integer)
invFrac (n,d) = (d,n)

cntdFrac :: Integer -> [Integer] -> (Integer,Integer)
cntdFrac 0 l = ((head l), 1)
cntdFrac a l = addFrac ((head l), 1) (invFrac (cntdFrac (a-1) (tail l)))

-- utility functions for the problem

eList :: [Integer]
eList = tail [ if mod n 3 == 0 then 2*(div n 3) else 1 | n <- [1..] ]

sumDigits :: (Show a) => a -> Int
sumDigits n = sum [ digitToInt c | c <- show n ]

-- finds float values for finite continued fraction, unrelated to problem

cf :: Int -> Int -> [Int] -> Float
cf d n l = nF + ( 1 / ( lhf + cfr (d-1) (tail l) ) ) 
    where nF = fromIntegral n :: Float
          lhf = fromIntegral (head l) :: Float
          
cfr :: Int -> [Int] -> Float
cfr 0 l = 1 / ( lhf )
    where lhf = fromIntegral (head l) :: Float
cfr d l = 1 / ( lhf + cfr (d-1) (tail l) )
    where lhf = fromIntegral (head l) :: Float




