import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InlineRow extends StatefulWidget {
  final List<Widget> children;
  final int wrapIndex;
  const InlineRow({
    Key? key,
    required this.wrapIndex,
    required this.children,
  })  : assert(wrapIndex < children.length),
        assert(wrapIndex >= 0),
        super(key: key);

  @override
  State<InlineRow> createState() => _InlineRowState();
}

class _InlineRowState extends State<InlineRow> {
  var globalKeys = <GlobalKey>[];
  var childrenSizes = <Size>[];

  Size get childrenTotalSize {
    if (childrenSizes.isEmpty) return Size.zero;
    return childrenSizes
        .reduce((a, b) => Size(a.width + b.width, a.height + b.height));
  }

  @override
  void initState() {
    globalKeys = List.generate(widget.children.length, (index) => GlobalKey());
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      childrenSizes = List.generate(
        globalKeys.length,
        (index) => globalKeys[index].currentContext?.size ?? Size.zero,
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: List.generate(widget.children.length, (index) {
          final isCurrentWrapText = widget.wrapIndex == index;
          final sizesAlreadyLoaded = childrenSizes.isNotEmpty;
          BoxConstraints? wrapperConstraints;
          if (isCurrentWrapText && sizesAlreadyLoaded) {
            final totalSize = childrenTotalSize.width;
            final otherContentWidth = totalSize - childrenSizes[index].width;
            final maxWidth = constraints.maxWidth - otherContentWidth;
            wrapperConstraints = BoxConstraints(maxWidth: max(0, maxWidth));
          }
          return Container(
            constraints: wrapperConstraints,
            key: globalKeys[index],
            child: widget.children[index],
          );
        }),
      );
    });
  }
}
