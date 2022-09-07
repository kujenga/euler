import Data.List

isPandigital :: [Char] -> Bool
isPandigital str = if sort str == ['1'..'9'] then True else False

concatAll :: [[Char]] -> [Char]
concatAll strList = foldl (\acc s -> acc ++ s) [] strList

pandigitalMul n max = concatAll [ show s | s <- [ n*i | i <- [1..max] ] ]

toInts :: [[Char]] -> [Int]
toInts strList = [ read n :: Int | n <- strList ]

findPM n max = toInts [pandigitalMul x y | x <- [2..n], y <- [1..max], isPandigital (pandigitalMul x y) ]

