
## Descripción

En este trabajo se pretende desarrollar un algoritmo que analice un texto y permita responder a enunciados como el siguiente: ¿Cuál es la segunda y la quinta palabra más repetida en War and Peace? Es decir, se pretende desarrollar la función:

```
palabrasComunes :: [Int] -> Texto -> [Palabra]
```

En donde, reciba un listado de posiciones y un texto, calcule el ranking de palabras con más repeticiones y retorne solamente el listado de las palabras que se encuentran en esas posiciones. Por ejemplo:

```
En el texto "El perro corre rápido y también el perro descansa en el sofá"

El ranking de palabras con sus repeticiones es:
1. el - 3
2. perro - 2
3. corre - 1
4. descansa - 1
5. en - 1
6. ...

----------
Si se ejecuta
> palabrasComunes [1, 4, 2] "El perro corre rápido y también el perro descansa en el sofá"

se espera como resultado:
["el", "descansa", "perro"]

----------
Si se ejecuta
> palabrasComunes [1, 400, 2] "El perro corre rápido y también el perro descansa en el sofá"

se espera el resultado:
["el", "perro"]
```

_Importante:_ como se observa en el ejemplo, si dos palabras tienen el mismo número de repeticiones se prioriza el orden alfabético, y no se distingue entre la versión con mayúscula y con minúscula de la misma palabra. Además, asumir la no existencia de caracteres especiales como ’\t’ o ’\n’ en el texto original.


