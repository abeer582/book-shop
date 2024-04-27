// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:library_app/utils/constants.dart';

import '../../widgets/titles.dart';

//required this.nameOfBook,required this.nameForWriter, required this.numberForBook});
@override
Widget ItemForList(Map model, BuildContext context, VoidCallback function) =>
    InkWell(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.secondColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Center(
                      child: TextForNames(
                    name: '${model['id']}',
                    size: AppSize.s22,
                  )),
                ),
              ],
            ),
            Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextForNames(
                  name: '${model['bookName']}',
                  size: AppSize.s22,
                ),
                TextForNames(
                  name: 'by${model['writerName']}',
                  size: AppSize.s22,
                ),
              ],
            ),
          ],
        ),
        onTap: () {
          function();
        });
