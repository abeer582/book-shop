import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/views/screens/book/book_details_widget.dart';
import 'package:library_app/views/screens/home/cubit/cubit.dart';
import 'package:library_app/views/screens/home/cubit/states.dart';
import 'package:library_app/views/widgets/app_bar.dart';

import '../../../utils/constants.dart';

class BookDetails extends StatefulWidget {
  final Map list;

  const BookDetails(this.list, {super.key});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BooksCubit, BooksState>(
      listener: (context, stats) {},
      builder: (context, stats) {
        return Scaffold(
            appBar: DefaultAppBar(
                context: context, title: 'Book Details', isFoundAction: false),
            backgroundColor: Colors.transparent,
            body: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppPadding.p20, horizontal: AppPadding.p15),
                color: Colors.white,
                child: BookDetailsWidget(widget.list, context)));
      },
    );
  }
}
