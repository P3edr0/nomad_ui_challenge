import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/utils/assets.dart';

class InfoDialog {
  const InfoDialog();

  static Future show(String title, String content, BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, textAlign: TextAlign.center),
        content: Text(content, textAlign: TextAlign.center),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: secondaryColor,
              foregroundColor: secondaryColor,
            ),
            child: const Text('Fechar'),
          ),
        ],
      ),
    );
  }

  static Future closeAuto(
    String title,
    String content,
    BuildContext context,
  ) async {
    return await showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        });
        return AlertDialog(
          title: Text(title, textAlign: TextAlign.center),
          content: Text(content, textAlign: TextAlign.center),
        );
      },
    );
  }

  static Future closeAutoFingerprint(BuildContext context) async {
    return showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (context, _, __) {
        bool fingerprintHasChecked = false;
        String image = NomadAssets.fingerprint;
        return StatefulBuilder(
          builder: (context, setState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(Duration(seconds: 1), () async {
                if (!context.mounted) return;
                setState(() {
                  image = NomadAssets.fingerprintOk;

                  fingerprintHasChecked = true;
                });
                await Future.delayed(Duration(seconds: 1), () {
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                });
              });
            });
            return Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: secondaryFocusColor.withValues(alpha: 0.15),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  child: SizedBox(
                    height: Responsive.getSizeValue(
                      fingerprintHasChecked ? 290 : 360,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryColor,
                            radius: 28,

                            child: CircleAvatar(
                              backgroundImage: AssetImage(NomadAssets.logo),

                              radius: 18,
                            ),
                          ),
                          SizedBox(height: Responsive.getSizeValue(10)),

                          Text(
                            'Nomad',
                            style: NomadFontStyle.titleBold,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: Responsive.getSizeValue(10)),
                          Text(
                            'Biometrics',
                            style: NomadFontStyle.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: Responsive.getSizeValue(10)),
                          Text(
                            'Posicione seu dedo sobre o sensor para continuar.',
                            style: NomadFontStyle.body,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: Responsive.getSizeValue(10)),
                          AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child: Image.asset(image, key: ValueKey(image)),
                          ),
                          if (!fingerprintHasChecked) ...[
                            SizedBox(height: Responsive.getSizeValue(10)),

                            Text(
                              'Toque no sensor de impressão digital.',
                              style: NomadFontStyle.body.copyWith(
                                color: infoColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: Responsive.getSizeValue(14)),

                            Text(
                              'Cancelar',
                              style: NomadFontStyle.bodyLarge.copyWith(
                                color: primaryFocusColor,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      transitionBuilder: (_, anim, __, child) {
        final offsetAnimation = Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic));

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
