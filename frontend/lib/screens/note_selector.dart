import 'package:frontend/components/single_input_dialog.dart';
import 'package:frontend/database/database.dart';
import 'package:frontend/screens/note_display.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

class NoteSelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectorState();
  }
}

class _SelectorState extends State<NoteSelector> {
  final Db db = Db();

  Future<List<dynamic>> callAsyncFetch() async {
    print("gettiing notebooks");
    var notebooks = await db.getAllNoteBooks();
    print(notebooks);
    return [];
  }

  void cb(params) {
    print(params);
  }

  void notebookCallback() async {
    var result = await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return SingleInputDialog();
        });

    // var lm = NoteModel(
    //   id: uuid.v1(),
    //   label: result,
    //   edited: DateTime.now().toString(),
    //   content: [],
    // );

    if (result == "") {
      return;
    }
    // if (await db.exists(lm.label, lm.id)) {
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text('AlertDialog Title'),
    //         content: SingleChildScrollView(
    //           child: ListBody(
    //             children: const <Widget>[
    //               Text('This notebook exists already'),
    //             ],
    //           ),
    //         ),
    //         actions: <Widget>[
    //           TextButton(
    //             child: const Text('Approve'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    //   return;
    // } else if (!(await db.exists(lm.label, lm.id))) {
    //   print("makinng making");
    //   await db.create(lm as NoteModel, Db.noteTable);
    //   setState(() {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: callAsyncFetch(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: notebookCallback,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              body: Center(
                // Center is a layout widget. It takes a single child and positions it
                // in the middle of the parent.
                child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 75,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      crossAxisCount: 3,
                    ),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => NoteDisplay(
                                  id: snapshot.data?[index].id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                              color: Colors.teal[50],
                              child: Card(
                                  child: Column(children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      iconSize: 15,
                                      tooltip: 'delete',
                                      onPressed: () async {
                                        // await db.delete(
                                        //     snapshot.data![index].id,
                                        //     Db.noteTable);
                                        // // handle the press
                                        // setState(() {});
                                      },
                                    )
                                  ],
                                ),
                                Text(snapshot.data?[index].label)
                              ]))));
                    }),
              ),
            );
          } else {
            return Scaffold(
                body: Center(
                    // Center is a layout widget. It takes a single child and positions it
                    // in the middle of the parent.
                    child: Text("Unable to fetch lists")));
          }
        });
  }
}
