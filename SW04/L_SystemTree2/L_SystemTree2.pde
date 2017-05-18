ArrayList<Character> listPreviousChar = new ArrayList<Character>(); //<>//
HashMap<Character, String> mapRules = new HashMap<Character, String>();
ArrayList<Character> listNextChar = new ArrayList<Character>();

void setup() {
  //Prepare first letter
  listPreviousChar.add('F');
  //Define HashMap
  mapRules.put('F', "FF+[+F-F-F]-[-F+F+F]");
  //mapRules.put('B', "BBB");
  //Print first State
  println(listPreviousChar.get(0));
}

void draw() {
}

void mousePressed() {
  listNextChar.clear();
  //for every character in my list
  for (int i = 0; i <listPreviousChar.size(); i++) {
    //check if value of key is not empty
    if (mapRules.get(listPreviousChar.get(i)) != null) {
      //for every valueLENGTH in the map corresponding to the char
      for (int j = 0; j < mapRules.get(listPreviousChar.get(i)).length(); j++) {
        //add the char to the list
        listNextChar.add(mapRules.get(listPreviousChar.get(i)).charAt(j));
      }
    }
  }
  //print listNext
  for (int i = 0; i<listNextChar.size(); i++) {
    print(listNextChar.get(i));
  }
  println("");

  //Copy listNext-Values to listPrevious-Values
  listPreviousChar.clear();
  for (Character c : listNextChar) {
    listPreviousChar.add(c);
  }
}