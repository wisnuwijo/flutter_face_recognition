import 'package:flutter/material.dart';

class FancyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Widget trailing;
  final Offset offset;
  final double blurRadius;
  final Color color;

  const FancyCard({
    Key key,
    @required this.child,
    this.trailing,
    this.padding,
    this.offset,
    this.blurRadius,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: color ?? Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300],
                blurRadius: blurRadius ?? 5,
                offset: offset ?? Offset(0, 5))
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[Expanded(child: child), trailing ?? Container()],
        ),
        padding: padding ?? EdgeInsets.all(10),
      ),
    );
  }
}