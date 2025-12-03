// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad/components/button/nomad_button.dart';
import 'package:nomad/components/cards/transaction_card.dart';
import 'package:nomad/components/dialogs/update_transaction_dialog.dart';
import 'package:nomad/components/textfields/textfield.dart';
import 'package:nomad/pages/splash_page.dart';
import 'package:nomad/pages/store/config_controller.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  void initState() {
    super.initState();
    final controller = context.read<ConfigController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startControllers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Responsive.getSizeValue(44),
            horizontal: Responsive.getSizeValue(24),
          ),
          child: Consumer<ConfigController>(
            builder: (context, controller, _) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          FontAwesomeIcons.angleLeft,
                          size: Responsive.getSizeValue(18),
                        ),
                      ),

                      Text(
                        'Configurações',
                        style: NomadFontStyle.titleBold,
                        textAlign: TextAlign.center,
                      ),

                      Icon(
                        FontAwesomeIcons.pen,
                        size: Responsive.getSizeValue(18),
                      ),
                    ],
                  ),

                  SizedBox(height: Responsive.getSizeValue(40)),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: infoColor, width: 2),
                      color: infoColor.shade200,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saudação',
                          style: NomadFontStyle.titleBold,
                          textAlign: TextAlign.center,
                        ),

                        TaskTextField(
                          controller: controller.greetingController,
                          hint: 'Boa tarde,',
                        ),
                        Text(
                          'Nome do usuário',
                          style: NomadFontStyle.titleBold,
                          textAlign: TextAlign.center,
                        ),

                        TaskTextField(
                          controller: controller.nameController,
                          hint: 'Renan Mendes',
                        ),
                        Text(
                          'Valor na conta em dólar',
                          style: NomadFontStyle.titleBold,
                          textAlign: TextAlign.center,
                        ),
                        TaskTextField(
                          controller: controller.dollarBalanceController,
                          hint: '2.999,50',
                        ),
                        Text(
                          'Valor na conta em reais',
                          style: NomadFontStyle.titleBold,
                          textAlign: TextAlign.center,
                        ),
                        TaskTextField(
                          controller: controller.realBalanceController,
                          hint: '1.155,50',
                        ),
                        Text(
                          'Valor do dólar hoje',
                          style: NomadFontStyle.titleBold,
                          textAlign: TextAlign.center,
                        ),
                        TaskTextField(
                          controller: controller.dollarValueController,
                          hint: '5,95',
                        ),
                        SizedBox(height: Responsive.getSizeValue(20)),
                        Text(
                          'Transações',
                          style: NomadFontStyle.titleBold,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: Responsive.getSizeValue(20)),

                        ...controller.transactions.map(
                          (transaction) => TransactionCard(
                            title: transaction.title,
                            date: transaction.date,
                            value: transaction.value,
                            isEditable: true,
                            onTap: () {
                              controller.setTransactionOnEditing(transaction);
                              UpdateTransactionDialog().show(
                                title: 'Atualizar',
                                context: context,

                                addTransaction: controller.addTransaction,
                                deleteTransaction: controller.removeTransaction,
                                transaction: transaction,
                              );
                            },
                          ),
                        ),

                        NomadButton(
                          onTap: () {
                            controller.setTransactionOnEditing(null);

                            UpdateTransactionDialog().show(
                              title: 'Adicionar',
                              context: context,

                              addTransaction: controller.addTransaction,
                              deleteTransaction: controller.removeTransaction,
                              transaction: null,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.plus,
                                color: secondaryColor,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Adicionar Transac.',
                                style: NomadFontStyle.bodyLargeBold.copyWith(
                                  color: secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Responsive.getSizeValue(10)),
                        NomadButton(
                          color: primaryColor,
                          onTap: () {
                            log('Salvando mudanças');
                            controller.saveChanges();
                            WidgetsBinding.instance.addPostFrameCallback((
                              timeStamp,
                            ) async {
                              await Future.delayed(Duration(seconds: 1));
                              if (context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SplashPage(),
                                  ),
                                );
                              }
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.floppyDisk,
                                color: secondaryColor,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Salvar mudanças',
                                style: NomadFontStyle.bodyLargeBold.copyWith(
                                  color: secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
