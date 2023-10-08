
//Crear variable flotante
float arbol;   
// Se define las propiedades del entorno inicial
void setup() {
//Define la dimensión del ancho y alto de la ventana de visualización.
  size(800,500);
}
//Ejecuta continuamente las líneas de código contenidas 
void draw() {
  // Se establece el color utilizado para el fondo de la ventana de procesamiento dentro del draw() para borrar la ventana de visualización al comienzo de cada cuadro
  background(281);
  //Especifica el número de fotogramas que se mostrarán cada segundo
  frameRate(30);
  //Establece el color utilizado para dibujar líneas y bordes
  stroke(202,79,216);
  // Elijamos un ángulo de 0 a 180 grados según la posición del mouse.
  // MouseY contiene la coordenada horizontal actual del mouse.
  float a = (mouseY / (float) width) * 120f;
  // Convertir a radianes
  arbol = radians(a);
  // Iniciar el árbol desde la parte inferior de la pantalla.
  translate(width/2,height);
  // Dibujar línea de 110 píxeles.
  line(0,0,0,-110);
  //Ir al final de esa línea.
  translate(0,-110);
  // Inicio de la ramificación recursiva
  branch(110);

}

void branch(float h) {
  // Cada rama tendrá 2/3 del tamaño de la anterior.
  h *= 0.70;
  
  // Condición de salida
  // La longitud de la rama es de 2 píxeles o menos.
  if (h > 2) {
    pushMatrix();    // Guardar el estado actual de transformación 
    rotate(arbol);   // Girar arbol
    line(0, 0, 0, -h);  // dibuja la rama
    translate(0, -h); // Mover al final de la rama.
    branch(h);       //dibujar dos nuevas ramas
    popMatrix();     // Cada vez que volvemos aquí, hacemos "pop" para restaurar el estado anterior de la matriz.
    
   // Repite lo mismo hacia la izquierda
    pushMatrix();
    rotate(-arbol);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
