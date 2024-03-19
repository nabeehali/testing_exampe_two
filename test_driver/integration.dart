import 'package:flutter_driver/driver_extension.dart';
import 'package:testing_example_two/main.dart' as app;

void main() {
  /// we use this line to enables flutter driver VM service extension.
  enableFlutterDriverExtension();

  ///to run main file in lib folder
  app.main();
}
