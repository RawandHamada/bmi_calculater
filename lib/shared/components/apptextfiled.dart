import 'package:bmi_calculater/shared/components/size_config.dart';
import 'package:flutter/material.dart';

class AppTextFiled extends StatelessWidget {
  final TextInputType textInputType;
  final String labelText;
  final int? maxLength;
  final TextEditingController controller;
  final bool obscureText;
  final bool readOnly;
  final bool showCursor;
  final bool isClickabel;
  Function? functionSuffixPressed;
  final IconData? suffix;
  final IconData? prefix;
  Function()? onTap;
  AppTextFiled({
    this.textInputType = TextInputType.text,
    required this.labelText,
    this.maxLength,
    this.suffix = null,
    this.prefix = null,
    this.obscureText = false,
    this.readOnly = false,
    this.showCursor = true,
    this.isClickabel = true,
    required this.controller,
    this.onTap,
    this.functionSuffixPressed
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().designWidth(4.14).designHeight(8.96).init(context);
    return TextFormField(
        controller: controller,
        maxLength: maxLength,
        showCursor: showCursor,
        textDirection: TextDirection.rtl,
        cursorColor: Color(0xff0064E5),
        autocorrect: true,
        enableSuggestions: true,
        autofocus: false,
        enabled: isClickabel,
        readOnly: readOnly,
        keyboardType: textInputType,
        obscureText: obscureText,
        onTap: onTap,

        decoration: InputDecoration(
            labelText: labelText,
             labelStyle: TextStyle(color: Color(0xff8E8E93),      fontFamily: 'Almarai',),
            counterText: '',
            enabledBorder: borderEnable,
            focusedBorder: borderFocused,
        suffixIcon: suffix != null ? IconButton(onPressed: () {
    functionSuffixPressed!();
    }, icon: Icon(suffix, color: Color(0xff0064E5),)) : null,
    prefixIcon: Icon(prefix, color: Color(0xff0064E5),),
    ),
    );
  }
 OutlineInputBorder get borderEnable =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig().scaleWidth(10),),
        borderSide: BorderSide(
          color: Color(0xff0064E5),
          width: SizeConfig().scaleWidth(1),
        ),
      );
  OutlineInputBorder get borderFocused =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeConfig().scaleWidth(10),),
        borderSide: BorderSide(
          color: Color(0xff0064E5),
          width: SizeConfig().scaleWidth(1),
        ),
      );
}
