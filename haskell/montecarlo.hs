import System.Random ( randomRIO )

puntoAleatorio :: IO (Double, Double)
puntoAleatorio = do
    x <- randomRIO (-1.0, 1.0)
    y <- randomRIO (-1.0, 1.0)
    return (x, y)

dentroDeCirculo :: (Double, Double) -> Bool
dentroDeCirculo (x, y) = x^2 + y^2 <= 1.0

calcularPi :: Int -> IO Double
calcularPi n = do
    puntos <- mapM (\_ -> puntoAleatorio) [1..n]
    let dentro = length (filter dentroDeCirculo puntos)
    return (4.0 * fromIntegral dentro / fromIntegral n)

main :: IO ()
main = do
    putStrLn "Ingrese el número de puntos a generar:"
    input <- getLine
    let n = read input :: Int
    piAproximado <- calcularPi n
    putStrLn ("Aproximación de pi con " ++ show n ++ " puntos: " ++ show piAproximado)

    --cabal install --lib random