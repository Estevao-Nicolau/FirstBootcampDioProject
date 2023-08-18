import 'package:first_challenge_dio_flutter/controller/counter.dart';
import 'package:flutter/material.dart'; // Import the controller

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: 'Flutter Demo Home Page',
          controller: CounterController()), // Pass the controller
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.controller,
  });

  final String title;
  final CounterController controller;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador',
            ),
            Text(
              '${widget.controller.counter}', // Use the counter value from the controller
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.controller
                .incrementCounter(); // Call the increment method from the controller
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add_circle_outline_rounded),
      ),
    );
  }
}
