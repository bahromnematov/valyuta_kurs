import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valyuta_kurs/pages/block/main_bloc.dart';
import 'package:valyuta_kurs/pages/block/main_event.dart';
import 'package:valyuta_kurs/pages/splash_page.dart';

import 'core/di/di.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale("uz", "UZ"),
          Locale("uz", "UZC"),
          Locale("ru", "RU"),
          Locale("en", "EN"),
        ],
        startLocale: const Locale("uz", "UZ"),
        path: 'assets/tr',
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: "/",
      routes: {
        // "/": (context) {
        //   return SplashPage();
        // },
        "/": (context) {
          return BlocProvider(
            create: (_) => MainBloc(di.get())..add(MainGetLastEvent()),
            child: HomePage(),
          );
        },
      },
    );
  }
}
