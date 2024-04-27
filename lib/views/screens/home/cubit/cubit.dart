// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/views/screens/home/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  static BooksCubit get(context) => BlocProvider.of(context);
  var database;
  List<Map> books = [];

  void createDataBase() {
    openDatabase('Book.db', version: 1, onCreate: (database, version) {
      database
          .execute('CREATE TABLE library (id INTEGER PRIMARY KEY ,'
              ' bookName TEXT,  writerName TEXT )')
          .then((value) {})
          .catchError((error) {});
    }, onOpen: (database) {
      getFromDataBase(database);
    }).then((value) {
      database = value;
      emit(CreatedDateBaseSuccessState());
      //print('create');
    });
  }

// Get From Data Base Cubit //
  getFromDataBase(database) {
    emit(DataFromDateBaseLoadingState());
    database.rawQuery('SELECT * FROM library').then((value) {
      books = value;
      emit(GetDataBaseSuccessState());
    });
  }

  getOneBook(database, int id) {
    emit(DataFromDateBaseLoadingState());
    database.rawQuery('SELECT * FROM library').then((value) {
      books = value;
      //print(books);
      emit(GetDataBaseSuccessState());
    });
  }

//Insert To Data Base Cubit //
  insertToDataBase() async {
    database.transaction((txn) async {
      //1
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"The New LiBEARian " ," Alison Donald" )');
      //2
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"The Mysterious Messenger" , " Gilbert Ford")');
      //3
      txn.rawInsert('INSERT INTO library(bookName, writerName) VALUES('
          '"The Dragon in the Library " ," Louie Stowell")');
      //4
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"The Bad Seed Goes to the Library"," Jory John" )');
      //5
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"Sisterhood of Sleuths "," Jennifer Chambliss Bertman" )');
      //6
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"Schomburg "," Carole Boston Weatherford")');
      //7
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"Lola Gets a Cat "," Anna McQuinn")');
      //8
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"Dear Librarian "," Lydia M. Sigwarth" )');
      //9
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"The Secrets of Winterhouse "," Ben Guterson" )');
      //10
      txn.rawInsert('INSERT INTO library(bookName, writerName) VALUES('
          '"Froggy Goes to the Library ", "Jonathan London" )');
      //11
      txn.rawInsert('INSERT INTO library(bookName, writerName) VALUES('
          '"Isabella: Star of the Story "," Jennifer Fosberry" )');
      //12
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"Knight of the Cape" ," Terry Catasus Jennings" )');
      //13
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"Valentine Crow & Mr Death"," Jenni Spangler" )');
      //14
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"The Wizard in the Wood" ," Louie Stowell")');
      //15
      txn.rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
          '"The Winterhouse Mysteries","Ben Guterson")');
      //16
      txn
          .rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
              '"The Unbreakable Code" ,"Jennifer Chambliss Bertman")')
          .then((value) {
        emit(InsertDataBaseSuccessState());
        //print('inserted');
        emit(GetDataBaseSuccessState());
        getFromDataBase(database);
      }).catchError((error) {});
      return null;
    });
  }

  insertToDataBaseByUser(
      {required String bookName, required String writerName}) async {
    database.transaction((txn) async {
      //1
      txn
          .rawInsert('INSERT INTO library(bookName, writerName ) VALUES('
              '"$bookName", "$writerName")')
          .then((value) {
        emit(InsertDataBaseSuccessState());
        //  print('inserted');
        emit(GetDataBaseSuccessState());
        getFromDataBase(database);
      }).catchError((error) {});
      return null;
    });
  }

  deleteFromDataBase() {
    database.rawDelete('DELETE FROM library ').then((value) {
      getFromDataBase(database);
      // print("item deleted successfully ");
      emit(DeleteDataBaseSuccessState());
    }).catchError((error) {});
  }
}
