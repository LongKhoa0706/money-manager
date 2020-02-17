import 'package:flutter/material.dart';

class CircleDot extends StatelessWidget {
  /// Create a CircleDot widget.
  const CircleDot({
    Key key,
    @required this.enable,
    this.borderWidth = 1,
    this.disableBackground = Colors.transparent,
    this.disableBorderColor = Colors.grey,
    this.enableBackground = Colors.blue,
    this.enableBorderColor = Colors.blue,
    this.size = 24,
    this.margin,
  }): assert(enable != null),
      super(key: key);

  final bool enable;
  final double borderWidth;
  final double size;
  final Color disableBackground;
  final Color disableBorderColor;
  final Color enableBackground;
  final Color enableBorderColor;
  final EdgeInsets margin;

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: enable ? enableBackground : disableBackground,
        border: Border.all(
          color: enable ? enableBorderColor : disableBorderColor,
          width: borderWidth,
        ),
        shape: BoxShape.circle,
      ),
      height: size,
      width: size,
    );
  }
}
