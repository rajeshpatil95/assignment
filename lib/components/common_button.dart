import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final EdgeInsetsGeometry textPadding;
  final ShapeBorder shape;
  final Widget child;
  final Color color;
  final TextStyle textStyle;
  final TextAlign textAlign;
  final BorderSide side;
  final EdgeInsets padding;
  final MaterialTapTargetSize materialTapTargetSize;
  final focusElevation;
  CommonButton(
      {Key key,
      this.child,
      this.padding,
      this.textPadding,
      this.materialTapTargetSize = MaterialTapTargetSize.padded,
      this.color,
      this.textStyle,
      this.textAlign,
      this.side,
      @required this.onPressed,
      this.text,
      this.height,
      this.width,
      this.focusElevation = 0.0,
      this.shape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)))})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      padding: padding,
      // height: height ?? 40,
      // decoration: BoxDecoration(border: border, borderRadius: BorderRadius.circular(5)),
      child: MaterialButton(
        elevation: 0.0,
        materialTapTargetSize: materialTapTargetSize,
        minWidth: width,
        padding: const EdgeInsets.all(0),
        focusElevation: focusElevation,
        height: height ?? 40,
        disabledColor: Colors.grey,
        color: color ?? Theme.of(context).buttonColor,
        // elevation: 1,
        autofocus: true,
        shape: side == null
            ? shape
            : RoundedRectangleBorder(
                side: side, borderRadius: BorderRadius.all(Radius.circular(5))),
        onPressed: onPressed,
        child: Padding(
          padding: textPadding ?? const EdgeInsets.all(0),
          child: FittedBox(
            child: child ??
                Text(
                  text,
                  textAlign: textAlign ?? TextAlign.start,
                  style: textStyle ??
                      TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                ),
          ),
        ),
      ),
    );
  }
}
