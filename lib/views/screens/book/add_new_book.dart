// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/utils/constants.dart';
import 'package:library_app/views/screens/home/cubit/cubit.dart';
import 'package:library_app/views/screens/home/cubit/states.dart';
import 'package:library_app/views/widgets/app_bar.dart';

import '../../widgets/default_form_field.dart';

class AddNewBook extends StatefulWidget {
  static const String routeName = 'AddNewBook';
  static final _formKey = GlobalKey<FormState>();

  const AddNewBook({super.key});

  @override
  State<AddNewBook> createState() => _AddNewBookState();
}

class _AddNewBookState extends State<AddNewBook> {
  final TextEditingController bookNameController = TextEditingController();

  final TextEditingController writerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BooksCubit.get(context);
    return BlocConsumer<BooksCubit, BooksState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: DefaultAppBar(
                context: context, title: 'Add New Book', isFoundAction: false),
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(
                AppPadding.p20,
              ),
              child: Form(
                key: AddNewBook._formKey,
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DefaultFormFiled(
                        bookNameController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        label: "book Name",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      DefaultFormFiled(
                        writerNameController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        label: 'WriterName',
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColors.secondColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextButton(
                          onPressed: () async {
                            var snackBar = const SnackBar(
                              backgroundColor: Color(0xff77e0a5),
                              content: Center(
                                child: Text(
                                  ' The Book Add successfully',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);

                            if (AddNewBook._formKey.currentState!.validate()) {
                              cubit.insertToDataBaseByUser(
                                  writerName: writerNameController.text,
                                  bookName: bookNameController.text);
                            }
                            writerNameController.clear();
                            bookNameController.clear();
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                color: Colors.white, fontSize: AppSize.s16),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          );
        });
  }
}
