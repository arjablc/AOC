import 'dart:convert';
import 'dart:io';

//**This works */
//Thinking of optimizing the file using Streams
void main() async {
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

  File file = File("./input.txt");
  Stream fileData =
      file.openRead().transform(utf8.decoder).transform(LineSplitter());
  RegExp reg = RegExp(r'\d|' + wordNumbers.keys.join("|"));

  //reads as bytes so we need to convert it to utf8
  int result = 0;

  List<String> list = [];
  await for (String line in fileData) {
//* Error with my approach was that string like eighthree will be replaced to 8hree and the three
//* that needs to be replaced will not be replaced
    String replacedString = line.replaceAllMapped(
        RegExp(
            r'(?<=(e))ight|(?<=t)hree|(?<=n)ine|(?<=o)ne|(?<=t)wo(?<=f)our|(?<=f)ive|(?<=s)ix|(?<=s)even'),
        (match) {
      print(match[0]);
      if (match[0] == "ight") {
        return "ei8ght";
      } else if (match[0] == "hree") {
        return "th3ree";
      } else if (match[0] == "our") {
        return "fo4ur";
      } else if (match[0] == "ive") {
        return "fi5ve";
      } else if (match[0] == "ix") {
        return "si6x";
      } else if (match[0] == "even") {
        return "sev7en";
      } else if (match[0] == "wo") {
        return "tw2o";
      } else if (match[0] == "ne") {
        return "on1e";
      }

      return "ni9ne";
    });

    List<RegExpMatch> matches = reg.allMatches(replacedString).toList();
    for (final m in matches) {
      int? value = int.tryParse(m[0].toString());
      if (value != null) {
        list.add(value.toString());
      } else {
        list.add("${wordNumbers[m[0]]}");
      }
    }
    print(list);
    int calib = int.parse("${list.first}${list.last}");

    result += calib;

    list = [];
    // print(calib);
  }
//* part one
  print(result);
}
