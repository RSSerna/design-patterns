import 'package:flutter/material.dart';

import '../../domain/file_manager.dart';

// The ShowAuditFilePage is a stateful widget that displays the contents of the audit file.
class ShowAuditFilePage extends StatefulWidget {
  // The constructor for this widget. A Key is optional and can be provided to uniquely identify this widget.
  const ShowAuditFilePage({Key? key}) : super(key: key);

  // The createState method creates the mutable state for this widget.
  @override
  ShowAuditFilePageState createState() => ShowAuditFilePageState();
}

// The state for the ShowAuditFilePage. The ShowAuditFilePageState class extends the State class with a type of ShowAuditFilePage.
class ShowAuditFilePageState extends State<ShowAuditFilePage> {
  // The content and filePath variables store the contents and file path of the audit file.
  String content = 'Loading...';
  String filePath = 'Loading...';

  // The initState method is called once when this object is inserted into the tree.
  @override
  void initState() {
    super.initState();
    loadFileData(); // Initial data load
  }

  // The loadFileData method updates the state with the latest file data.
  void loadFileData() async {
    String contentData = await FileAuditManager().readContent();
    String filePathData = await FileAuditManager().getFilePath();
    setState(() {
      content = contentData;
      filePath = filePathData;
    });
  }

  // The build method describes the part of the user interface represented by this widget.
  // It returns a Scaffold widget with a body that contains a Text and ElevatedButton widgets.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            left: 8.0, right: 16.0, top: 16.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment
              .start, // This alignment aligns text to the start/left
          children: <Widget>[
            Text(
              'File Path: $filePath',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'File Content:\n$content',
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ),
            Align(
              alignment:
                  Alignment.center, // This will center the Refresh button
              child: ElevatedButton(
                onPressed: loadFileData,
                child: const Text('Refresh'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
