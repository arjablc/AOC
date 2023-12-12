import "dart:io";

void main() async {
  File outFile = File("./out.txt");
  File inFile = File("./input.txt");
  String fileString = await inFile.readAsString();
  List<String> stringList = fileString.trim().split("\n");

  List<int> intList = [];
  for (String string in stringList) {
    List<String> charList = string.split("");
    for (String char in charList) {
      try {
        int temp = int.parse(char);
        intList.add(temp);
        temp = 0;
      } catch (exception) {
        throw exception;
      } finally {
        continue;
      }
    }
    print(intList);

    intList.length != 1
        ? await outFile.writeAsString("${intList.first}${intList.last}\n",
            mode: FileMode.append)
        : await outFile.writeAsString("${intList.first}${intList.first}\n",
            mode: FileMode.append);

    intList = [];
  }

  String calibValues = await outFile.readAsString();
  List calibArr = calibValues.trim().split("\n");
  int result = 0;
  for (String calib in calibArr) {
    int smth = int.parse(calib);
    result += smth;
  }
  print(result);
}
