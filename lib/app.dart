import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';

class MyApp extends StatelessWidget {
  final HomeRepository homeRepo;

  const MyApp({Key? key, required this.homeRepo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarThemeCubit = AppBarThemeCubit();
    final tabBarThemeCubit = TabBarThemeCubit();
    final bottomNavBarThemeCubit = BottomNavigationBarThemeCubit();
    final floatingActionButtonThemeCubit = FloatingActionButtonThemeCubit();
    final elevatedButtonThemeCubit = ElevatedButtonThemeCubit();

    final advancedThemeCubit = AdvancedThemeCubit(
      appBarThemeCubit: appBarThemeCubit,
      tabBarThemeCubit: tabBarThemeCubit,
      bottomNavigationBarThemeCubit: bottomNavBarThemeCubit,
      floatingActionButtonThemeCubit: floatingActionButtonThemeCubit,
      elevatedButtonThemeCubit: elevatedButtonThemeCubit,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit(homeRepo, advancedThemeCubit)),
        BlocProvider(create: (_) => BasicThemeCubit()),
        BlocProvider(create: (_) => advancedThemeCubit),
        BlocProvider(create: (_) => appBarThemeCubit),
        BlocProvider(create: (_) => tabBarThemeCubit),
        BlocProvider(create: (_) => bottomNavBarThemeCubit),
        BlocProvider(create: (_) => floatingActionButtonThemeCubit),
        BlocProvider(create: (_) => elevatedButtonThemeCubit),
      ],
      child: const MaterialApp(
        title: 'Flutter Theme',
        home: HomePage(),
      ),
    );
  }
}
