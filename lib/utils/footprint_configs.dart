import 'package:footprint/footprint.dart';

class FootprintReleaseConfig extends FootprintConfig {
  @override
  void footprint(anything) {
//    Crashlytics.instance
//        .log(
//        '##############################################################################################'
//        + '\n'
//        + anything
//        + '\n'
//        );
  }

  @override
  void log(anything) {
    print(anything);
  }

  @override
  void report(e, stacktrace) {
//    Crashlytics.instance.record(e,stacktrace);
  }
}

class FootprintDebugConfig extends FootprintConfig {
  @override
  void footprint(anything) {}

  @override
  void log(anything) {
    print(anything);
  }

  @override
  void report(e, stacktrace) {
    print(e);
    print(stacktrace);
  }
}
