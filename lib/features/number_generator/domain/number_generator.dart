abstract class NumberGenerator {
  int number = 0;

  int getNextNumber() => number++;
}

class NumberGeneratorImpl extends NumberGenerator {
  static NumberGeneratorImpl? _instance;

  NumberGeneratorImpl._internal() {
    print('<NumberGeneratorImpl> creation');
    _instance = this;
  }
  factory NumberGeneratorImpl() => _instance ?? NumberGeneratorImpl._internal();
}

class LazyNumberGeneratorImpl extends NumberGenerator {
  static LazyNumberGeneratorImpl? _instance;
  LazyNumberGeneratorImpl._internal() {
    print('<ClassicLazyNumberGeneratorImpl> creation');
  }

  static LazyNumberGeneratorImpl? get instance {
    return _instance ?? LazyNumberGeneratorImpl._internal();
  }
}

class EagerNumberGeneratorImpl extends NumberGenerator {
  static final EagerNumberGeneratorImpl _instance =
      EagerNumberGeneratorImpl.internal();
  EagerNumberGeneratorImpl.internal() {
    print('<EagerNumberGeneratorImpl> creation');
  }

  factory EagerNumberGeneratorImpl() => _instance;
}
