// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../widgets/titles.dart';

Widget BookDetailsWidget(Map model, BuildContext context) => Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.secondColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Center(
              child: TextForNames(
            name: '${model['id']}',
            size: AppSize.s26,
          )),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        TextForNames(
          name: 'Book Name ',
          size: AppSize.s24,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextForNames(
          name: '${model['bookName']}',
          size: AppSize.s24,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        TextForNames(
          name: 'by${model['writerName']}',
          size: AppSize.s22,
        ),
      ],
    );
