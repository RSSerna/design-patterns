import 'package:flutter/material.dart';

import '../../domain/file_manager.dart';

// The LogMessagePage is a stateful widget that allows the user to log messages.
class LogMessagePage extends StatefulWidget {
  // The constructor for this widget. A Key is optional and can be provided to uniquely identify this widget.
  const LogMessagePage({Key? key}) : super(key: key);

  // The createState method creates the mutable state for this widget.
  @override
  LogMessagePageState createState() => LogMessagePageState();
}

// The state for the LogMessagePage. The LogMessagePageState class extends the State class with a type of LogMessagePage.
class LogMessagePageState extends State<LogMessagePage> {
  // A TextEditingController to control the text field that accepts the message.
  final TextEditingController _controller = TextEditingController();

  // The _logMessage method logs a message to a file by calling the logMessage method of the FileAuditManager.
  // After logging the message, it clears the text field.
  void _logMessage() async {
    await FileAuditManager().logMessage(_controller.text);
    _controller.clear();
  }

  // The build method describes the part of the user interface represented by this widget.
  // It returns a Scaffold widget with a body that contains a TextField and an ElevatedButton.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter message',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _logMessage,
              child: const Text('Log Message'),
            ),
          ],
        ),
      ),
    );
  }
}
