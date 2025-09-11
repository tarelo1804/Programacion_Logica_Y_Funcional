
--Obtiene el valor absoluto de un numero
absoluto:: Integer -> Integer
absoluto x = abs x

--Obtiene el menor entero no menor que x
menorEntero :: Double -> Integer
menorEntero x = ceiling x

--Devuelve el valor siguiente de x
siguiente :: Integer -> Integer
siguiente x = succ x

--Obtiene el menor entre dos números
minimo :: Integer -> Integer -> Integer
minimo x y = min x y

--Obtiene el mayor entre dos números
maximo :: Integer -> Integer -> Integer
maximo x y = max x y

--Divide x entre y
division :: Integer -> Integer -> Integer
division x y = div x y

--Obtiene el módulo de x y y
modulo :: Integer -> Integer -> Integer
modulo x y = mod x y

--Verifica si x es par
esPar :: Integer -> Bool
esPar x = even x

--Obtiene el mayor entero no mayor que x
mayorEntero :: Double -> Integer
mayorEntero x = floor x

--Obtiene el máximo común divisor
maximoComunDivisor :: Integer -> Integer -> Integer
maximoComunDivisor x y = gcd x y

--Negación de booleana
negacion :: Bool -> Bool
negacion x = not x

--Verifica si un número es impar
esImpar :: Integer -> Bool
esImpar x = odd x

--Devuelve 1 si es positivo, -1 si es negativo, 0 si es cero
signo :: Integer -> Integer
signo x = signum x

--Retorna el segundo elemento de una tupla
segundoElemento :: (a, b) -> b
segundoElemento = snd

-- Menú interactivo
menu :: IO ()
menu = do
    putStrLn "\n=== Menú de Funciones Predefinidas ==="
    putStrLn "1. Valor absoluto"
    putStrLn "2. Menor entero no menor que x"
    putStrLn "3. Siguiente valor"
    putStrLn "4. Mínimo entre dos números"
    putStrLn "5. Máximo entre dos números"
    putStrLn "6. División"
    putStrLn "7. Módulo"
    putStrLn "8. Verificar si es par"
    putStrLn "9. Mayor entero no mayor que x"
    putStrLn "10. Máximo común divisor"
    putStrLn "11. Negación booleana"
    putStrLn "12. Verificar si es impar"
    putStrLn "13. Segundo elemento de una tupla"
    putStrLn "14. Signo del número (1 positivo, -1 negativo)"
    putStrLn "15. Salir"
    putStrLn "Elige una opción: "
    
    opcion <- getLine
    case opcion of
        "1" -> do
            putStrLn "Introduce un número: "
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "El valor absoluto es: " ++ show (absoluto x)
            menu
        "2" -> do
            putStrLn "Introduce un número (puede ser decimal): "
            n <- getLine
            let x = read n :: Double
            putStrLn $ "El menor entero no menor que x es: " ++ show (menorEntero x)
            menu
        "3" -> do
            putStrLn "Introduce un número: "
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "El siguiente valor es: " ++ show (siguiente x)
            menu
        "4" -> do
            putStrLn "Introduce el primer número: "
            n1 <- getLine
            putStrLn "Introduce el segundo número: "
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "El mínimo es: " ++ show (minimo x y)
            menu
        "5" -> do
            putStrLn "Introduce el primer número: "
            n1 <- getLine
            putStrLn "Introduce el segundo número: "
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "El máximo es: " ++ show (maximo x y)
            menu
        "6" -> do
            putStrLn "Introduce el dividendo: "
            n1 <- getLine
            putStrLn "Introduce el divisor: "
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "La división es: " ++ show (division x y)
            menu
        "7" -> do
            putStrLn "Introduce el primer número: "
            n1 <- getLine
            putStrLn "Introduce el segundo número: "
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "El módulo es: " ++ show (modulo x y)
            menu
        "8" -> do
            putStrLn "Introduce un número: "
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "¿Es par? " ++ show (esPar x)
            menu
        "9" -> do
            putStrLn "Introduce un número (puede ser decimal): "
            n <- getLine
            let x = read n :: Double
            putStrLn $ "El mayor entero no mayor que x es: " ++ show (mayorEntero x)
            menu
        "10" -> do
            putStrLn "Introduce el primer número: "
            n1 <- getLine
            putStrLn "Introduce el segundo número: "
            n2 <- getLine
            let x = read n1 :: Integer
            let y = read n2 :: Integer
            putStrLn $ "El máximo común divisor es: " ++ show (maximoComunDivisor x y)
            menu
        "11" -> do
            putStrLn "Introduce True o False: "
            n <- getLine
            let x = read n :: Bool
            putStrLn $ "La negación es: " ++ show (negacion x)
            menu
        "12" -> do
            putStrLn "Introduce un número: "
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "¿Es impar? " ++ show (esImpar x)
            menu
        "13" -> do
            putStrLn "Introduce dos valores separados por coma (ejemplo: 1,2): "
            entrada <- getLine
            let [x, y] = map read $ words $ map (\c -> if c == ',' then ' ' else c) entrada :: [Integer]
            putStrLn $ "El segundo elemento es: " ++ show (segundoElemento (x, y))
            menu
        "14" -> do
            putStrLn "Introduce un número: "
            n <- getLine
            let x = read n :: Integer
            putStrLn $ "El signo es: " ++ show (signo x)
            menu
        "15" -> putStrLn "¡Hasta luego!"
        _ -> do
            putStrLn "Opción no válida"
            menu

-- Función principal
main :: IO ()
main = menu