import 'package:flutter/material.dart';
import 'package:nomad/components/button/nomad_button.dart';
import 'package:nomad/components/dialogs/info_dialog.dart';
import 'package:nomad/pages/home_page.dart';
import 'package:nomad/pages/store/config_controller.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/utils/assets.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Responsive.getSizeValue(20)),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Responsive.getSizeValue(24),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    NomadAssets.logo,
                    height: Responsive.getSizeValue(30),
                  ),
                  Icon(Icons.close, size: Responsive.getSizeValue(24)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.getSizeValue(24),
                ),
                child: Consumer<ConfigController>(
                  builder: (context, controller, _) {
                    final config = controller.currentConfig!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Spacer(),
                        Text(config.greeting, style: NomadFontStyle.h4Large),
                        Text(config.name, style: NomadFontStyle.h3Bold),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: Responsive.getSizeValue(20)),
            Container(
              color: secondaryColor,
              height: Responsive.getSizeValue(200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NomadButton(
                    onTap: () async {
                      await InfoDialog.closeAutoFingerprint(context);
                      setState(() {
                        loading = true;
                      });
                      await Future.delayed(Duration(seconds: 2));
                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      }
                    },
                    child: loading
                        ? SizedBox.square(
                            dimension: Responsive.getSizeValue(20),
                            child: CircularProgressIndicator(
                              color: secondaryColor,
                              strokeWidth: 1.5,
                            ),
                          )
                        : Text(
                            'Entrar com biometria',
                            style: NomadFontStyle.bodyLargeBold.copyWith(
                              color: secondaryColor,
                            ),
                          ),
                  ),
                  SizedBox(height: Responsive.getSizeValue(30)),

                  Text(
                    'Entrar com senha',
                    style: NomadFontStyle.bodyLargeBold.copyWith(
                      color: primaryFocusColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
