// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class DefaultFormFiled extends StatelessWidget {
  TextInputType? type;
  TextEditingController? controller;

  ValueChanged<String>? onSubmit;
  ValueChanged? onChanged;
  GestureTapCallback? onTap;
  String? Function(String?)? validate;
  String? label;
  Widget? suffixIcon;
  double? radius = 0;
  bool? obscureText;
  bool isPassword = false;

  DefaultFormFiled(
    this.controller, {
    this.suffixIcon,
    this.validate,
    this.label,
    this.obscureText,
    super.key,
    this.type,
    this.onSubmit,
    this.onChanged,
    this.onTap,
    this.radius,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: const TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w400,
            fontSize: AppSize.s20),
        obscureText: isPassword,
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        validator: validate,
        onTap: onTap,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(),
          ),

          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: label,
          labelStyle: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: AppSize.s14),

          //border: InputBorder.none,
          contentPadding: const EdgeInsets.all(AppPadding.p8),
          suffixIcon:
              Padding(padding: const EdgeInsets.all(0.0), child: suffixIcon),
        ));
  }
}
