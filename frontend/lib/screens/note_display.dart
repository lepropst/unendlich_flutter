import 'package:flutter/material.dart';
import 'package:frontend/components/note_editor.dart';
import 'package:frontend/database/models/note_model.dart';

class NoteDisplay extends StatefulWidget {
  final String id;
  NoteDisplay({required this.id});

  @override
  State<StatefulWidget> createState() {
    return _NoteDisplayState();
  }
}

class _NoteDisplayState extends State<NoteDisplay> {
  // Future<NoteModel> asyncCall() async {
  //   var item = (await db.get(widget.id, Db.noteTable))[0];
  //   return item;
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NoteModel>(
        // future: asyncCall(),
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Scaffold(
            body: Center(child: NoteEditor(content: snapshot.data!.content)));
      } else {
        return Container();
      }
    });
  }
}
