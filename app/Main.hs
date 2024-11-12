{-- Este modulo provee el punto de entrada del programa, toma parametros de la linea de comandos y
    llama a la funciones palabrasComunes para calcular las palabras mas comunes en el archivo dado.
-}

module Main (main) where

import System.Environment (getArgs)
import System.IO
import Palabras

-- | Funcion principal que toma argumentos de la linea de comando
-- main toma el nombre de un archivo que es donde se encuentra el texto a buscar
-- y una secuencia de Int indicando las posiciones de las palabras mas comunes a buscar 
main = do
        args <- getArgs
        case args of
            (x:xs) -> process ( map (read::String->Int) xs ) x
            _              -> error $ "Hubo un error procesando los argumentos"
        
-- | Una funcion auxiliar que llama a la funcion palabrasComunes de Palabras.hs
process  pos fileName =  do
                        file <- openFile fileName ReadMode
                        hSetEncoding file utf8
                        txt <- hGetContents file
                        print  $  palabrasComunes pos txt