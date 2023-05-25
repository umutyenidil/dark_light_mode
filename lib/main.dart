import 'package:dark_light_mode/cubits/theme_cubit/theme_cubit.dart';
import 'package:dark_light_mode/enums/theme_enums.dart';
import 'package:dark_light_mode/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              brightness: state.theme == AppTheme.light ? Brightness.light : Brightness.dark,
            ),
            themeMode: ThemeMode.dark,
            home: const HomePage(),
          );
        },
      ),
    ),
  );
}
