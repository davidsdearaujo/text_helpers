import 'package:flutter/material.dart';
import 'package:text_helpers/text_helpers.dart';

class InlineRowExample extends StatelessWidget {
  const InlineRowExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('InlineRow Example')),
      body: Center(
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: InlineRow(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: 100),
                child: Image.network(
                  'https://yt3.ggpht.com/ytc/AKedOLQi9UpqABoSJK_Dw9LsULNHizpYfEaRya5437Wv=s900-c-k-c0x00ffffff-no-rj',
                ),
              ),
              Text('Flutterando, comunity of Flutter from Brazil',
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
