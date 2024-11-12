-- Equipo De Trabajo:
-- Agustin Alieni, 46332866
-- Damian Dalio, 45801187

{-- Este modulo provee las funcionalidades basicas del TP, se deben implementar todas las funciones
    que estan indefinidas.
-}

module Palabras
    ( 
        palabrasComunes, palabras, ordenarPalabras, contarPalabrasAdyacentes, ordenarPorRepeticion
    ) where

import Data.Char (toUpper, toLower)

-- | Definición de los sinónimos de tipos Texto y Palabra para que los perfiles de funciones
-- sean más comprensibles
type Texto = [Char]
type Palabra = [Char]

-- | Dado un Texto retornar la lista de palabras del mismo. 
-- Ej: palabras "Hola a Todos" = ["Hola", "a", "Todos"]
palabras :: Texto -> [Palabra]
palabras xs = quitarEspacios(letras xs)

letras :: Texto -> [Palabra]
letras [] = []
letras (x:xs) = [[x]] ++ letras xs 

quitarEspacios :: [Palabra] -> [Palabra]
quitarEspacios [] = []
quitarEspacios [x] = if x /= " " then [x] else [] 
quitarEspacios (" ":y:ys) = quitarEspacios (y:ys)
quitarEspacios (x:y:ys) = if y /= " " then quitarEspacios ([x ++ y] ++ ys) else x:quitarEspacios ys

-- | Dado un Char, si pertenece al rango [A-Z] lo convierte al rango [a-z], de lo contrario devuelve el mismo Char
-- Util para procesar palabras como "El" y "el"
aMinuscula :: Char -> Char
aMinuscula a 
    | a >= 'A' || a <= 'Z' = toLower a 
    | otherwise = a

palabraMinuscula :: Palabra -> Palabra
palabraMinuscula [] = []
palabraMinuscula xs = map aMinuscula xs

palabrasMinuscula :: [Palabra] -> [Palabra]
palabrasMinuscula [] = [] 
palabrasMinuscula xs = map palabraMinuscula xs

-- | Dada una lista de palabras, ordena alfabéticamente las palabras
-- Ej: ordenarPalabras ["hola", "a", "todos", "a"] = ["a", "a", "hola", "todos"]
merge :: [Palabra] -> [Palabra] -> [Palabra]
merge [] ys = ys
merge xs [] = xs 
merge (x:xs) (y:ys) = if x <= y then x:merge xs (y:ys) else y:merge (x:xs) ys

ordenarPalabras :: [Palabra] -> [Palabra]
ordenarPalabras [] = []
ordenarPalabras [x] = [x]
ordenarPalabras [x,y] = if x <= y then [x,y] else [y,x]
ordenarPalabras xs = merge (ordenarPalabras (left xs)) (ordenarPalabras (right xs))
             where left xs = take(div (length xs)2) xs
                   right xs = drop(div (length xs)2) xs

-- | Dada una lista de palabras, compacta la lista contando las repeticiones adyacentes
-- Ej: contarPalabrasAdyacentes ["a", "a", "hola", "a"] = [(2, "a"), (1, "hola"), (1, "a")]
contarPalabrasAdyacentes :: [Palabra] -> [(Int,Palabra)]
contarPalabrasAdyacentes [] = []
contarPalabrasAdyacentes (x:xs) = sumarPA(contarPA(x:xs))

contarPA :: [Palabra] -> [(Int, Palabra)]
contarPA [] = []
contarPA [x] = [(1,x)]
contarPA (x:xs) = (1,x):contarPA xs

sumarPA :: [(Int,Palabra)] -> [(Int, Palabra)]
sumarPA [] = []
sumarPA [(n,a)] = [(n,a)]
sumarPA ((n,a):(m,b):xs) = if a == b then sumarPA ((m+n,b):xs) else (n,a):sumarPA((m,b):xs)

-- | Dada una lista de palabras con sus repeticiones, deja las palabras con más repeticiones al principio
--ordenarPorRepeticion(contarPalabrasAdyacentes (ordenarPalabras ["a","a","hola","a","j","j","j","j"]))
merge' :: [(Int,Palabra)] -> [(Int,Palabra)] -> [(Int,Palabra)]
merge' [] ys = ys
merge' xs [] = xs 
merge' (x:xs) (y:ys)|fst x > fst y = x:merge' xs (y:ys)
                    |fst x < fst y = y:merge' (x:xs) ys
                    |fst x == fst y && snd x <= snd y = x:merge' xs (y:ys)
                    |fst x == fst y && snd y < snd x = y:merge' (x:xs) ys

ordenarPorRepeticion :: [(Int, Palabra)] -> [(Int, Palabra)]
ordenarPorRepeticion [] = []
ordenarPorRepeticion [x] = [x]
ordenarPorRepeticion [x,y]|fst x > fst y = [x,y]
                          |fst x < fst y = [y,x]
                          |fst x == fst y && snd x <= snd y = [x,y]
                          |fst x == fst y && snd y < snd x = [y,x]

ordenarPorRepeticion xs = merge' (ordenarPorRepeticion (left xs)) (ordenarPorRepeticion (right xs))
             where left xs = take(div (length xs)2) xs
                   right xs = drop(div (length xs)2) xs

-- | Función principal. Implementar usando las funciones previas, funciones definidas en Haskell y el operador de composición "."
palabrasComunes :: [Int] -> Texto -> [Palabra]
palabrasComunes [] txt = []

palabrasComunes xs [] = error "Ingrese un texto"

palabrasComunes (x:xs) txt = if 0 <= x && x <= length list then snd(list!!(x-1)) : palabrasComunes xs txt else palabrasComunes xs txt 
                           where list = ordenarPorRepeticion . contarPalabrasAdyacentes . ordenarPalabras . palabrasMinuscula . palabras $ txt








