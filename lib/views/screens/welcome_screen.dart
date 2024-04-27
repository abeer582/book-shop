import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/utils/constants.dart';
import 'package:library_app/views/screens/home/cubit/cubit.dart';
import 'package:library_app/views/screens/home/cubit/states.dart';
import 'package:library_app/views/screens/home/home_screen.dart';
import 'package:library_app/views/widgets/titles.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({super.key});

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksCubit, BooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              TextForNames(size: AppSize.s24, name: 'Welcome Screen'),
              Container(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p20),
                height: MediaQuery.of(context).size.height * 0.44,
                width: MediaQuery.of(context).size.width * 0.80,
                child: Image.asset(
                  'Assets/images/b.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: AppColors.secondColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextButton(
                  onPressed: () {
                    if (BooksCubit.get(context).books.isEmpty) {
                      BooksCubit.get(context).insertToDataBase();

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const HomeScreen()));
                    } else {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const HomeScreen()));
                    }
                  },
                  child: const Text(
                    'start',
                    style:
                        TextStyle(color: Colors.white, fontSize: AppSize.s16),
                  ),
                ),
              ),
            ],
          ),

          //  bottomSheet: BottomSheet(builder: (BuildContext context) {  }, onClosing: () {  },),
        );
      },
    );
  }
}
