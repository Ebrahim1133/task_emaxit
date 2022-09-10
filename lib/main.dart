import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_emaxit/utils/colors.dart';
import 'package:task_emaxit/view/screens/cubit/create_rec_cubit.dart';
import 'package:task_emaxit/view/screens/cubit/rec_list_cubit.dart';
import 'package:task_emaxit/view/screens/rec_list_screen.dart';

import 'network/dio_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => RecListCubit()
              ..getData()
              ..postData()),
        BlocProvider(
            create: (BuildContext context) => CreateRecCubit()..getData()),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("ar", "AE"),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        title: 'Task EmaxIT',
        home: RecListScreen(),
      ),
    );
  }
}
