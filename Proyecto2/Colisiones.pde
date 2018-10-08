//Eventos que ocurren a colicionar dos elementos
void beginContact(Contact cp) {
  
  // Get both shapes
  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();
  // Get both bodies
  Body b1 = f1.getBody();
  Body b2 = f2.getBody();

  // Get our objects that reference these bodies
  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
  
  //Si coliciona una semilla con el suelo incrementa semillas perdidas
  if (o2.getClass() == SUELO.class) {
    SEMILLA s = (SEMILLA) o1;
    tocaSuelo++;
    s.delete();
    //Hacer funcion para crear arboles en el fondo
    //crearArbol();
  }
  
  if (o1.getClass() == SUELO.class) {
    SEMILLA s = (SEMILLA) o2;
    tocaSuelo++;
    s.delete();
    //Hacer funcion para crear arboles en el fondo
    //crearArbol();
  }
  
}

// Objects stop touching each other
void endContact(Contact cp) {
}