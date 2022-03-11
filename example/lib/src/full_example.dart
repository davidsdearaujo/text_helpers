import 'package:flutter/material.dart';
import 'package:text_helpers/text_helpers.dart';

class FullExample extends StatelessWidget {
  const FullExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Helpers Example')),
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 20, color: Colors.black),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: InlineRow(
                wrapIndex: 0,
                children: const [
                  InlineText('Jogador 1'),
                  Text(': have '),
                  Text('20 points'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: InlineRow(
                wrapIndex: 0,
                children: const [
                  InlineText('Jogador 1'),
                  Text(': have '),
                  Text('20 points'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: InlineRow(
                wrapIndex: 0,
                children: const [
                  InlineText('David Santana de Araujo'),
                  Text(': have 20 points'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: InlineRow(
                wrapIndex: 0,
                children: const [
                  InlineText('Piá'),
                  Text(': have 20 points'),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: InlineRow(
                wrapIndex: 0,
                children: const [
                  InlineText('Nome do piá'),
                  Text(': have 20 points'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
