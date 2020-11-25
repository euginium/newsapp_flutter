import 'package:flutter/material.dart';
import 'package:my_news_app/helper/news.dart';
import 'package:my_news_app/models/article_model.dart';
import 'home.dart';
import 'articles_view.dart';

class CategoryNews extends StatefulWidget {
  final String categories;

  CategoryNews({this.categories});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoriesNews categoriesNews = CategoriesNews();
    await categoriesNews.getCategoryNews(widget.categories);
    articles = categoriesNews.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${widget.categories.toUpperCase()}',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    ///articles
                    Container(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, int index) {
                          return BlogTile(
                            title: articles[index].title,
                            description: articles[index].desc,
                            imgURL: articles[index].urlToImg,
                            blogUrl: articles[index].url,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String title, description, imgURL, blogUrl;

  BlogTile(
      {@required this.title,
      @required this.description,
      @required this.imgURL,
      @required this.blogUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              blogUrl: blogUrl,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                imgURL,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              description,
              style: TextStyle(color: Colors.grey.shade300),
            ),
            SizedBox(
              height: 5.0,
            ),
            Divider(
              indent: 15.0,
              endIndent: 15.0,
              thickness: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
// return Container(
// child: ListView.builder(
// physics: ClampingScrollPhysics(),
// shrinkWrap: true,
// itemCount: articles.length,
// itemBuilder: (context, int index) {
// return BlogTile(
// title: articles[index].title,
// description: articles[index].desc,
// imgURL: articles[index].urlToImg,
// blogUrl: articles[index].url,
// );
// },
// ),
// );
