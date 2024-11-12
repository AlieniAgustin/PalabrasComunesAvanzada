import System.IO
:set prompt ""

main :: IO ()
main = do
    let result1 = ["el", "corre", "descansa"]
    let result2 = ["el", "los", "de", "un", "no", "al", "me"]
    let result3 = ["la", "y", "que", "de", "el"]
    putStr $ if (palabrasComunes [1, 2, 3] "El perro corre rapido, el gato descansa en el sofa") == result1 then "OK1" else "Test: Fail!"
    martinFierroFile <- openFile "test/martin-fierro.txt" ReadMode
    hSetEncoding martinFierroFile utf8
    martinFierroTxt <- hGetContents martinFierroFile
    principitoFile <- openFile "test/principito.txt" ReadMode
    hSetEncoding principitoFile utf8
    principitoTxt <-hGetContents principitoFile
    putStr $ if (palabrasComunes [1, 10, 4, 8, 9, 15, 7] martinFierroTxt) == result2 then "OK2" else "Test: Fail!"
    putStr $ if (palabrasComunes [5, 4, 3, 2, 1] principitoTxt) == result3 then "OK3" else "Test: Fail!"
    putStr $ if (palabrasComunes [] "texto de prueba") == [] then "OK4" else "Test: Fail!"


