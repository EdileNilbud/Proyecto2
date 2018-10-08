//Box2DProcessing example
//Se utiliza para crear las semillas que van a ir callendo del cielo
//Las semillas seran cuerpos circulares

class SEMILLA {
  // We need to keep track of a Body and a radius
  Body body;    //Cuerpo para poder ver si hay una colicion
  float r;      //Radio que tendra el cuerpo
  color col;
  boolean delete = false;  //Sirve para indicar si se conserva o se borra el objeto
  PImage imgSemilla;  //Imagen de la semilla

  //Constructor de la clase Semilla
  SEMILLA(float x, float y, float r_) {
    r = r_;
    // This function puts the particle in the Box2d world
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(175);
    imgSemilla = loadImage("semilla.png");
  }
  
  //Destruye la semilla
  void killBody() {
    box2d.destroyBody(body);
  }

  //Indica que el objero se debe destruir
  void delete() {
    delete = true;
  }

  //Cambia el color de la semilla
  void change() {
    col = color(255, 0, 0);
  }
  
  //Indica si la semilla se debe eliminar o no
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2 || delete) {
      killBody();
      return true;
    }
    //Colicion con la canasta alien
    if(pos.y < 570 && pos.y > 530 && pos.x > filipo.x-60 && pos.x < filipo.x+50){
      atrapa++;
      killBody();
      return true;
    }
    return false;
  }
  
  //Muestra la semilla
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    //fill(col);
    //stroke(0);
    //strokeWeight(1);
    //ellipse(0, 0, r*2, r*2);
    //Genera una linea que permite ver la rotacion 
    //line(0, 0, r, 0);
    image(imgSemilla, -15, -20, 35, 35);
    popMatrix();
  }

  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.001;
    fd.restitution = 0.1;

    // Attach fixture to body
    body.createFixture(fd);
    body.setAngularVelocity(random(-10, 10));
  }
}