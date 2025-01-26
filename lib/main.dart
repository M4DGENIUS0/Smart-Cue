import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smartcue/views/views.dart';

import 'views/Add_Script/Bottom_Sheet/bloc/generation_bloc.dart';
import 'views/Init_Home/Cubit/build_Screen_Cubit.dart';

GetIt getIt = GetIt.instance;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BuildScreenCubit()),
        BlocProvider(
          create: (context) => GenerationBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Smart Cue',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: InitHome(),
      ),
    );
  }
}
