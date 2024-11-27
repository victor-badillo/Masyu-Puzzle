Práctica hecha por: Víctor Nathanael Badillo Aldama y Diego Dopazo García.


En este directorio se encuentran los siguientes archivos:
- masyu-examples.zip : carptea que contiene los enunciados masyuXX.txt y su respectiva solucion como solXX.txt
- masyuKB.lp : la base de conocimiento, resuelve el puzzle.
- encode.py : obtiene los facts a partir de un archivo .txt y lo guarda en un archivo .lp con el nombre que le demos
- decode.py : imprime la salida de nuestro programa
- display.py y drawmasyu.lp : con estos archivos podremos imprimir por pantalla la solución obtenida.


Todos los puzzles en masyu-examples.zip tienen un solución (clingo 0 masyuKB.lp masyuXX.lp) menos el primer ejemplo, masyu00.lp.


Pasos para ejecutar el código:

1.- Obtenemos los facts con encode.py y el enunciado (masyuXX.txt) y lo guardamos en masyuXX.lp.

python3 encode.py masyu-examples/masyu02.txt masyu02.lp

2.- Guardamos la salida del solver, masyuKB.lp para un archivo .lp con los facts. Usamos decode.py y la salida 
la podemos guardar en un archivo como puede ser solutionXX.txt.

python3 decode.py masyuKB.lp masyu02.lp > solution02.txt

3.- Imprimimos por pantalla el resultado que se obtiene al resolver el puzzle.

python3 display.py masyuKB.lp masyu02.lp drawmasyu.lp



(Se asume que las cuadriculas son de n x n y n >= 0)
