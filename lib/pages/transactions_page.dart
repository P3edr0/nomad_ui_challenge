// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad/components/cards/transaction_type_card.dart';
import 'package:nomad/components/cards/transactions_component.dart';
import 'package:nomad/pages/config_page.dart';
import 'package:nomad/pages/store/config_controller.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/utils/assets.dart';
import 'package:provider/provider.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardWidth = (size.width - Responsive.getSizeValue(120)) / 4;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                color: primaryColor,

                padding: EdgeInsetsGeometry.all(Responsive.getSizeValue(24)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: Responsive.getSizeValue(20),
                      ),
                      child: Row(
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
                            'Conta internacional',
                            style: NomadFontStyle.titleBold,
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConfigPage(),
                                ),
                              );
                            },

                            child: Text(
                              'Ajuda',
                              style: NomadFontStyle.bodyBold.copyWith(
                                color: primaryFocusColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Responsive.getSizeValue(10)),
                    Image.asset(
                      NomadAssets.us,
                      height: Responsive.getSizeValue(36),
                    ),
                    SizedBox(height: Responsive.getSizeValue(16)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<ConfigController>(
                          builder: (context, controller, _) {
                            final config = controller.currentConfig!;
                            return Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'US\$ ',
                                    style: NomadFontStyle.body,
                                  ),
                                  TextSpan(
                                    text: config.dollarBalance,
                                    style: NomadFontStyle.h3,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Image.asset(
                          NomadAssets.eye,
                          height: Responsive.getSizeValue(36),
                        ),
                      ],
                    ),
                    SizedBox(height: Responsive.getSizeValue(30)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TransactionTypeCard(
                          cardWidth: cardWidth,
                          image: NomadAssets.blackMoney,
                          isSelected: true,
                          title: 'Adicionar',
                        ),
                        TransactionTypeCard(
                          cardWidth: cardWidth,
                          image: NomadAssets.arrowRight,
                          isSelected: false,
                          title: 'Transferir',
                        ),
                        TransactionTypeCard(
                          cardWidth: cardWidth,
                          image: NomadAssets.arrowLeft,
                          isSelected: false,
                          title: 'Retirar',
                        ),
                        TransactionTypeCard(
                          cardWidth: cardWidth,
                          image: NomadAssets.dots,
                          isSelected: false,
                          title: 'Mais opções',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(Responsive.getSizeValue(24)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transações',
                      style: NomadFontStyle.titleBold,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: Responsive.getSizeValue(14)),

                    Text(
                      'Suas movimentações financeiras aparecerão aqui.',
                      style: NomadFontStyle.body.copyWith(color: infoColor),
                    ),
                    SizedBox(height: Responsive.getSizeValue(14)),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Responsive.getSizeValue(10),
                            vertical: Responsive.getSizeValue(6),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: infoColor.shade300,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Data',
                                style: NomadFontStyle.bodyBold,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(width: Responsive.getSizeValue(4)),

                              Icon(
                                FontAwesomeIcons.angleDown,
                                size: Responsive.getSizeValue(12),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: Responsive.getSizeValue(12)),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: Responsive.getSizeValue(10),
                            vertical: Responsive.getSizeValue(6),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: infoColor.shade300,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Tipo',
                                style: NomadFontStyle.bodyBold,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(width: Responsive.getSizeValue(4)),

                              Icon(
                                FontAwesomeIcons.angleDown,
                                size: Responsive.getSizeValue(12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Responsive.getSizeValue(10)),

                    Consumer<ConfigController>(
                      builder: (context, controller, _) {
                        final config = controller.currentConfig!;
                        return TransactionsComponent(
                          transactions: config.transactions,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
