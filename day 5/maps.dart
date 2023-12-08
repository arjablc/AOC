import "dart:io";
import "dart:async";

void main() async {
  var file = File("./maps.txt");
  Future<String> readFile() async {
    try {
      var fileString = await file.readAsString();

      return fileString;
    } catch (e) {
      return "error";
    }
  }

  String something = await readFile();

  List<String> blocks = something.split("\n\n");

  List<String> seeds = blocks[0].split(":")[1].trim().split(" ");
  blocks.removeAt(0);
  for (int i = 0; i < blocks.length; i++) {
    blocks[i] = blocks[i] = blocks[i].split(":")[1];
  }

  print(blocks);
}
