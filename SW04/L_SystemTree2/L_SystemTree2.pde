ArrayList<Character> listPreviousChar = new ArrayList<Character>();
HashMap<Character, String> mapRules = new HashMap<Character, String>();
ArrayList<Character> listNextChar = new ArrayList<Character>();



void setup() {
  //Define HashMap
  mapRules.put('A', "ABA");
  mapRules.put('B', "BBB");
  //Prepare first letter
  listPreviousChar.add('A');
  println(listPreviousChar.get(0));
}

void draw() {
}

void mousePressed() {
  listNextChar.clear();
  for (int i = 0; i <listPreviousChar.size(); i++) {
    for (int j = 0; j < mapRules.get(listPreviousChar.get(i)).length(); j++) {
      listNextChar.add(mapRules.get(listPreviousChar.get(i)).charAt(j));
    }
  }
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