import 'package:flutter/material.dart';
import 'package:frontend/components/block_types.dart';
import 'package:frontend/components/block_view.dart';
import 'package:frontend/database/models/block_model.dart';
import 'package:frontend/markdown/engine.dart';

class NoteEditor extends StatelessWidget {
  final List<Block> content;

  NoteEditor({required this.content});

  @override
  Widget build(BuildContext context) {
    content.add(Block(type: markdown, value: ""));
    return ListView.builder(itemBuilder: ((context, index) {
      return BlockView(block: Engine.parse(content[index]));
    }));
  }
}
