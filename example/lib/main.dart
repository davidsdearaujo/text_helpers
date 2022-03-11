import 'package:flutter/material.dart';
import 'package:text_helpers/text_helpers.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InlineRow(
            wrapIndex: 0,
            children: const [
              InlineText('Jogador 1'),
              Text(': tem '),
              Text('20 pontos'),
            ],
          ),
          InlineRow(
            wrapIndex: 0,
            children: const [
              InlineText('David Santana de Araujo'),
              Text(': tem 20 pontos'),
            ],
          ),
          InlineRow(
            wrapIndex: 0,
            children: const [
              InlineText('Piá'),
              Text(': tem 20 pontos'),
            ],
          ),
          InlineRow(
            wrapIndex: 0,
            children: const [
              InlineText('Nome do piá'),
              Text(': tem 20 pontos'),
            ],
          ),
        ],
      ),
    );
  }
}
