import 'dart:convert';
import 'dart:io';

void main() async {
  File file = File("./input.txt");
  var fileStream =
      file.openRead().transform(Utf8Decoder()).transform(LineSplitter());

  Map<String, int> wordNumbers = {
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eight": 8,
    "nine": 9
  };
  RegExp firstReg = RegExp(r'\d' + wordNumbers.keys.join("|"));
  await for (String line in fileStream) {}
}
