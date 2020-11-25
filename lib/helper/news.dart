import 'dart:convert';
import 'package:my_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

const _apiKey = "3626e9e96364a753972a3b234739867f";

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://gnews.io/api/v4/top-headlines?topic=business&token=${_apiKey}&lang=en";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    for (var element in jsonData["articles"]) {
      if (element["image"] != null) {
        ArticleModel articleModel = ArticleModel(
          title: element["title"],
          urlToImg: element["image"],
          url: element["url"],
          desc: element["description"],
          content: element["content"],
        );
        news.add(articleModel);
      }
    }
  }
}
// if (jsonData['status'] == "ok") {
//   jsonData["article"].forEach((element) {
//     if (element["urlToImage"] != null &&
//         element["description"] != null &&
//         element["author"] != null) {
//       ArticleModel articleModel = ArticleModel(
//         title: element["title"],
//         url: element["url"],
//         urlToImg: element["image"],
//         // author: element["author"],
//         content: element["content"],
//         desc: element["description"],
//       );
//       print(articleModel.title);
//       news.add(articleModel);
//     }
//   });
// }

class CategoriesNews {
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        "https://gnews.io/api/v4/top-headlines?topic=${category}&token=${_apiKey}&lang=en";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    for (var element in jsonData["articles"]) {
      ArticleModel articleModel = ArticleModel(
        title: element["title"],
        urlToImg: element["image"],
        url: element["url"],
        desc: element["description"],
        content: element["content"],
      );
      news.add(articleModel);
    }
  }
}
