// // TODO: Define the TextEditorState interface
// abstract class TextEditorState {
//   String enterText(String currentText, String newText);
//   String bold(String currentText);
//   String italic(String currentText);
//   String underline(String currentText);
//   String undo(String currentText);
//   String redo(String currentText);
// }

// // TODO: Implement DefaultState
// class DefaultState implements TextEditorState {
//   // TODO: Fill in methods here
// }

// // TODO: Implement BoldState
// class BoldState implements TextEditorState {
//   // TODO: Fill in methods here
// }

// // TODO: Implement ItalicState
// class ItalicState implements TextEditorState {
//   // TODO: Fill in methods here
// }

// // TODO: Implement UnderlineState
// class UnderlineState implements TextEditorState {
//   // TODO: Fill in methods here
// }

// // TextEditor class using State Design Pattern
// class TextEditor {
//   TextEditorState _state;
//   String _currentText = "";
//   List<String> _history = [];
//   int _historyIndex = -1;

//   TextEditor() {
//     // TODO: Initialize the state
//   }

//   // TODO: Add a method to set the state
//   void setState(TextEditorState state) {
//     // TODO: Implement this method
//   }

//   // TODO: Implement methods to handle text input and formatting
//   void enterText(String newText) {
//     // TODO: Delegate to state object
//   }

//   void bold() {
//     // TODO: Delegate to state object
//   }

//   void italic() {
//     // TODO: Delegate to state object
//   }

//   void underline() {
//     // TODO: Delegate to state object
//   }

//   void undo() {
//     // TODO: Delegate to state object
//   }

//   void redo() {
//     // TODO: Delegate to state object
//   }
// }

// void main() {
//   TextEditor editor = TextEditor();

//   // TODO: Add some sample usage here
// }
