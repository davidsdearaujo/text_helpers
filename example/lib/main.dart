import 'package:flutter/material.dart';

import 'src/full_example.dart';
import 'src/inline_row_example.dart';
import 'src/inline_text_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Helpers Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Helpers Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('InlineRow'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => InlineRowExample()),
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('InlineText'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => InlineTextExample()),
                );
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Full Example'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FullExample()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
