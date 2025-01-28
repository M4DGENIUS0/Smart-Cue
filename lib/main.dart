import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:smartcue/views/Add_Script/teleprompt_screen/bloc/Playback/playback_bloc.dart';
import 'package:smartcue/views/views.dart';

import 'route/app_routing.dart';
import 'services/hive_services.dart';
import 'views/Add_Script/Bottom_Sheet/bloc/generation_bloc.dart';
import 'views/Add_Script/teleprompt_screen/bloc/smart_Cue/smart_cue_bloc.dart';
import 'views/Add_Script/teleprompt_screen/cubit/scroll_state.dart';
import 'views/Home/Tab/Screens/Scripts_tab/bloc/script_tab_bloc.dart';
import 'views/Init_Home/Cubit/build_Screen_Cubit.dart';

GetIt getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // debugPaintSizeEnabled = true;
  // Initialize Hive
  await HiveService.initHive();
  runApp(
    MyApp(),
  );
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
        ),
        BlocProvider(
          create: (context) => SmartCueBloc(),
        ),
        BlocProvider(
          create: (context) => PlaybackBloc(),
        ),
        BlocProvider(
          create: (context) => ScrollCubit(),
        ),
        BlocProvider(
          create: (context) => ScriptBloc(),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, Theme) {
          return MaterialApp.router(
            routerConfig: appRouting.router,
            title: 'Smart Cue',
            debugShowCheckedModeBanner: false,
            theme: Theme,
            // home: SmartCueScreen(),
          );
        },
      ),
    );
  }
}
