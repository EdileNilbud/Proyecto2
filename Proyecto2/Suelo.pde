//Clase tomada de los ejemplos de Box2D (boundary)
//Clase que sirve para crear el suelo
//El limite a donde caeran las semillas

class SUELO {
  //El suelo es un simple rectangulo con coordenadas x,y y un alto y ancho
  float x;
  float y;
  float w;
  float h;
  PImage imgSuelo;  //Imagen del suelo
  
  //Se requiere un cuerpo para Box2D
  Body piso;

  //Constructor de la clase SUELO
  SUELO(float x_,float y_, float w_, float h_) {
    x = x_;  //Coordenada en x para el suelo
    y = y_;  //Coordenada en y para el suelo
    w = w_;  //Ancho del suelo
    h = h_;  //Largo del suelo
    
    //Genera un polinomio para la forma (rectangulo)
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);
    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    piso = box2d.createBody(bd);
    // Attached the shape to the body using a Fixture
    piso.createFixture(sd,1);
    piso.setUserData(this);
    
    imgSuelo = loadImage("suelo.png");
  }
  
  // This function removes the particle from the box2d world
  void destructorPiso() {
    box2d.destroyBody(piso);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  //Dibuja el suelo
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    //rect(x,y,w,h);
    image(imgSuelo, 0, 480, w, 200);
  }

}