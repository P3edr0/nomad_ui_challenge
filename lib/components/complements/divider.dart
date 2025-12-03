import 'package:flutter/material.dart';
import 'package:nomad/theme/custom_themes/colors.dart';

class NomadDivider extends StatelessWidget {
  const NomadDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: infoColor.shade200, height: 1);
  }
}
