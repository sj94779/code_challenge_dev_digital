import 'package:flutter/material.dart';

class TextWithFormat extends StatelessWidget {
  final String text;
  final bool bold;
  final bool italic;
  final double? fontSize;
  final Color? color;
  final int? maxLines;
  final double? letterSpacing;
  final bool selectable;

  const TextWithFormat(this.text,
      {Key? key,
      this.bold = false,
      this.italic = false,
      this.fontSize,
      this.color,
      this.maxLines,
      this.letterSpacing,
      this.selectable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return selectable
        ? SelectableText(
            text,
            style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                fontSize: fontSize,
                color: color,
                letterSpacing: letterSpacing),
            maxLines: maxLines,
          )
        : Text(
            text,
            style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                fontSize: fontSize,
                color: color,
                letterSpacing: letterSpacing,
                height: 1.5),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          );
  }
}
