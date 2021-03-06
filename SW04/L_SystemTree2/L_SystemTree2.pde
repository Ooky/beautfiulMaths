ArrayList<Character> listPreviousChar = new ArrayList<Character>(); //<>//
HashMap<Character, String> mapRules = new HashMap<Character, String>();
ArrayList<Character> listNextChar = new ArrayList<Character>();

int lineLength = 100;
float theta;

void setup() {
  size(800, 800); 
  background(0);
  stroke(255);
  theta = radians(45);
  //Prepare first letter
  listPreviousChar.add('F');
  //Define HashMap + angle
  //mapRules.put('F', "FF+[+F-F-F]-[-F+F+F]");

  //mapRules.put('F', "F[-F]F[+F]F");
  //theta = radians(25);

  //mapRules.put('F', "FF+[+F-F-F]-[-F+F+F]");
  //theta = radians(25);


  /*
  mapRules.put('F', "F[F]-F+F[--F]+F-F");
   listPreviousChar.add('-');
   listPreviousChar.add('F');
   listPreviousChar.add('-');
   listPreviousChar.add('F');
   theta = radians(90);
   */

  /*
  mapRules.put('F', "F-F++F-F");
  listPreviousChar.add('+');
  listPreviousChar.add('+');
  listPreviousChar.add('F');
  listPreviousChar.add('+');
  listPreviousChar.add('+');
  listPreviousChar.add('F');
  theta = radians(60);
  */
  
  
  mapRules.put('F', "F--F--F--GG");
  mapRules.put('G', "GG");
  listPreviousChar.add('-');
  listPreviousChar.add('-');
  listPreviousChar.add('F');
  listPreviousChar.add('-');
  listPreviousChar.add('-');
  listPreviousChar.add('F');
  theta = radians(60);
  
  
  
  /*
  mapRules.put('F', "[-G+++F][-G+F][GG--F]");
  mapRules.put('G', "GG");
  theta = radians(60);
  */



  //mapRules.put('F', "[+F][-F]");
  //theta = radians(45);
  //Print first State
  println(listPreviousChar.get(0));
}

void draw() {
}

void lSystem(boolean printChars) {
  listNextChar.clear();
  //for every character in my list
  for (int i = 0; i <listPreviousChar.size(); i++) {
    String currentString = mapRules.get(listPreviousChar.get(i));
    //check if value of key is not empty
    if (currentString != null) {
      //for every valueLENGTH in the map corresponding to the char
      for (int j = 0; j < currentString.length(); j++) {
        //add the char to the list
        listNextChar.add(currentString.charAt(j));
      }
    } else {
      listNextChar.add(listPreviousChar.get(i));
    }
  }
  //Draw something to listNextChar
  for (int i = 0; i< listNextChar.size(); i++) {
    if (listNextChar.get(i).equals('F')) {
      line(0, 0, lineLength, 0);
      translate(lineLength, 0);
    } else if (listNextChar.get(i).equals('+')) {
      rotate(theta);
    } else if (listNextChar.get(i).equals('-')) {
      rotate(-theta);
    } else if (listNextChar.get(i).equals('[')) {
      pushMatrix();
    } else if (listNextChar.get(i).equals(']')) {
      popMatrix();
    } else if (listNextChar.get(i).equals('G')) {
       translate(lineLength, 0); 
    }
  }

  //Copy listNext-Values to listPrevious-Values
  listPreviousChar.clear();
  for (Character c : listNextChar) {
    listPreviousChar.add(c);
  }

  if (printChars) {
    //print listNext
    for (int i = 0; i<listNextChar.size(); i++) {
      print(listNextChar.get(i));
    }
    println("");
  }
}



void mousePressed() {
  translate(width/2, height);
  rotate(-PI/2);
  lineLength *=0.6;
  lSystem(false);
}