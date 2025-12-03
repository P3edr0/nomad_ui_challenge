import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:nomad/components/cards/transaction_card.dart';
import 'package:nomad/entities/transactios_entity.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/utils/assets.dart';

class TransactionsComponent extends StatelessWidget {
  const TransactionsComponent({super.key, required this.transactions});
  final List<TransactionEntity> transactions;
  @override
  Widget build(BuildContext context) {
    final hasTransactions = transactions.isNotEmpty;
    if (hasTransactions) {
      return Column(
        children: transactions
            .map(
              (transaction) => TransactionCard(
                title: transaction.title,
                date: transaction.date,
                value: transaction.value,
                isEditable: false,
                onTap: () {},
              ),
            )
            .toList(),
      );
    }
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(8),
        color: infoColor.shade300,
        dashPattern: [3, 3],
      ),
      child: Container(
        padding: EdgeInsets.all(Responsive.getSizeValue(16)),
        decoration: BoxDecoration(),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(NomadAssets.whiteMoney),
            SizedBox(height: Responsive.getSizeValue(12)),

            Text(
              'Adicione dinheiro à sua conta, vincule seu cartão de débibto virtual à wallet e comece a economizar em suas compras.',
              style: NomadFontStyle.body.copyWith(color: infoColor),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: Responsive.getSizeValue(40)),

            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: Responsive.getSizeValue(50),
                decoration: BoxDecoration(
                  color: secondaryFocusColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      NomadAssets.blackMoney,
                      height: Responsive.getSizeValue(36),
                    ),
                    Text(
                      'Adicionar dólares',
                      style: NomadFontStyle.bodyLargeBold.copyWith(
                        color: secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
