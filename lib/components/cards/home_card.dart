import 'package:flutter/material.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.title,
    this.content,
    required this.image,
    this.haveLabel = false,
  }) : isSecondary = false;
  const HomeCard.secondary({
    super.key,
    required this.title,
    this.content,
    this.haveLabel = false,

    required this.image,
  }) : isSecondary = true;
  final String title;
  final Widget? content;
  final String image;
  final bool isSecondary;
  final bool haveLabel;
  @override
  Widget build(BuildContext context) {
    final textStyle = isSecondary
        ? NomadFontStyle.title
        : NomadFontStyle.bodyBold;
    return Padding(
      padding: EdgeInsets.all(Responsive.getSizeValue(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: textStyle, textAlign: TextAlign.start),

                    if (haveLabel) ...[
                      SizedBox(width: Responsive.getSizeValue(10)),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('Novo', style: NomadFontStyle.body),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: Responsive.getSizeValue(6)),

                if (content != null) content!,
              ],
            ),
          ),
          Image.asset(image),
        ],
      ),
    );
  }
}
