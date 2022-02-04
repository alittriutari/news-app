import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/ui/article_webview.dart';

class DetailPage extends StatelessWidget {
  final Article article;
  const DetailPage({Key? key, required this.article}) : super(key: key);

  static const routeName = '/article_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(article.urlToImage),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.description),
                    const Divider(color: Colors.grey),
                    Text(
                      article.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    Text('Date: ${article.publishedAt}'),
                    const SizedBox(height: 10),
                    Text('Author: ${article.author}'),
                    const Divider(color: Colors.grey),
                    Text(
                      article.content,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text('Read more'),
                      onPressed: () {
                        Navigator.pushNamed(context, ArticleWebView.routeName, arguments: article.url);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
