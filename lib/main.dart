import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:smartcue/views/Add_Script/teleprompt_screen/bloc/Playback/playback_bloc.dart';
import 'package:smartcue/views/views.dart';
import 'package:device_preview/device_preview.dart';
import 'route/app_routing.dart';
import 'services/hive_services.dart';
import 'views/Add_Script/Bottom_Sheet/bloc/generation_bloc.dart';
import 'views/Add_Script/teleprompt_screen/bloc/smart_Cue/smart_cue_bloc.dart';
import 'views/Add_Script/teleprompt_screen/cubit/scroll_state.dart';
import 'views/Home/Tab/Screens/Scripts_tab/bloc/script_tab_bloc.dart';
import 'views/Init_Home/Cubit/build_Screen_Cubit.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

GetIt getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await HiveService.initHive();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DevicePreview(
    enabled: true,
    builder: (context) => MyApp(),
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
          create: (context) => ScriptBloc()..add(LoadScriptsEvent()),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        )
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, Theme) {
          return ScreenUtilInit(
            designSize: const Size(432, 964.8),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp.router(
              routerConfig: appRouting.router,
              useInheritedMediaQuery: true,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              title: 'Smart Cue',
              debugShowCheckedModeBanner: false,
              theme: Theme,
            ),
          );
        },
      ),
    );
  }
}
