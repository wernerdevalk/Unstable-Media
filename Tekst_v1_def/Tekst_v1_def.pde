String message1 = "This essay is not a word document. I did   not use Word to type this. Scripting, that  is all. Based on the content of my first two essays, "
  + "and the fun I had writing them,      here I'll focus on two works playing with  text, while doing the same myself. Now,   please click the left mouse button. First "
  +"   just for a short moment. Nice, right? Now keep pressing a bit longer.";
String message2 = "Tadaaa!      So why am I doing this?          Young-Hae Chang Heavy Industries          inspired me. They use animated text in     their work. They are "
  +"sort of the Korean    Marcel Broodthaers! Marcel who? Well, he is a flamish failed poet. After realizing this he switched to being an artist. In one of   his first"
  + "works, called Pense-Bête (1964)... ";
String message3 = "he put a poetry album in plaster. In           another famous work, Broodthaers           mounted an exhibition as a single work     titled Musée d’Art Moderne (1968)."
  + "The    piece included hundreds of readymade and fabricated objects, each labeled with the   words 'This is not a work of art,'"; 
String message4 = "It's clear how he relates to Young-Hae      Chang Heavy Industries, who also work   on the border between literature and art.   They are a Seoul-based"
  + " Web art group       consisting of Young-hae Chang and Marc Voge. The first is a Korean artist and        translator with a Ph.D in aesthetics, the    latter an American poet"
  + " who lives in Seoul";
String message5 = "Their work, presented in 20 languages, is   characterized by text-based animation      composed in Adobe Flash that is highly    synchronized to a "
  + "musical score that is      often original and typically jazz. In 2000,   YHCHI's work was recognized by the San Francisco Museum of Modern Art for its"
  + " contribution to online art. "; 
String message6 = "The group uses Monaco as the font for all their work, because they liked the way the name sounded.";
String message7 = "Okay. So that was just info. Not really an  essay. Why? Because it was really hard to  create the software. But also a lot of fun.   Hmm... maybe"
  + " something to continue        working on?";
StringList inventory;

int numberOfMessages = 7; 
int messageNr = 0; 
int maxLength = 400;
int x;
int y;
Letter[][] letterArray; 

int ctime;
int pressedTime; 
boolean moveThem = false; 

void setup() {

  inventory = new StringList(); 
  inventory.append(message1); 
  inventory.append(message2);
  inventory.append(message3); 
  inventory.append(message4); 
  inventory.append(message5);
  inventory.append(message6); 
  inventory.append(message7); 

  size(1920, 1080); // Screen

  textFont(createFont("Garamond", 105, true)); // Font

  letterArray = new Letter[numberOfMessages][maxLength]; // All the Letters

  // Initialize Letters at the correct x location.
  char space = ' '; 

  for (int a = 0; a < numberOfMessages; a++) {
    x = 16;
    y = 100; 
    for (int j = 0; j < maxLength; j++) {
      if (j<inventory.get(a).length()) {
        letterArray[a][j]= new Letter(x, y, inventory.get(a).charAt(j));
        x += textWidth(inventory.get(a).charAt(j));
      } else {
        letterArray[a][j] = new Letter(x, y, space); /// Fill with spaces to have the same number of letters
      }    
      if (x>1700) {
        y+=100; // Go to next line 
        x=16;
      }
    }
  }
}


void draw() { 
  background(255);

  for (int i = 0; i < maxLength; i++) {
    // Display all letters

    letterArray[messageNr][i].display(); 

    if (moveThem) {
      pressedTime = (millis()-ctime); 
      letterArray[messageNr][i].move(messageNr);
    } 

    if (pressedTime>1500 && messageNr<(numberOfMessages-1)) {
      moveThem = false;
      messageNr+=1;
      pressedTime = 0;
    }
  }
}

void mousePressed() {
  moveThem = true; 
  ctime=millis();
}

void mouseReleased() {

  if (moveThem==true) {
    moveThem=false;
  }
  pressedTime = 0;
}

// A class to describe a single Letter
class Letter {
  char letter;
  // The object knows its original "home" location
  float homex, homey;
  // As well as its current location
  float x, y;

  Letter (float x_, float y_, char letter_) {
    homex = x = x_;
    homey = y = y_;
    letter = letter_;
  }

  // Display the letter
  void display() {
    fill(0);
    textAlign(LEFT);
    text(letter, x, y);
  }

  // Move the letter randomly
  void move(int messageNr) {

    switch (messageNr) {
    case 0:  
      x += random(-2, 2);
      y += random(-2, 2);
      break;
    case 1:  
      if (((mouseX - 30) < x) && ((mouseX + 30) > x) && ((mouseY - 30) < y) && ((mouseY + 30) > y)) {
        x += random(-20, 20);
        y += random(-20, 20);
      }
      if (((mouseX - 200) < x) && ((mouseX + 200) > x) && ((mouseY - 200) < y) && ((mouseY + 200) > y)) {
        x += random(-2, 2);
        y += random(-2, 2);
      }
      break;
    case 2:  
      if (((mouseX - 200) < x) && ((mouseX + 200) > x) && ((mouseY - 200) < y) && ((mouseY + 200) > y)) {
        letter = 'x';
        x += random(-1, 1);
        y += random(-1, 1);
      }
      if (((mouseX - 70) < x) && ((mouseX + 70) > x) && ((mouseY - 70) < y) && ((mouseY + 70) > y)) {
        letter = 'X';
        x += random(-4, 4);
        y += random(-4, 4);
      }
      break;
    case 3:  
        letter = '.';
        x += random(-1, 1);
        y += random(-1, 1);
      if (((mouseX - 200) < x) && ((mouseX + 200) > x) && ((mouseY - 200) < y) && ((mouseY + 200) > y)) {
        letter = 'x';
        x += random(-3, 3);
        y += random(-3, 3);
      }
      if (((mouseX - 70) < x) && ((mouseX + 70) > x) && ((mouseY - 70) < y) && ((mouseY + 70) > y)) {
        letter = '+';
        x += random(-4, 4);
        y += random(-4, 4);
      }
      break;
    case 4:  
      x += random(-1, 3);//+3;
      y += random(-1, 3);//+3;
      break;
    case 5:
      x = (x*1.01); 
      y = (y*1.01); 
      break; 
    default:
      x += random(-2, 2);
      y += random(-2, 2);
      break;
    }
  }

  // Return the letter home
  void home() {
    x = homex;
    y = homey;
  }
}
