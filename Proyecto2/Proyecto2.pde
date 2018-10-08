//Librerias

import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;

//Declaracionde objeto pantallas
PANTALLAS pantallas;
//Declaracion del objeto suelo
SUELO suelo;
//Declaracion del objeto personaje (Filipo)
PERSONAJE filipo;
//Crea un Arreglo para las semillas
ArrayList<SEMILLA> semillas;
//Lista para imagenes
ArrayList<PImage> imgSemillas;

//Variables puntos
int tocaSuelo;
//Numero de semillas para perder
int perder;
int atrapa;
//Numero de semillas para ganar
int ganar;
//Numero maximo de semillas
int nSemillas;

char fin;


void setup() {
  size(650, 650);
  smooth();
  
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0.8,-3);
  // Turn on collision listening!
  box2d.listenForCollisions();
  
  //Se llama al constructor de pantallas crear la pamtalla inicializandola
  //con la primera pantalla
  pantallas = new PANTALLAS(0);
  //Se llama al constructor de suelo para crear el suelo
  suelo = new SUELO(width/2, height-5, width, 10);
  //Se crea el personaje
  filipo = new PERSONAJE();
  //Crea la lista de semillas
  semillas = new ArrayList<SEMILLA>();
  
  //Se inicializan en 0 los puntos
  tocaSuelo = 0;
  atrapa = 0;
  //Se indican las condiciones para ganar o perder
  perder = 10;
  ganar = 10;
  //Designe el numero maximo de semillas
  nSemillas = 8;
  
}

void draw() {
  background(255);

  // We must always step through time!
  box2d.step();
  
  pantallas.MostrarPantalla();
   
  
}