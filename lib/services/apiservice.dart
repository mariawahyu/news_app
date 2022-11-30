import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/article_model.dart';

class Service {
  final endPoint = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
      'sources': 'techcrunch',
      'apiKey': 'd859d1ba66944ef89b626bb08a14daeb'
    };

    final uri = Uri.https(endPoint, '/v2/everything', queryParameters);
    final response = await client.get(uri);

    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];
    List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
    return articles;
  }
}
