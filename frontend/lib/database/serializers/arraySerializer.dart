import 'package:frontend/database/models/block_model.dart';

const arrayDelimiter = "\::";

String serialize(List<Block> list) {
  if (list.isEmpty) {
    throw Error();
  }
  if (list.length == 1) {
    return Block.serialize(list[0]);
  }
  if (list.length > 0) {
    String str = "";
    list.map((block) => str = "${str}::${Block.serialize(block)}");
    return str;
  }
  throw Error();
}

List<Block> deserialize(String str) {
  List<Block> list = [];
  var result = str.split(arrayDelimiter);
  result.map((e) {
    if (e != "") list.add(Block.deserialize(e));
  });
  return list;
}
