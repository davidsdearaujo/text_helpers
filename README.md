<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
Text overflow helpers for Flutter.

## Features
**InlineText / InlineRow**
<img width="49%" src="https://user-images.githubusercontent.com/16373553/157923702-678b41cd-8b8b-4baa-8f74-c32ef4a57231.gif"/> <img width="49%" src="https://user-images.githubusercontent.com/16373553/157913688-c5526868-54da-41d4-b4b1-07746ac313ad.gif"/>

**InlineText + InlineRow**
<img width="50%" src="https://user-images.githubusercontent.com/16373553/157912891-47c70ef7-aa13-4763-bafa-b2ccc359e484.gif"/>

## Getting started
### pubspec.yaml
```
dependencies:
  text_helpers: <lastest version>
```

### import
```
import 'package:text_helpers/text_helpers.dart';
```

## Usage

### InlineRow
This widget can be used to resize just one of children when the row overflows;

In this example, the first content will be reduced when the text overflows:
```dart
InlineRow(
  wrapIndex: 0,
  children: [
    Text('First content', overflow: TextOverflow.ellipsis),
    Text('Second content'),
    Text('Third content'),
  ],
),
```

In this example, the second content will be reduced when is overflowed:
```dart
InlineRow(
  wrapIndex: 1,
  children: [
    Text('First content'),
    Text('Second content', overflow: TextOverflow.ellipsis),
    Text('Third content'),
  ],
),
```

### InlineText
This widget can be used to hide letter by letter when the text overflows; This isn't the best solution, but solve the [flutter#18761](https://github.com/flutter/flutter/issues/18761)
Look this simple example:
```dart
InlineText('Lorem Ipsum is simply dummy text')
```

<details>
  <summary>GIF</summary>
 <img width="49%" src="https://user-images.githubusercontent.com/16373553/157923702-678b41cd-8b8b-4baa-8f74-c32ef4a57231.gif"/>
</details>