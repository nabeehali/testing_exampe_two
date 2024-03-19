import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  /// integration Test.
  FlutterDriver? driver;

  /// connect flutter driver to the app before executing the runs.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  /// disconnect flutter driver from the app after executing the runs.
  tearDownAll(() {
    if (driver != null) {
      driver!.close();
    }
  });

  /// we access widgets to control them.
  /// we access this '+' widget by Tooltip
  final buttonForIncrement = find.byTooltip("Increment");
  final resultOfTestIncrement = find.text("10");

  /// we access this '-' widget by value of key
  final buttonForDecrement = find.byValueKey("minusButton");
  final resultOfTestDecrement = find.text("0");

  group(
      "test increment and decrement  many times to ensure that working correctly",
      () => {
            test("Tap the increment button 10 times  with 1 second delay",
                () async {
              await driver!.waitForAbsent(resultOfTestIncrement);
              for (var i = 0; i < 10; i++) {
                await driver!.tap(buttonForIncrement);

                /// we use Future delayed to show result in slow mode.
                await Future.delayed(const Duration(seconds: 1));
              }
              await Future.delayed(const Duration(seconds: 2));
              await driver!.waitFor(resultOfTestIncrement);
              await Future.delayed(const Duration(seconds: 5));
              await driver!.waitUntilNoTransientCallbacks();
            }),
            test("Tap the decrement button 10 times  with 1 second delay",
                () async {
              await driver!.waitForAbsent(resultOfTestDecrement);
              for (var i = 0; i < 10; i++) {
                await driver!.tap(buttonForDecrement);
                await Future.delayed(const Duration(seconds: 1));
              }
              await Future.delayed(const Duration(seconds: 2));
              await driver!.waitFor(resultOfTestDecrement);
              await Future.delayed(const Duration(seconds: 5));

              /// Waits until there are no more transient callbacks in the queue.
              await driver!.waitUntilNoTransientCallbacks();
            })
          });
}

/// to run integration test use command below.
/// flutter drive --target=test_driver/integration.dart
