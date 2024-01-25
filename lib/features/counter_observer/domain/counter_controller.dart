import 'dart:async';

import 'package:flutter/foundation.dart';

/// possible events that we will be listening for
///
enum Event { increment, decrement }

///
class CounterController {
  /// the value that we are tracking through our events
  ///
  int counter = 0;

  ///
  /// These streams will handle any changes in teh value of [counter]
  /// in this sense the [CounterController] will act as an Observer
  /// NOTE:  [CounterController] is not a widget so this shows how this
  /// mechanism is useful for serialized communication in general
  ///
  final StreamController<int> _counterController =
      StreamController<int>.broadcast();
  StreamSink<int> get counterSink => _counterController.sink;
  Stream<int> get counterStream => _counterController.stream;

  // we can directly use the counter sink from widget itself but to reduce the logic
  // from the UI files we are making use of one more controller that will listen to
  // button click events by user.

  ///
  /// These streams will be used to send a notification to the specific
  /// Flutter Widget (in our case) our counter text.
  /// Bascially, this is the stream on which the StreamBuilder in our UI will
  /// be listeining for any changes to.
  ///
  final StreamController<Event> _eventController = StreamController<Event>();
  StreamSink<Event> get eventSink => _eventController.sink;
  Stream<Event> get eventStream => _eventController.stream;

  // NOTE: here we will use listener to listen the _eventController

  ///
  /// In order to setup the listener we need to use the [StreamSubscription]
  /// class which becomes our listsner.
  /// NOTE: Note that the subscription is bound to our [eventStream] and we can
  /// only have 1 (i.e. single) such binding. If you try to get another
  /// [StreamSubscription] to [eventStream] it will cause an error
  ///
  StreamSubscription? listener;

  ///
  /// start listening for events as soon as the controller is instantiated
  ///
  CounterController() {
    /// We are listening for events that were originated outside of the
    /// controller and we act on the event.
    ///
    listener = eventStream.listen((Event event) {
      debugPrint('CounterController - <receive> <event notification>');
      switch (event) {
        case Event.increment:
          counter += 1;

          break;
        case Event.decrement:
          counter -= 1;
          break;
        default:
      }

      /// Once the event has been processed by the controller we then trigger
      /// a data notification on the [CounterController] and whoever is
      /// listening will get the notifiation and the current data state
      /// (i.e. [counter]) as part of the payload
      ///
      counterSink.add(counter);
      debugPrint('CounterController - <send> <event trigger>');
    });
  }

  /// Dispose of the listener and close all relevant streams to eliminate any
  /// possible memory leaks
  dispose() {
    listener?.cancel();
    _counterController.close();
    _eventController.close();
  }
}
