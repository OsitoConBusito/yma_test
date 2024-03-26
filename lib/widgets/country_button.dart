import 'package:flutter/material.dart';

class CountryButton extends StatelessWidget {
  const CountryButton({
    this.height,
    this.width,
    this.onTap,
    this.child,
    super.key,
  });

  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: child ?? const SizedBox(),
          ),
        ),
      ),
    );
  }
}
