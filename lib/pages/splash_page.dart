// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nomad/pages/login_page.dart';
import 'package:nomad/pages/store/config_controller.dart';
import 'package:nomad/responsiveness/responsive.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/utils/assets.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final size = MediaQuery.of(context).size;
      final pixelRatio = MediaQuery.of(context).devicePixelRatio;
      Responsive.defineSize(size, pixelRatio: pixelRatio);

      final controller = Provider.of<ConfigController>(context, listen: false);
      await controller.getConfigs();
      await Future.delayed(Duration(seconds: 2));
      if (context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsetsGeometry.all(Responsive.getSizeValue(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(NomadAssets.splash, fit: BoxFit.fitWidth),
            Spacer(),

            Text(
              'A Nomad oferece abertura de conta corrente e acesso a produtos de investimentos nos EUA a não residentes. Nenhum dos serviços aqui disponíveis devem ser encarados como uma oferta pública de Valores Mobiliários. Visite nosso site para ler todos os disclaimers aplicáveis.',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: Responsive.getSizeValue(20)),
          ],
        ),
      ),
    );
  }
}
