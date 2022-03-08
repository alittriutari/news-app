import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/ui/article_webview.dart';
import 'package:news_app/ui/detail_page.dart';
import 'package:news_app/ui/home_page.dart';
import 'package:news_app/common/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 0),
        textTheme: myTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: secondaryColor,
                onPrimary: Colors.white,
                textStyle: const TextStyle(),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))),
        colorScheme: Theme.of(context).colorScheme.copyWith(primary: primaryColor, secondary: secondaryColor, onPrimary: Colors.white),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.grey,
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ArticleDetailPage.routeName: (context) => ArticleDetailPage(article: ModalRoute.of(context)?.settings.arguments as Article),
        ArticleWebView.routeName: (context) => ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [Locale('id', ''), Locale('en', '')],
    );
  }
}
