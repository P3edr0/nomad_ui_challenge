// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nomad/components/button/nomad_button.dart';
import 'package:nomad/components/cards/home_card.dart';
import 'package:nomad/components/complements/divider.dart';
import 'package:nomad/pages/profile_page.dart';
import 'package:nomad/pages/store/config_controller.dart';
import 'package:nomad/pages/transactions_page.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/utils/assets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1200), () {
      setState(() {
        loading = false;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 1600), () {
        setState(() => _visible = true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: secondaryColor,
      body: loading
          ? Container(
              color: primaryColor,
              width: size.width,

              child: Image.asset(NomadAssets.loading, fit: BoxFit.fitWidth),
            )
          : Stack(
              children: [
                SizedBox(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: primaryColor,
                          height: size.height / 2,

                          padding: EdgeInsetsGeometry.all(
                            Responsive.getSizeValue(24),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: Responsive.getSizeValue(20),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      NomadAssets.logo,
                                      height: Responsive.getSizeValue(40),
                                    ),
                                    SizedBox(
                                      width: Responsive.getSizeValue(16),
                                    ),

                                    Consumer<ConfigController>(
                                      builder: (context, controller, _) {
                                        final config =
                                            controller.currentConfig!;
                                        return Column(
                                          children: [
                                            Image.asset(
                                              NomadAssets.graph,
                                              height: Responsive.getSizeValue(
                                                16,
                                              ),
                                            ),
                                            Text(
                                              'R\$ ${config.dollarValue}',
                                              style: NomadFontStyle.bodyBold,
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    Spacer(),
                                    Image.asset(
                                      NomadAssets.eye,
                                      height: Responsive.getSizeValue(36),
                                    ),
                                    SizedBox(width: Responsive.getSizeValue(0)),

                                    Image.asset(
                                      NomadAssets.gift,
                                      height: Responsive.getSizeValue(36),
                                    ),
                                    SizedBox(width: Responsive.getSizeValue(0)),

                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ProfilePage(),
                                          ),
                                        );
                                      },
                                      child: Image.asset(
                                        NomadAssets.profile,
                                        height: Responsive.getSizeValue(36),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentGeometry.bottomLeft,
                                child: AnimatedOpacity(
                                  duration: Duration(milliseconds: 600),
                                  opacity: _visible ? 1.0 : 0.0,
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.easeOutCubic,
                                    // ⬇️ Transformação de posição mais suave
                                    transform: Matrix4.translationValues(
                                      _visible
                                          ? 0
                                          : 300, // Começa 300px à direita
                                      0,
                                      0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Cashback para você e seu amigo',
                                          style: NomadFontStyle.bodyBold,
                                        ),
                                        Text(
                                          'Convide e ganhe até US\$ 20',
                                          style: NomadFontStyle.body,
                                        ),
                                        Image.asset(
                                          NomadAssets.arrow,
                                          height: Responsive.getSizeValue(36),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TransactionsPage(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Conta',
                                          style: NomadFontStyle.bodyBold,
                                          textAlign: TextAlign.center,
                                        ),
                                        Consumer<ConfigController>(
                                          builder: (context, controller, _) {
                                            final config =
                                                controller.currentConfig!;
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
                                      ],
                                    ),
                                    Image.asset(NomadAssets.money),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            HomeCard(
                              title: 'Investimentos',
                              content: Text(
                                'Invista em renda fixa e em ações das maiores empresas do mundo.',

                                style: NomadFontStyle.body,
                                textAlign: TextAlign.start,
                              ),
                              image: NomadAssets.invest,
                            ),

                            NomadDivider(),

                            Consumer<ConfigController>(
                              builder: (context, controller, _) {
                                final config = controller.currentConfig!;
                                return HomeCard(
                                  title: 'Saldo em real',
                                  content: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'R\$ ',
                                          style: NomadFontStyle.body,
                                        ),
                                        TextSpan(
                                          text: config.realBalance,
                                          style: NomadFontStyle.h4,
                                        ),
                                      ],
                                    ),
                                  ),

                                  image: NomadAssets.reals,
                                );
                              },
                            ),

                            NomadDivider(),
                            HomeCard(
                              title: 'Cartões',
                              image: NomadAssets.cards,
                            ),

                            NomadDivider(),
                            HomeCard(title: 'Shop', image: NomadAssets.shop),

                            NomadDivider(),
                            SizedBox(height: Responsive.getSizeValue(80)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: Responsive.getSizeValue(20),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 600),
                    opacity: _visible ? 1.0 : 0.0,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeOutCubic,
                      // ⬇️ Transformação de posição mais suave
                      transform: Matrix4.translationValues(
                        0, // Começa 300px à direita
                        _visible ? 0 : 40,
                        0,
                      ),

                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.getSizeValue(24),
                        ),
                        width: size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: NomadButton(
                                withMargin: false,
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      NomadAssets.blackMoney,
                                      height: Responsive.getSizeValue(36),
                                    ),
                                    SizedBox(width: Responsive.getSizeValue(5)),

                                    Text(
                                      'Adicionar\ndinheiro',
                                      style: NomadFontStyle.bodyBold.copyWith(
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: Responsive.getSizeValue(16)),
                            Expanded(
                              child: NomadButton(
                                withMargin: false,

                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      NomadAssets.share,
                                      height: Responsive.getSizeValue(36),
                                    ),
                                    SizedBox(width: Responsive.getSizeValue(5)),
                                    Text(
                                      'Transferir\ndinheiro',
                                      style: NomadFontStyle.bodyBold.copyWith(
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
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
