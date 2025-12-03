import 'package:flutter/material.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';

class TransactionTypeCard extends StatelessWidget {
  const TransactionTypeCard({
    super.key,
    required this.cardWidth,
    required this.image,
    required this.isSelected,
    required this.title,
  });

  final double cardWidth;
  final String image;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isDots = title == 'Mais opções';
    return Column(
      children: [
        Container(
          height: Responsive.getSizeValue(
            cardWidth - Responsive.getSizeValue(20),
          ),
          width: Responsive.getSizeValue(cardWidth),
          padding: EdgeInsets.all(
            isDots
                ? 22
                : isSelected
                ? 3
                : 14,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: secondaryFocusColor, width: 1),
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? secondaryFocusColor : transparent,
          ),
          child: Image.asset(image, height: Responsive.getSizeValue(5)),
        ),
        SizedBox(height: Responsive.getSizeValue(5)),

        Text(title, style: NomadFontStyle.body.copyWith()),
      ],
    );
  }
}
