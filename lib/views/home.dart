import 'package:flutter/material.dart';
import 'package:news_app/components/list.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/services/apiservice.dart';
import 'package:news_app/views/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Service client = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //let's start with the Appbar
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "NEWS-APP",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const User()));
              },
              icon: const Icon(
                Icons.account_circle,
                color: Colors.white,
              ))
        ],
      ),
      body: FutureBuilder(
          future: client.getArticle(),
          builder:
              (BuildContext contex, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data!;
              return ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      customListTile(articles[index], contex));
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
