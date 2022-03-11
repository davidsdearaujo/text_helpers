import 'package:flutter/material.dart';
import 'package:text_helpers/text_helpers.dart';

class InlineTextExample extends StatelessWidget {
  const InlineTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InlineText Example')),
      body: Center(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: InlineText(
            'Lorem Ipsum is simply dummy text',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
