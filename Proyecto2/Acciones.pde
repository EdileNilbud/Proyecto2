//Funcion para el uso del teclado

void keyPressed() {
  switch(pantallas.ID){
    case 0:
      //Pasa a la pantalla de juego
      if(key == ' '){
        pantallas.CambiarPantalla(1);
      }
      break;
    case 1:
      //Preciona A/a para moverce a la izquierda
      if(key == 'a' || key == 'A'){
        //revisa la pocision en x
        if(filipo.x > 50){
          filipo.mover('I');
        }
      }
      //Preciona D/d para moverce a la derecha
      if(key == 'd' || key == 'D'){
        //revisa la pocision en x
        if(filipo.x < 590){
          filipo.mover('D');
        }
      }
      if (key == CODED) {
        if (keyCode == LEFT) {
          //revisa la pocision en x
          if(filipo.x > 50){
            filipo.mover('I');
          }
        } 
        if (keyCode == RIGHT) {
          //revisa la pocision en x
          if(filipo.x < 590){
            filipo.mover('D');
          }
        }
      }
      break;
    case 2:
      //Preciona A/a para moverce a la izquierda
      if(key == 'r' || key == 'R'){
        //Reiniciar variables y posicion
        //Se inicializan en 0 los puntos
        tocaSuelo = 0;
        atrapa = 0;
        filipo.x = 325;
        //Recorre la lista de semillas y elimina las restantes
        for (int i = semillas.size()-1; i >= 0; i--) {
          SEMILLA s = semillas.get(i);
          //Dibuja las semillas en la pantalla
          s.killBody();
          semillas.remove(i);
        }
        pantallas.CambiarPantalla(0);
      }
      break;
    
  }
  
}