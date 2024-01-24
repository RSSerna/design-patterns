import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';

// The FileAuditManager class is a singleton that provides
// methods for reading from and writing to a specific file.
class FileAuditManager {
  // A private constant constructor.
  // It's crucial in implementing a singleton (an object that you only instantiate once).
  static final FileAuditManager _singleton = FileAuditManager._internal();

  // Another private constructor.
  // This one is named and is used by the singleton instance.
  FileAuditManager._internal();

  // A factory constructor.
  // When you invoke the constructor, it returns the singleton instance.
  factory FileAuditManager() {
    return _singleton;
  }

  // A getter for the local file.
  // It's an asynchronous method that gets the application directory
  // and appends the file name to the path.
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/audit.txt');
  }

  // The logMessage method writes a string message to the file.
  // It's an asynchronous method that appends a timestamped message
  // to the file every time it's called.
  Future<File> logMessage(String msg) async {
    final file = await _localFile;

    String timeStamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    String finalMsg = "[$timeStamp] : $msg\n";

    return file.writeAsString(finalMsg, mode: FileMode.append);
  }

  // The readContent method reads the file and returns its content as a string.
  // If an error occurs (e.g., if the file doesn't exist), it catches the error
  // and returns an empty string.
  Future<String> readContent() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return an empty string.
      return '';
    }
  }

  // The getFilePath method returns the path of the file as a string.
  Future<String> getFilePath() async {
    final file = await _localFile;
    return file.path;
  }
}
