import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData.light();
  static final _darkTheme = ThemeData.dark();

  void toggleTheme(bool isOdd) {
    if (isOdd) {
      emit(_darkTheme);
    } else {
      emit(_lightTheme);
    }
  }
}

// Thme Cubit Multi Bloc Provide
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';

// class ThemeCubit extends Cubit<ThemeData> {
//   ThemeCubit() : super(_lightTheme);

//   static final _lightTheme = ThemeData(
//     brightness: Brightness.light,
//     primarySwatch: Colors.blue,
//   );

//   static final _darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     primarySwatch: Colors.blue,
//   );

//   void toggleTheme() {
//     emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
//   }
// }

