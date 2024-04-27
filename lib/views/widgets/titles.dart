// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:library_app/utils/constants.dart';

class TextForNames extends StatelessWidget {
  String name;
  double size;

  TextForNames({super.key, required this.name, required this.size});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        name,
        style: TextStyle(color: AppColors.primaryColor, fontSize: size),
      ),
    );
  }
}
