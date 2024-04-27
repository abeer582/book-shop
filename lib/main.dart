import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/views/screens/home/cubit/cubit.dart';

import 'views/screens/book/add_new_book.dart';
import 'views/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                      create: (context) => BooksCubit()..createDataBase()),
                ],
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: const WelcomScreen(),
                  routes: {AddNewBook.routeName: (context) => const AddNewBook()},
                )));
  }
}
