
-- Promedio de 4 números
promedio :: Float -> Float -> Float -> Float -> Float
promedio a b c d = (a + b + c + d) / 4

-- Suma de monedas ($1, $5, $10, $50)
sumaMonedas :: Integer -> Integer -> Integer -> Integer -> Integer
sumaMonedas a b c d = a * 1 + b * 5 + c * 10 + d * 50

-- Volumen de una esfera
volumenEsfera :: Float -> Float
volumenEsfera r = (4/3) * pi * r^3

-- Verifica si tres números son iguales (usando Guards)
sonIguales :: Integer -> Integer -> Integer -> Bool
sonIguales a b c | a == b && b == c = True
                 | otherwise = False

-- Verifica si tres números son diferentes (usando Guards)
sonDiferentes :: Integer -> Integer -> Integer -> Bool
sonDiferentes a b c | a /= b && b /= c && a /= c = True
                    | otherwise = False

-- Calcula precio con descuento (usando Guards)
precioFinal :: Float -> Float
precioFinal precio | precio > 1000 = precio * 0.6  -- 40% descuento
                   | precio > 500 = precio * 0.7   -- 30% descuento
                   | precio > 100 = precio * 0.9   -- 10% descuento
                   | otherwise = precio

-- Obtiene última cifra (usando If)
ultimaCifra :: Integer -> Integer
ultimaCifra n = if n < 0 
                then mod (abs n) 10 
                else mod n 10

-- Menú interactivo
menu :: IO ()
menu = do
    putStrLn "\n=== Menú de Funciones ==="
    putStrLn "1. Calcular promedio de 4 números"
    putStrLn "2. Sumar monedas"
    putStrLn "3. Calcular volumen de esfera"
    putStrLn "4. Verificar si tres números son iguales"
    putStrLn "5. Verificar si tres números son diferentes"
    putStrLn "6. Calcular precio con descuento"
    putStrLn "7. Obtener última cifra"
    putStrLn "8. Salir"
    putStrLn "Elige una opción: "
    
    opcion <- getLine
    case opcion of
        "1" -> do
            putStrLn "Introduce cuatro números separados por espacios: "
            input <- getLine
            let [a,b,c,d] = map read (words input) :: [Float]
            putStrLn $ "El promedio es: " ++ show (promedio a b c d)
            menu
        "2" -> do
            putStrLn "Introduce cantidad de monedas ($1, $5, $10, $50): "
            input <- getLine
            let [a,b,c,d] = map read (words input) :: [Integer]
            putStrLn $ "La suma total es: $" ++ show (sumaMonedas a b c d) ++ ".00"
            menu
        "3" -> do
            putStrLn "Introduce el radio de la esfera: "
            input <- getLine
            let radio = read input :: Float
            putStrLn $ "El volumen es: " ++ show (volumenEsfera radio)
            menu
        "4" -> do
            putStrLn "Introduce tres números: "
            input <- getLine
            let [a,b,c] = map read (words input) :: [Integer]
            putStrLn $ "¿Son iguales? " ++ show (sonIguales a b c)
            menu
        "5" -> do
            putStrLn "Introduce tres números: "
            input <- getLine
            let [a,b,c] = map read (words input) :: [Integer]
            putStrLn $ "¿Son diferentes? " ++ show (sonDiferentes a b c)
            menu
        "6" -> do
            putStrLn "Introduce el precio: "
            input <- getLine
            let precio = read input :: Float
            putStrLn $ "Precio final con descuento: $" ++ show (precioFinal precio)
            menu
        "7" -> do
            putStrLn "Introduce un número: "
            input <- getLine
            let num = read input :: Integer
            putStrLn $ "La última cifra es: " ++ show (ultimaCifra num)
            menu
        "8" -> putStrLn "¡Hasta luego!"
        _ -> do
            putStrLn "Opción no válida"
            menu

-- Función principal
main :: IO ()
main = menu