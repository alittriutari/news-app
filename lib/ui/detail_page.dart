import 'package:flutter/material.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/ui/article_webview.dart';

class ArticleDetailPage extends StatelessWidget {
  final Article article;
  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  static const routeName = '/article_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              article.urlToImage == null
                  ? const SizedBox(
                      height: 200,
                      child: Icon(Icons.error),
                    )
                  : Hero(
                      tag: article.urlToImage!,
                      child: Image.network(article.urlToImage!),
                    ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.description!,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const Divider(color: Colors.grey),
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const Divider(color: Colors.grey),
                    Text(
                      'Date: ${article.publishedAt}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Author: ${article.author}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const Divider(color: Colors.grey),
                    Text(
                      article.content!,
                      style: Theme.of(context).textTheme.bodyText1,
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
