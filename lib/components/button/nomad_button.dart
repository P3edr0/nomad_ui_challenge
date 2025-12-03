import 'package:flutter/material.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/theme/custom_themes/colors.dart';

class NomadButton extends StatelessWidget {
  const NomadButton({
    super.key,
    required this.onTap,
    required this.child,
    this.withMargin = true,
    this.color = secondaryFocusColor,
  });
  final void Function() onTap;
  final Widget child;
  final Color color;
  final bool withMargin;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: withMargin
            ? EdgeInsets.symmetric(horizontal: Responsive.getSizeValue(24))
            : null,
        alignment: Alignment.center,
        height: Responsive.getSizeValue(50),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
