import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nomad/responsiveness/task_font_style.dart';
import 'package:nomad/theme/custom_themes/colors.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
    required this.controller,
    this.focus,
    required this.hint,
    this.maxLen = 2,
    this.keyboardType = TextInputType.text,
    this.formatters,
    this.action = TextInputAction.next,
  });
  final TextEditingController controller;
  final int maxLen;
  final FocusNode? focus;
  final String? hint;
  final TextInputType keyboardType;
  final TextInputAction action;
  final List<TextInputFormatter>? formatters;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: primaryColor,
      focusNode: focus,
      keyboardType: keyboardType,
      textInputAction: action,
      inputFormatters: formatters,
      style: NomadFontStyle.h4Bold.copyWith(color: primaryColor),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: NomadFontStyle.title.copyWith(color: infoColor),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: primaryColor),
        ),
      ),
    );
  }
}
