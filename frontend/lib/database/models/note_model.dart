import 'package:frontend/database/models/block_model.dart';

class NoteModel {
  String id;
  String notebook;
  String label;
  String dateEdited;
  List<Block> content;

  NoteModel({
    required this.id,
    required this.label,
    required this.content,
    required this.notebook,
    required this.dateEdited,
  });
}
