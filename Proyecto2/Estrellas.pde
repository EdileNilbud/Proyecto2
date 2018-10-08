class Estrella{


void dibujarEstrella(int x,int y){
  pushMatrix();
 translate(x,y);
  noFill();
  stroke(255,255,0);
  
  triangle(1,20,100,20,50,100);
  
  stroke(255,255,0);
  triangle(50,1,1,80,100,80);
  
  stroke(255,255,0);
  triangle(10,25,90,25,50,90); 
  popMatrix();

}

}
