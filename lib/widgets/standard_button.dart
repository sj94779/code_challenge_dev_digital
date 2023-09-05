import 'package:code_challenge_dev_digital/widgets/text_with_format.dart';
import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  final String? text;
  final Function onPressed;
  final Color? color;
  final Color? textColor;
  final IconData? icon;
  final double? elevation;
  final double? radius;
  final double? textSize;
  final bool? bold;

  const StandardButton(
      {Key? key,
      this.text = '',
      required this.onPressed,
      this.color,
      this.icon,
      this.elevation,
      this.radius,
      this.textColor = Colors.white,
      this.textSize,
      this.bold = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return icon == null
        ? FloatingActionButton.extended(
            onPressed: () {
              onPressed();
            },
            heroTag: null,
            elevation: elevation ?? 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8.0),
            ),
            label: TextWithFormat(
              text!,
              color: textColor,
              fontSize: textSize,
              bold: bold!,
            ),
            backgroundColor: color ?? Theme.of(context).secondaryHeaderColor,
          )
        : FloatingActionButton.extended(
            onPressed: () {
              onPressed();
            },
            heroTag: null,
            elevation: elevation ?? 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8.0),
            ),
            label: TextWithFormat(
              text!,
              bold: bold!,
              color: textColor,
              fontSize: textSize,
            ),
            icon: Icon(
              icon,
              color: textColor,
            ),
            backgroundColor: color ?? Theme.of(context).secondaryHeaderColor,
          );
  }
}
