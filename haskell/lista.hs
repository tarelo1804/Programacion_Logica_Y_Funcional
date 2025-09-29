
lista :: [Integer] -> Integer
lista(x:xs)= x 


lista2 :: [Integer] -> [Integer]
lista2 (x:xs)= xs

lista3 :: [Integer] -> Integer -> [Integer]
lista3 a b= b:a

lista4 :: [String] -> String -> [String]
lista4 a b= b:a

lista5 :: Char -> String -> String
lista5 a b= a:b

lista6 :: [Integer]
lista6 = [1..1000000000000]

fun1 :: [Integer] -> Integer
fun1 [] = 0
fun1(x:xs) = x + fun1 xs



fun2 :: [Integer] -> Integer
fun2 [] = 0
fun2(_:xs) = 1 + fun2 xs

main = print (fun2 [1,3,5])
--main = print (lista5 ["Enchiladas,Pozole"] "Tamales")
--main = print (lista6)
--main = print(take 3 lista6)
--main = print(drop 3 lista6)
--main = print(sum lista6)
--main = print(product lista6)
--main = print(cycle lista6)
--main = print([10..])
--main = print(replicate 10 '*')