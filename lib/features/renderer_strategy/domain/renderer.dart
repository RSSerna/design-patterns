import 'package:flutter/material.dart';

/// our abstract [Renderer] which is the strategy imterface contract
///
abstract class Renderer {
  /// our main abstract method which will provide a renderable widget back
  /// to the caller
  Widget render();
}

/// Specific implementation of the Renderer contract which will render an image
///
/// You could provide a constructor which accepts an initializtion string with
/// the specific URI to the image you would like to load
///
class ImageRenderer extends Renderer {
  @override
  Widget render() {
    return Image.asset('images/dart_with_flutter.png');
  }
}

/// Specific implementation of the Renderer contract which will render a specific
/// buton.
///
/// To make this more flexible you could provide such initialization data
/// (via constructor) as style, button text, and onPressed handler
class ButtonRenderer extends Renderer {
  @override
  Widget render() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      onPressed: () {
        debugPrint('Elevated Button Pressed');
      },
      child: const Text('Elevated Button'),
    );
  }
}

/// Specific implementation of the Renderer contract which will render some
/// widget
class WidgetRenderer extends Renderer {
  @override
  Widget render() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        debugPrint('Tapped The Row');
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.local_fire_department,
            color: Colors.amberAccent,
          ),
          Text('Row Widget'),
          Icon(Icons.local_fire_department),
        ],
      ),
    );
  }
}
