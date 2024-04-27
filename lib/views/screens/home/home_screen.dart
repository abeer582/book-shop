// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/utils/constants.dart';
import 'package:library_app/views/screens/book/book_details.dart';
import 'package:library_app/views/screens/home/cubit/cubit.dart';
import 'package:library_app/views/screens/home/cubit/states.dart';
import 'package:library_app/views/widgets/app_bar.dart';
import '../../widgets/default_form_field.dart';
import 'item_for_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> library = [];

  @override
  initState() {

    library = BooksCubit.get(context).books;
    super.initState();
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BooksCubit.get(context);

    return BlocConsumer<BooksCubit, BooksState>(
      listener: (context, stats) {},
      builder: (context, stats) {
        return Scaffold(

          appBar: DefaultAppBar(context: context,title:  'Book Store',isFoundAction: true
          ),          backgroundColor: Colors.white,

          body: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppPadding.p20, horizontal: AppPadding.p15),
            color: Colors.transparent,
            child: SingleChildScrollView(
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                DefaultFormFiled(
                  searchController,

                  onChanged: (value) {
                    _runFilter(value);
                    const InputDecoration(
                        labelText: 'Search', suffixIcon: Icon(Icons.search));
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => Column(
                              children: [
                                const Divider(
                                  color: AppColors.secondColor,
                                  thickness: 1,
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03)
                              ],
                            ),
                        itemCount: searchController.text.isEmpty
                            ? cubit.books.length
                            : library.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) => SizedBox(
                              height: MediaQuery.of(context).size.height * 0.18,
                              child: ItemForList(
                                searchController.text.isEmpty
                                    ? cubit.books[index]
                                    : library[index],
                                context,
                                () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => BookDetails(
                                            searchController.text.isEmpty
                                                ? cubit.books[index]
                                                : library[index],
                                          )));
                                },
                              ),
                            ))
                    //  Text('no data')

                    )
              ]),
            ),
          ),
        );
      },
    );
  }

  void _runFilter(String enteredKeyword) {
    List<Map> results = [];
    // if the search field is empty or only contains white-space, we'll display all users
    results = BooksCubit.get(context)
        .books
        .where((book) => book["bookName"]
            .toLowerCase()
            .contains(enteredKeyword.toLowerCase()))
        .toList();
    setState(() {
      library = results;
    });

    // we use the toLowerCase() method to make it case-insensitive
  }
}
