import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class HangmanWords{
  int wordcount = 0;
  List<int> _usednumbers = [];
  List<String> _words = []; 
  Future readWords() async{
    String fileText = await rootBundle.loadString('res/hangman_words.txt');
    _words = fileText.split("\n");
  }
  void resetWords(){
    int wordcount = 0;
    List<int> _usednumbers = [];
  }
  String getWord() {
    wordcount += 1;
    var rand = Random();
    int wordLength = _words.length;
    int randNumber = rand.nextInt(wordLength);
    bool notUnique = true;
    if (wordcount - 1 == _words.length) {
      notUnique = false;
      return '';
    }
    while (notUnique) {
      if (!_usednumbers.contains(randNumber)) {
        notUnique = false;
        _usednumbers.add(randNumber);
        return _words[randNumber];
      } else {
        randNumber = rand.nextInt(wordLength);
      }
    }
  }

  String getHiddenWord(int wordLength) {
    String hiddenWord = '';
    for (int i = 0; i < wordLength; i++) {
      hiddenWord += '_';
    }
    return hiddenWord;
  }

}