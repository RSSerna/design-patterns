import 'package:flutter/material.dart';
import 'package:singleton_pattern/features/counter_observer/domain/counter_controller.dart';

void main() {
  runApp(const MyApp());
}

/// The Root of the application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /// The Root Widget of the application
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stream Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

/// We need a stateful widget since we will be tracking state data and
/// need the ability to track state changes
///
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// The main Widget of our UI
///
class _MyHomePageState extends State<MyHomePage> {
  /// This is the controller that we will use to track data changes
  ///
  late CounterController _counterController;

  @override
  /// Initialize our state controller which will track the counter data changes
  ///
  void initState() {
    _counterController = CounterController();
    super.initState();
  }

  @override
  /// We need to dispose of the Controller and all the streams when the Widget
  /// is being disposed of.
  ///
  void dispose() {
    /// this triggers our 'actua' dispose code in the controller
    _counterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Streams Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Center(
              child: StreamBuilder<int>(
                  stream: _counterController.counterStream,
                  initialData: 0,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<int> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      debugPrint(
                          '_MyHomePageState - <receive> <event notification> data: ${snapshot.data}');
                      return Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    } else {
                      return Text(
                        'Empty data',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    }
                  })),
          Center(
              child: StreamBuilder<int>(
                  stream: _counterController.counterStream,
                  initialData: 0,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<int> snapshot,
                  ) {
                    if (snapshot.hasData) {
                      debugPrint(
                          '_MyHomePageState - <receive> <event notification> data: ${snapshot.data}');
                      return Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    } else {
                      return Text(
                        'Empty data',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    }
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  debugPrint('_MyHomePageState - <send> <event trigger>');
                  _counterController.eventSink.add(Event.decrement);
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  debugPrint('_MyHomePageState - <send> <event trigger>');
                  _counterController.eventSink.add(Event.increment);
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
