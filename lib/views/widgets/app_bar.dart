// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:library_app/utils/constants.dart';

PreferredSizeWidget DefaultAppBar(
    {required BuildContext context,
    required String title,
    required bool isFoundAction}) {
  return AppBar(
    actions: isFoundAction
        ? [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('AddNewBook');
                },
                icon: const Icon(Icons.add))
          ]
        : [],
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.white,
          fontSize: AppSize.s22,
          fontWeight: FontWeight.w500),
    ),
    backgroundColor: AppColors.secondColor,
  );
}
