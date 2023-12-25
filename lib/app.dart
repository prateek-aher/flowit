import 'package:flowit/bloc/navbar/navbar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xffD83790),
              brightness: Brightness.dark,
              background: const Color(0xff191919)),
          useMaterial3: true,
        ),
        home: BlocProvider<NavbarBloc>(
          create: (context) => NavbarBloc(),
          child: const HomePage(),
        ),
      ),
    );
  }
}
