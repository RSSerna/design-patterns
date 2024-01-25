import 'package:flutter/material.dart';
import 'package:singleton_pattern/features/renderer_strategy/domain/renderer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? renderer;
  Renderer? currRenderer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategy Design Pattern'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            const Text(
              "Choose your Renderer",
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            RadioListTile(
              title: const Text("Render Image"),
              value: "image",
              groupValue: renderer,
              onChanged: (value) {
                setState(() {
                  renderer = value.toString();
                  currRenderer = ImageRenderer();
                });
              },
            ),
            RadioListTile(
              title: const Text("Render Button"),
              value: "button",
              groupValue: renderer,
              onChanged: (value) {
                setState(() {
                  renderer = value.toString();
                  currRenderer = ButtonRenderer();
                });
              },
            ),
            RadioListTile(
              title: const Text("Render Widget"),
              value: "widget",
              groupValue: renderer,
              onChanged: (value) {
                setState(() {
                  renderer = value.toString();
                  currRenderer = WidgetRenderer();
                });
              },
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              child: currRenderer?.render(),
            )
          ],
        ),
      ),
    );
  }
}
