import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class PlayerState {
  void play(Player player);
  void stop(Player player);
  void pause(Player player);
}

class StoppedState implements PlayerState {
  @override
  void play(Player player) {
    player.setState(PlayingState());
    player.play();
  }

  @override
  void stop(Player player) {
    if (player._state is StoppedState) {
      debugPrint('Player is already Stopped');
    }
    debugPrint('Player has Stopped');
  }

  @override
  void pause(Player player) {
    player.setState(PausedState());
    player.pause();
  }
}

class PlayingState implements PlayerState {
  @override
  void play(Player player) {
     if (player._state is PlayingState) {
      debugPrint('Player is already Playing');
    }
    debugPrint('Player has started Playing');
  }

  @override
  void stop(Player player) {
    player.setState(StoppedState());
    player.stop();
  }

  @override
  void pause(Player player) {
    player.setState(PausedState());
    player.pause();
  }
}

class PausedState implements PlayerState {
  @override
  void play(Player player) {
    player.setState(PlayingState());
    player.play();
  }

  @override
  void stop(Player player) {
    player.setState(StoppedState());
    player.stop();
  }

  @override
  void pause(Player player) {
     if (player._state is PausedState) {
      debugPrint('Player is already Paused');
    }
    debugPrint('Player has been Paused');
  }
}

// Player class using State Design Pattern
class Player {
  late PlayerState _state;

  Player() {
    _state = StoppedState();
  }

  void setState(PlayerState state) {
    _state = state;
  }

  void play() {
    _state.play(this);
  }

  void stop() {
    _state.stop(this);
  }

  void pause() {
    _state.pause(this);
  }
}

void main() {
  Player player = Player();

  // TODO: Add some sample usage here
}
