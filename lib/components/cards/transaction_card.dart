import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/utils/formatters/date_formatter.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.value,
    required this.title,
    required this.date,
    this.isEditable = false,
    this.onTap,
  });

  final String value;
  final String title;
  final DateTime date;
  final bool isEditable;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEditable) {
          onTap?.call();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: Responsive.getSizeValue(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  NomadDateFormatter.transactionFormat(date),
                  style: NomadFontStyle.bodyLargeBold.copyWith(
                    color: infoColor,
                  ),
                ),
                Spacer(),
                if (isEditable)
                  Icon(FontAwesomeIcons.pen, size: Responsive.getSizeValue(12)),
              ],
            ),
            SizedBox(height: Responsive.getSizeValue(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(title, style: NomadFontStyle.bodyLargeBold),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'US\$', style: NomadFontStyle.body),
                      TextSpan(
                        text: ' $value',
                        style: NomadFontStyle.bodyLargeBold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text('Concluído', style: NomadFontStyle.small.copyWith()),
          ],
        ),
      ),
    );
  }
}
