import 'package:flutter_test/flutter_test.dart';
import 'package:testing_example_two/counter.dart';

void main() {
  Counter? counter;
  setUpAll(() {
    /// we have initial value of counter.
    counter = Counter(value: 10);
  });

  /// group of test of decrement and increment counter.
  group("test counter class", () {
    test("testing decrement counter", () {
      counter?.decrementCounter();
      expect(counter!.value, 9);
    });

    /// if run this test alone the test failed but if run the hole group the test is passed.
    test("testing increment counter", () {
      counter?.incrementCounter();
      expect(counter!.value, 10);
    });
  });
}
