import 'dart:ffi';
import 'dart:math';

abstract class SpaceShip {
  late Point position;
  late Size size;
  late String displayName;
  late Float speed;
}

class MilleniumFalcon extends SpaceShip {
  MilleniumFalcon(Size size, Point position, Float speed) {
    this.size = size;
    this.position = position;
    this.speed = speed;
    displayName = "Millenium Falcon";
  }
}

class UNSCInfinity extends SpaceShip {
  UNSCInfinity(Size size, Point position, Float speed) {
    this.size = size;
    this.position = position;
    this.speed = speed;
    displayName = "UNSCInfinity";
  }
}

class USSEnterprise extends SpaceShip {
  USSEnterprise(Size size, Point position, Float speed) {
    this.size = size;
    this.position = position;
    this.speed = speed;
    displayName = "USSEnterprise";
  }
}

class Serenity extends SpaceShip {
  Serenity(Size size, Point position, Float speed) {
    this.size = size;
    this.position = position;
    this.speed = speed;
    displayName = "Serenity";
  }
}

class NullShip extends SpaceShip {
  NullShip() {
    displayName = "NullShape";
  }
}
