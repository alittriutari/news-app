import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/ui/article_webview.dart';
import 'package:news_app/ui/detail_page.dart';
import 'package:news_app/ui/home_page.dart';
import 'package:news_app/common/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(elevation: 0),
        textTheme: myTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: secondaryColor,
                onPrimary: Colors.white,
                textStyle: TextStyle(),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))))),
        colorScheme: Theme.of(context).colorScheme.copyWith(primary: primaryColor, secondary: secondaryColor, onPrimary: Colors.white),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: secondaryColor,
          unselectedItemColor: Colors.grey,
        ),
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => DetailPage(article: ModalRoute.of(context)?.settings.arguments as Article),
        ArticleWebView.routeName: (context) => ArticleWebView(
              url: ModalRoute.of(context)?.settings.arguments as String,
            ),
      },
    );
  }
}
