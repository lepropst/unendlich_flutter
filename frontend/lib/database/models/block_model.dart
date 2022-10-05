class Block {
  String type;
  String value;

  Block({required this.type, required this.value});
  static serialize(Block block) {
    return "${block.type}~${block.value}";
  }

  static deserialize(String str) {
    var values = str.split("~");
    if (values.length == 2) {
      return Block(type: values[0], value: values[1]);
    } else {
      throw Error();
    }
  }
}
