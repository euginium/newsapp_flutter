import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_news_app/helper/data.dart';
import 'package:my_news_app/helper/news.dart';
import 'package:my_news_app/models/article_model.dart';
import 'package:my_news_app/models/category_model.dart';
import 'package:my_news_app/views/articles_view.dart';
import 'package:my_news_app/views/category_news.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<ArticleModel> articles = List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'My',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Text(
              'NEWS',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
                    ///categories
                    Container(
                      height: 70.0,
                      child: ListView.builder(
                        shrinkWrap: true, // this is a must!
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, int index) {
                          return CategoryTile(
                            categoryName: categories[index].categoryName,
                            imgURL: categories[index].imgURL,
                          );
                        },
                      ),
                    ),

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

class CategoryTile extends StatelessWidget {
  final String imgURL;
  final String categoryName;

  CategoryTile({this.categoryName, this.imgURL});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(
              categories: categoryName.toLowerCase(),
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 5.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                imageUrl: imgURL,
                width: 120.0,
                height: 60.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.black.withAlpha(105),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
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
