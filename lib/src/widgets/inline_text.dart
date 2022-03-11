import 'package:flutter/material.dart';

import '../extensions.dart';

class InlineText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double? textScaleFactor;
  const InlineText(
    this.text, {
    Key? key,
    this.textScaleFactor,
    this.style,
  }) : super(key: key);

  @override
  State<InlineText> createState() => _InlineTextState();
}

class _InlineTextState extends State<InlineText> {
  late final characterKeys = List.generate(
    widget.text.characters.length,
    (index) => GlobalKey(),
  );

  late final characterVisible = List.generate(
    widget.text.characters.length,
    (index) => true,
  );

  bool isFirstLoaded = false;
  final rowKey = GlobalKey();
  Size? rowSize;

  final pointsKey = GlobalKey();
  Size? pointsSize;

  bool isOverflowed = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      isFirstLoaded = true;
      if (rowKey.currentContext?.globalPaintBounds?.size != null) {
        final size = rowKey.currentContext!.globalPaintBounds!.size;
        rowSize = Size(size.width, size.height);
      }
      checkIfIsOverflowed();
      refreshVisibility();
      setState(() {});
    });
  }

  void refreshVisibility() {
    if (!isFirstLoaded) return;
    final currentRect = context.globalPaintBounds;
    if (currentRect == null) return;
    characterKeys.asMap().forEach((index, key) {
      final charactereRect = key.currentContext?.globalPaintBounds;
      if (charactereRect == null) return;
      final incrementValue = isOverflowed ? (pointsSize?.width ?? 0) : 0;
      final contains = currentRect.contains(Offset(
        charactereRect.topRight.dx - 1 + incrementValue,
        charactereRect.topRight.dy,
      ));
      characterVisible[index] = contains;
    });
  }

  void checkIfIsOverflowed() {
    if (!isFirstLoaded) return;

    if (pointsKey.currentContext?.globalPaintBounds?.size != null) {
      final size = pointsKey.currentContext!.globalPaintBounds!.size;
      pointsSize = Size(size.width, size.height);
    }

    final currentRect = context.globalPaintBounds;
    final rowRect = rowKey.globalPaintBounds;
    if (currentRect == null) return;
    if (rowRect == null) return;
    final contains = currentRect.contains(Offset(
      rowRect.topRight.dx - 1,
      rowRect.topRight.dy,
    ));
    isOverflowed = !contains;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      checkIfIsOverflowed();
      refreshVisibility();
      return Stack(
        children: [
          Opacity(
            opacity: 0,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: rowSize?.width ?? 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  widget.text.characters.length,
                  (index) {
                    final character = widget.text.characters.elementAt(index);
                    return Text(
                      character,
                      style: widget.style,
                      textScaleFactor: widget.textScaleFactor,
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Row(
              key: rowKey,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                widget.text.characters.length,
                (index) {
                  final character = widget.text.characters.elementAt(index);
                  return Opacity(
                    opacity: characterVisible[index] ? 1 : 0,
                    child: Container(
                      key: characterKeys[index],
                      child: Text(
                        character,
                        style: widget.style,
                        textScaleFactor: widget.textScaleFactor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (isOverflowed)
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              child: Text(
                '...',
                key: pointsKey,
                style: widget.style,
                textScaleFactor: widget.textScaleFactor,
              ),
            ),
        ],
      );
    });
  }
}
