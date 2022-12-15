import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:woori_cp/const/color.dart';
import 'package:woori_cp/layout/pageview_layout.dart';
import 'package:woori_cp/screen/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:woori_cp/screen/sign_screen.dart';

Future<void> main() async {
  //locale설정하기 위한 요소.(intl/date_symbol_data_local.dart) / Calendar에서 사용됨
  // await initializeDateFormatting();

  runApp(ProviderScope(
    child: MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          // ... app-specific localization delegate(s) here
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('ko', 'KR'),
        ],
        theme: ThemeData(
            fontFamily: 'Binggrae',
            appBarTheme: AppBarTheme(backgroundColor: POINT_COLOR)),
        home: PageViewScreen()
        // SignScreen(),
        ),
  ));
}
