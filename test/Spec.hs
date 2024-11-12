{-- Un modulo basico para testing, se utilizan textos clasicos en txt: El Quijote, El Principito, y Martin Fierro,
    y se calculan las palabras que mas aparecen en estos textos. 
-}
import Palabras
import System.IO


main :: IO ()
main = do 
        putStrLn "\nTesting palabras()..."
        putStrLn $ if (palabras "") == result1 then "Test 1 : OK" else "Test 1 : Fail!"
        putStrLn $ if (palabras "Hola a  Todos ") == result2 then "Test 2 : OK" else "Test 2: Fail!" 

        putStrLn "\nTesting ordenarPalabras()..."
        putStrLn $ if (ordenarPalabras []) == result3 then "Test 3 : OK" else "Test 3 : Fail!"
        putStrLn $ if (ordenarPalabras ["hola", "a", "todos", "a", "moverse"]) == result4 then "Test 4 : OK" else "Test 4: Fail!"

        putStrLn "\nTesting contarPalabrasAdyacentes()..."
        putStrLn $ if (contarPalabrasAdyacentes ["a", "a", "hola", "a"]) == result5 then "Test 5 : OK" else "Test 5 : Fail!"

        putStrLn "\nTesting ordenarPorRepeticion()..."
        putStrLn $ if (ordenarPorRepeticion [(2, "a"), (10, "hola"), (4, "todos")]) == result6 then "Test 6 : OK" else "Test 6 : Fail!"

        putStrLn "\nTesting palabrasComunes()... Warning! slow tests"
        putStrLn $ if (palabrasComunes [1, 2, 3] "El perro corre rapido, el gato descansa en el sofa") == result7 then "Test 7 : OK" else "Test 7: Fail!"

        martinFierroFile <- openFile "test/martin-fierro.txt" ReadMode
        hSetEncoding martinFierroFile utf8
        martinFierroTxt <- hGetContents martinFierroFile
        
        principitoFile <- openFile "test/principito.txt" ReadMode
        hSetEncoding principitoFile utf8
        principitoTxt <-hGetContents principitoFile

        quijoteFile <- openFile "test/quijote.txt" ReadMode
        hSetEncoding quijoteFile utf8
        quijoteTxt <- hGetContents quijoteFile
        
        putStrLn $ if (palabrasComunes [1, 10, 4, 8, 9, 15, 7] martinFierroTxt) == result8 then "Test 8 : OK" else "Test 8: Fail!"
        putStrLn $ if (palabrasComunes [5, 4, 3, 2, 1] principitoTxt) == result9 then "Test 9 : OK" else "Test 9: Fail!"
        putStrLn $ if (palabrasComunes [2, 8, 1, 5] quijoteTxt) == result10 then "Test 10 : OK" else "Test 10: Fail!"
        putStrLn $ if (palabrasComunes [] "texto de prueba") == [] then "Test 11 : OK" else "Test 11: Fail!"


-- Expected results
result1 = []
result2 = ["Hola", "a", "Todos"]
result3 = []
result4 = ["a", "a", "hola", "moverse", "todos"]
result5 = [(2, "a"), (1, "hola"), (1, "a")]
result6 = [(10, "hola"), (4, "todos"), (2, "a")]
result7 = ["el", "corre", "descansa"]
result8 = ["el", "los", "de", "un", "no", "al", "me"]
result9 = ["la", "y", "que", "de", "el"]
result10 = ["de", "no", "que", "a"]

--result8 = [(337,"el"),(312,"que"),(297,"la"),(264,"de"),(203,"a"),(198,"en"),(187,"me"),(185,"un"),(143,"no"),(140,"los"),(133,"se"),(112,"lo"),(111,"y"),(106,"las"),(98,"al"),(84,"le"),(78,"con"),(75,"una"),(63,"mi"),(59,"es"),(59,"su"),(55,"como"),(54,"por"),(48,"gaucho"),(47,"si"),(43,"m\225s"),(43,"pa"),(38,"ni"),(36,"del"),(31,"sus"),(30,"era"),(28,"sin"),(28,"yo"),(26,"hay"),(26,"he"),(25,"ha"),(25,"ya"),(22,"hab\237a"),(22,"nos"),(21,"tan")]
--result9 = [(454,"el"),(405,"de"),(335,"que"),(275,"y"),(240,"la"),(230,"a"),(210,"un"),(195,"no"),(173,"se"),(171,"en"),(139,"una"),(132,"los"),(124,"es"),(121,"me"),(109,"las"),(93,"para"),(92,"principito"),(90,"por"),(85,"al"),(82,"su"),(81,"-dijo"),(76,"mi"),(70,"yo"),(69,"lo"),(69,"m\225s"),(67,"del"),(66,"con"),(66,"muy"),(54,"si"),(53,"-le"),(53,"pero"),(52,"como"),(51,"principito."),(43,"te"),(41,"son"),(39,"le"),(36,"he"),(35,"ya"),(34,"era"),(34,"tan")]
--result10 = [(17281,"que"),(16082,"de"),(14714,"y"),(8993,"la"),(8708,"a"),(7236,"en"),(7163,"el"),(5139,"no"),(4130,"se"),(3990,"los"),(3611,"con"),(3316,"por"),(3103,"lo"),(2930,"las"),(2920,"le"),(2883,"su"),(2321,"don"),(2154,"del"),(2050,"me"),(1933,"como"),(1806,"es"),(1695,"si"),(1691,"un"),(1613,"yo"),(1575,"m\225s"),(1491,"al"),(1479,"mi"),(1234,"y,"),(1218,"para"),(1217,"ni"),(1127,"una"),(1055,"porque"),(1044,"o"),(1040,"tan"),(994,"sin"),(928,"que,"),(921,"ha"),(921,"\233l"),(886,"ser"),(885,"todo")]