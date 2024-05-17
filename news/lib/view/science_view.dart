import 'package:flutter/material.dart';
import 'package:news/view/article_details_view.dart';
import '../repository/news_api.dart';
import '../view_model/article_view_model.dart';
import '../view_model/articles_view_model.dart';


class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  State<ScienceScreen> createState() => _ScienceScreenState();
}

class _ScienceScreenState extends State<ScienceScreen> {
  var articlesListViewModel = ArticlesListViewModel(classRepository: NewsApi());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleViewModel>>(
      future: articlesListViewModel.fetchNewsScience(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          var news = snapshot.data;
          return Scaffold(

            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: news == null ? 0 : news.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleDetailsScreen(
                                title: news[index].title,
                                author: news[index].author,
                                publishedAt: news[index].publishedAt,
                                description: news[index].description,
                                content: news[index].content,
                                urlToImage: news[index].urlToImage,
                                url: news[index].url,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(35),
                                  ),
                                  child: Image.network(
                                    news[index].urlToImage,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    news[index].title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
