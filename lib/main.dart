import 'package:flutter/material.dart';
import 'package:testing_example_two/counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Testing',
      home: MyHomePage(title: 'testing page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Counter counter = Counter(value: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text(widget.title), backgroundColor: Colors.green),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Number of counter',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
                Text(
                  '${counter.value}',
                  style: const TextStyle(color: Colors.green, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              key: counter.minusButtonKey,
              onPressed: () {
                setState(() {
                  counter.decrementCounter();
                });
              },
              backgroundColor: Colors.green,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                setState(() {
                  counter.incrementCounter();
                });
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }
}
