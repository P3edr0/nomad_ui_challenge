import 'package:flutter/material.dart';
import 'package:nomad/components/button/nomad_button.dart';
import 'package:nomad/components/textfields/textfield.dart';
import 'package:nomad/entities/transactios_entity.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/utils/formatters/date_formatter.dart';

class UpdateTransactionDialog {
  UpdateTransactionDialog();

  final TextEditingController valueController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  Future<void> show({
    required String title,
    required BuildContext context,
    required TransactionEntity? transaction,
    required Function(TransactionEntity) addTransaction,
    required Function(TransactionEntity) deleteTransaction,
  }) async {
    final bool isNew = transaction == null;
    if (!isNew) {
      dateController.text = NomadDateFormatter.brFormat(transaction.date);
      nameController.text = transaction.title;
      valueController.text = transaction.value;
    }
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: NomadFontStyle.titleBold,
        ),
        content: SizedBox(
          height: Responsive.getSizeValue(380),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome da transação',
                  style: NomadFontStyle.titleBold,
                  textAlign: TextAlign.center,
                ),
                TaskTextField(controller: nameController, hint: 'Binance ltda'),
                Text(
                  'Valor da transação',
                  style: NomadFontStyle.titleBold,
                  textAlign: TextAlign.center,
                ),
                TaskTextField(controller: valueController, hint: '1.155,50'),

                Text(
                  'Data da transação',
                  style: NomadFontStyle.titleBold,
                  textAlign: TextAlign.center,
                ),
                TaskTextField(
                  controller: dateController,
                  hint: '22/01/2025',
                  formatters: [NomadDateFormatter.maskFormatter],
                ),
                SizedBox(height: Responsive.getSizeValue(20)),

                NomadButton(
                  onTap: () {
                    final date = dateController.text;
                    final name = nameController.text;
                    final value = valueController.text;

                    DateTime? newDate = NomadDateFormatter.dateValidator(date);
                    newDate ??= DateTime.now();
                    final newTransaction = TransactionEntity(
                      date: newDate,
                      title: name,
                      value: value,
                    );
                    addTransaction(newTransaction);
                    Navigator.pop(context);
                  },
                  child: Text(
                    isNew ? "Salvar" : 'Atualizar',
                    textAlign: TextAlign.center,
                    style: NomadFontStyle.titleBold.copyWith(
                      color: secondaryColor,
                    ),
                  ),
                ),
                SizedBox(height: Responsive.getSizeValue(10)),
                if (transaction != null)
                  NomadButton(
                    onTap: () {
                      deleteTransaction(transaction);
                      Navigator.pop(context);
                    },
                    color: alertColor,
                    child: Text(
                      "Excluir",
                      textAlign: TextAlign.center,
                      style: NomadFontStyle.titleBold.copyWith(
                        color: secondaryColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
