// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomad/components/cards/home_card.dart';
import 'package:nomad/components/complements/divider.dart';
import 'package:nomad/pages/config_page.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/utils/assets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Responsive.getSizeValue(44),
                horizontal: Responsive.getSizeValue(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      FontAwesomeIcons.angleUp,
                      size: Responsive.getSizeValue(18),
                    ),
                  ),

                  Text(
                    'Perfil',
                    style: NomadFontStyle.titleBold,
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConfigPage()),
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
            Padding(
              padding: EdgeInsets.only(left: Responsive.getSizeValue(24)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: Responsive.getSizeValue(22),
                    backgroundImage: AssetImage(NomadAssets.whiteProfile),
                    backgroundColor: secondaryFocusColor,
                  ),
                  SizedBox(width: Responsive.getSizeValue(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Olá,', style: NomadFontStyle.title),
                      Text('Maikel De Sousa', style: NomadFontStyle.titleBold),
                      SizedBox(height: Responsive.getSizeValue(14)),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dados bancários',
                            style: NomadFontStyle.bodyBold.copyWith(
                              color: primaryFocusColor,
                            ),
                          ),
                          SizedBox(width: Responsive.getSizeValue(3)),

                          Padding(
                            padding: EdgeInsets.only(
                              top: Responsive.getSizeValue(7),
                            ),
                            child: Icon(
                              FontAwesomeIcons.angleRight,
                              size: Responsive.getSizeValue(10),
                              color: primaryFocusColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Responsive.getSizeValue(40)),
            HomeCard.secondary(
              title: 'Nomad Pass',
              image: NomadAssets.levelOne,
            ),
            NomadDivider(),
            HomeCard.secondary(
              title: 'Notificações',
              image: NomadAssets.notify,
            ),
            NomadDivider(),
            HomeCard.secondary(
              title: 'Alerta de dólar',
              image: NomadAssets.alertDollar,
            ),
            NomadDivider(),
            HomeCard.secondary(
              title: 'Viagem em grupo',
              image: NomadAssets.group,
              haveLabel: true,
            ),
            NomadDivider(),
            HomeCard.secondary(
              title: 'Conversão automática',
              image: NomadAssets.conversion,
            ),
            NomadDivider(),
            HomeCard.secondary(title: 'Shop', image: NomadAssets.shop),
            NomadDivider(),
            HomeCard.secondary(
              title: 'Convide seus amigos',
              image: NomadAssets.smallGift,
            ),
            NomadDivider(),
          ],
        ),
      ),
    );
  }
}
