import 'dart:convert';
import 'dart:io';

//Thinking of optimizing the file using Streams
void main() async {
  File file = File("./input.txt");
  Stream fileData =
      await file.openRead().transform(utf8.decoder).transform(LineSplitter());
  //reads as bytes so we need to convert it to utf8
  int result = 0;

  await for (String line in fileData) {
    List<int> digits = [];
    for (String char in line.split("")) {
      int? number = int.tryParse(char);
      if (number != null) {
        digits.add(number);
      }
    }

    int calib = int.parse("${digits.first}${digits.last}");

    result += calib;
  }
  print(result);
}
