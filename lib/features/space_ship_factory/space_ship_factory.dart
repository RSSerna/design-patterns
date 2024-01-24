import 'dart:ffi';
import 'dart:math';

import 'package:singleton_pattern/features/space_ship_factory/space_ships.dart';

enum SpaceShipEnum { milleniumFalcon, unscInfinity, ussEnterprise, serenity }

class ShapeBuildContext {
  late Point position;
  late Size size;
  late String displayName;
  late Float speed;
  late SpaceShipEnum spaceShipEnum;
}

class SpaceShipFactory {
  SpaceShipFactory._();

  static SpaceShip createShip(ShapeBuildContext context) {
    SpaceShip result = NullShip();

    switch (context.spaceShipEnum) {
      case SpaceShipEnum.milleniumFalcon:
        {
          result =
              MilleniumFalcon(context.size, context.position, context.speed);
        }
        break;

      case SpaceShipEnum.unscInfinity:
        {
          result = UNSCInfinity(context.size, context.position, context.speed);
        }
        break;
      case SpaceShipEnum.ussEnterprise:
        {
          result = USSEnterprise(context.size, context.position, context.speed);
        }
        break;
      case SpaceShipEnum.serenity:
        {
          result = Serenity(context.size, context.position, context.speed);
        }
        break;
    }

    return result;
  }
}
