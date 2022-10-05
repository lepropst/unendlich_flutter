import 'package:flutter/material.dart';

class SingleInputDialog extends StatefulWidget {
  const SingleInputDialog({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SingleInputDialogState();
  }
}

class SingleInputDialogState extends State<SingleInputDialog> {
  final _formKey = GlobalKey<FormState>();
  final singleInputDialogController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    singleInputDialogController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: 100,
      width: 350,
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Form(
            key: _formKey,
            child: TextFormField(
              onFieldSubmitted: (str) {
                Navigator.pop(context, str);
              },
              controller: singleInputDialogController,
            ),
          )),
          Expanded(
            child: TextButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState != null) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  Navigator.pop(context, singleInputDialogController.text);
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    ));
  }
}
