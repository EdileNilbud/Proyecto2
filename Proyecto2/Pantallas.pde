//Clase que controla las pantallas que podra ver el usuario
//Se utilizan 3 pantallas: la de introducción (inicio), la
//de juego y la de ganar o perder.

class PANTALLAS {
  //Atributos de la clase PANTALLAS
  int ID;    //Identificador que nos permite cambiar de pantalla

  //Metodos de la clase PANTALLAS
  //Constructor
  PANTALLAS(int nPantalla) {
    ID = nPantalla;
  }

  //Cambia el ID de la clase para de este modo poder mostrar otra pantalla
  void CambiarPantalla(int nPantalla) {
    ID = nPantalla;
  }

  //Muestra la pantalla dependiendo del ID
  void MostrarPantalla(){
    switch(ID){
      case 0:
        Inicio();
        break;
      case 1:
        Juego();
        break;
      case 2:
        Fin(fin);
        break;
    }

  }

  //_______________________________________________________________________________
  //Pantalla de inicio donde muestra el titulo del juego o las instrucciones
  void Inicio(){
    background(0);
    PImage fondo;
    PImage planet;
    PImage extraterrestre;
    PImage estrella;
    

    fondo = loadImage("fondo.png");
    planet =loadImage("PLANETA.png");
    extraterrestre = loadImage("EXTRATERRESTRE2.png");
    estrella = loadImage("estrella.png");
    
    image(fondo,0,0);
    image(planet,100,100);
    image (extraterrestre,265,110);
    image(estrella,-250,-200);
   
    textSize(30);
    fill(random(100,200),random(10,120),random(0,255));
    text("¡BOABOBS!",350,450); //título.
    textSize(20);
    fill(255,222,random(0,255));
    text("Pulsa la barra de espacio para continuar.",110,550); //Instrucciones.
    
    /*
    background(255,0,0);
    //Texto de Inicio
    textSize(20);
    fill(0);
    text("Controles:", 50, 120);
    text(" * A/a/FechaIza: Izquierda", 80, 150);
    text(" * D/d/FechaDer: Derecgha", 80, 180);
    textSize(30);
    text("-- Precione espacio para comenzar --", 40, 500);
    */
  }

  //_______________________________________________________________________________
  //Aqui se desarrolla el juego, la captura de semillas y la perdida se van
  //contabilizando. Se crean nuevas semillas con un limite de semillas que se 
  //da en el setUp
  void Juego(){
    //background(0,255,0);
    PImage fondo;
    PImage suelo_;
    
    fondo = loadImage("fondo.png");
    suelo_ =loadImage("suelo.png");
    
    image(fondo,0,0);
    image(suelo_,0,0);
    
    textSize(15);
    fill(255,222,random(0,255));
    text("¡¡¡Atrapa las semillas,para evitar la dominación de los Boabobs en el planeta!!!",45,20);
    textSize(15);
    fill(random(0,255),222,random(0,255));
    text("Pulsa A y B para moverte y poder atraparlas.",180,40);
    
    
    //Dibuja el suelo
    suelo.display();
    
    //Personaje
    filipo.display();
    
    //Genera un numero maximo de semillas
    if (semillas.size() < nSemillas) {
      semillas.add(new SEMILLA(random(-200,200), random(-500,-50), 8));
    }
    
    //Recorre la lista de semillas
    for (int i = semillas.size()-1; i >= 0; i--) {
      SEMILLA s = semillas.get(i);
      //Dibuja las semillas en la pantalla
      s.display();
      
      //Si una semilla sale de la pantalla la elimina y luego la remueve de la lista
      if (s.done()) {
        semillas.remove(i);
      }
    }
    
    //Texto de puntuacion
    textSize(15);
    fill(255);
    text("Semillas perdidad:  "+tocaSuelo, 450, 90);
    text("Semillas atrapadas: "+atrapa, 450, 120);
    
    if(ganar <= atrapa){
      ID = 2;
      fin = 'G';
      //Fin(fin);
    }
    if(perder <= tocaSuelo){
      ID = 2;
      fin = 'P';
      //Fin(fin);
    }
    
  }

  //______________________________________________________________________________
  //Pantalla de fin del juego
  void Fin(char GP){
    
    background(100);
    
    PImage fondo;
    PImage suelo;
    
    fondo = loadImage("fondo.png");
    suelo =loadImage("suelo.png");
    
    image(fondo,0,0);
    image(suelo,0,0);
   
    textSize(20);
    fill(random(0,255),222,random(0,255));
    text("Pulsa r/R para jugar de nuevo.",100,400);
    
    if(GP == 'G'){
      textSize(30);
      text("-- Felicidades, has GANADO --", 40, 300);
      //textSize(12);
      //text("Presiona r/R para reiniciar", 400, 600);
    }
    if(GP == 'P'){
      textSize(30);
      text("-- Lo sentimos, has PERDIDO --", 40, 300);
      //textSize(12);
      //text("Presiona r/R para reiniciar", 400, 600);
    }
    
  }
   

}
