//Clase para el personaje principal (Filipo)

class PERSONAJE {
  int x,y;    //Coordenadasdel personaje
  int alto, ancho;  //Area donde puede atrapar las semillas
  PImage imgFilipo;  //Imagen de Filipo
  
  PERSONAJE(){
    x = 325;
    y = 530;
    alto = 10;
    ancho= 100;
    
    imgFilipo = loadImage("filipo.png");
  }
  
  // Drawing the box
  void display() {
    pushMatrix();
    translate(x,y);
    fill(175);
    stroke(0);
    //Se elimina el rectangulo y solo se deja el Filipo
    //rect(0,0,ancho,alto);
    //Ajustar la posicion y tamaño de filipo
    image(imgFilipo, -190, -130, 350, 350);
    popMatrix();
  }
  
  //Mueve a filipo a la izq. o der.
  void mover(char direccion){
    if(direccion == 'I'){
      x -= 5;
    }
    if(direccion == 'D'){
      x += 10;
    }
  }
  
}