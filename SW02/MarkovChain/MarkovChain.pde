ArrayList<String> eachWord; //<>//
int wordCount = 16;
void setup() {
  size(300, 400);
  PFont f= createFont("Arial", 16, true);
  textFont(f, 36);
  background(255);
  fill(0);
  eachWord = new ArrayList<String>();
  println("preparingText");
  prepareText(false);
  println("Done, generating HashMap");
  HashMap<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
  for (int i = 0; i < eachWord.size(); i++) {
    ArrayList<String> temp = new ArrayList<String>();
    for (int j = 0; j <eachWord.size()-1; j++) {
      if (eachWord.get(i).equals(eachWord.get(j))) {
        temp.add(eachWord.get(j+1));
      }
    }
    map.put(eachWord.get(i), temp);
  }

  println("Done, generating random stuff now");
  //Startpoint

  ArrayList<String> myKeys = new ArrayList<String>(map.keySet());
  int randomKey = (int)random(map.size()-1);
  String startString = myKeys.get(randomKey);
  println(map.get(startString).size());
  println("startString = " + startString);
  String currentString = startString;
  ArrayList<String> myValues;
  String endString = currentString;

  for (int i = 0; i <wordCount; i++) {
    myValues = map.get(currentString);
    int randomValue = (int)random(myValues.size());
    currentString = myValues.get(randomValue);
    endString+=myValues.get(randomValue)+ " ";
    text(myValues.get(randomValue)+ " ", 10, 10*i*3, width, height);
  }
  //println(endString);
  //text("HELLO WORLD", 10, 10);
}



void prepareText(boolean printText) {
  String[] lines = loadStrings("Vigilante-shorter.txt");

  for (int i = 0; i < lines.length; i++) {
    lines[i] = lines[i].replace(".", ""); 
    lines[i] = lines[i].replace(",", ""); 
    lines[i] = lines[i].replace(";", "");
    lines[i] = lines[i].replace("\"", ""); 
    lines[i] = lines[i].replace("?", ""); 
    lines[i] = lines[i].replace("\n", "");
    lines[i] = lines[i].replace("\r\n", "");
    lines[i] = lines[i].replace("\r", "");
  }
  for (int i =0; i < lines.length; i++) {
    String[] words = split(lines[i], ' ');
    for (int j = 0; j < words.length; j++) {
      eachWord.add(words[j]);
    }
  }
  if (printText) { 
    //PRINT ALL WORDS(Well, it doesn't print ALL)
    for (int i = 0; i <eachWord.size(); i++) {
      println(eachWord.get(i));
    }
  }
}