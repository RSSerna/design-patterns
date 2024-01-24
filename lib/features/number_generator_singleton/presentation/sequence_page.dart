
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:singleton_pattern/features/logger_singleton/domain/debug_logger.dart';
import 'package:singleton_pattern/features/number_generator_singleton/domain/number_generator.dart';

class SequencePage extends StatefulWidget {
  const SequencePage({Key? key}) : super(key: key);

  @override
  _SequencePageState createState() => _SequencePageState();
}

class _SequencePageState extends State<SequencePage> {
   int _counter = 0;
   void _incrementCounter() {
    final logger = DebugLogger();
    if (_counter % 2 == 0) {
      final numberGeneratorImpl = NumberGeneratorImpl();
      logger.log('NumberGeneratorImpl: ${numberGeneratorImpl.getNextNumber()}');
    }
    if (_counter % 3 == 0) {
      final eagerNumberGeneratorImpl = EagerNumberGeneratorImpl();
      logger.log(
          'EagerNumberGeneratorImpl: ${eagerNumberGeneratorImpl.getNextNumber()}');
    }
    if (_counter % 4 == 0) {
      final lazyNumberGeneratorImpl =
          LazyNumberGeneratorImpl.instance;
      logger.log(
          'LazyNumberGeneratorImpl: ${lazyNumberGeneratorImpl!.getNextNumber()}');
    }

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      logger.log('Counter: $_counter', 'Simple Error');
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Last Sequence Number:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
        label: const Text('Generate Next Number'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
