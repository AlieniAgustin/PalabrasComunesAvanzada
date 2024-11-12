[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/FyyG8dcN)
# TP de Programación Avanzada - Año 2024

## Este TP debe realizarse en grupo de hasta 3 personas.

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

## Uso de Stack

El proyecto se creo utilizando la herramienta [stack](https://docs.haskellstack.org/en/stable/), que permite desarrollar proyectos en Haskell. Para poder compilar el proyecto y correrlo debe instalar la aplicación.

El uso de stack es simple, por ejemplo:

- Ejecutando stack: `> stack run` ejecuta el programa. Tenga en cuenta que el programa toma dos argumentos: un archivo con el texto y la lista de posiciones. En el directorio `test/` puede encontrar algunos textos de ejemplo. Por ejemplo, ejecutando `> stack run test/quijote.txt 1 3 5`, el programa buscará la primera, tercera y quinta palabra más común en el Quijote de la Mancha.
- Compilando código: ` > stack build` este comando compila el programa, si hay algún error de compilación se mostrará por la terminal.
- Llamando al interprete: `> stack ghci` carga el programa en el interprete para que se puede correr allí.
- Testeando: ` > stack test` corre los casos de test especificados en `test/Spec.hs` si su implmentación no pasa algunos de los tests, stack se lo indicará (se debe tener en cuenta que para textos largos esto podría tardar unos segundos).

## Actividades

Para resolver el proyecto se deben completar las siguientes actividades:

1. Inscribir el grupo de trabajo en Github Classroom y obtener el código base del proyecto.
2. Implementar las funciones del archivo `src/Palabras.hs` que están marcadas como indefinidas, las cuales sirven de base para la solución.
3. Implementar la función `palabrasComunes`, es posible añadir nuevas funciones auxiliares pero no está permitido modificar el perfil de las funciones ya provistas.
4. Entregar la solución completa del proyecto junto a los casos de test realizados.
