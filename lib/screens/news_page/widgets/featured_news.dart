import 'package:flutter/material.dart';
import 'package:test_task_era/screens/news_page/widgets/image_title.dart';
import '../../../repositories/repository.dart';

class TopNews extends StatefulWidget {
  const TopNews({super.key});

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  Future<List<Article>> newsList = MockNewsRepository().getFeaturedArticles();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: newsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                margin: const EdgeInsets.only(top: 20),
                height: 358,
                child: builderNews(snapshot));
          } else if (snapshot.hasError) {
            return Text("${snapshot.hasError}");
          }
          return const CircularProgressIndicator();
        });
  }

  ListView builderNews(AsyncSnapshot<List<Article>> data) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: data.data?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: ImageTitle(
              title: data.data?[index].title ?? "no Title",
              imageUrl: data.data?[index].imageUrl ??
                  "https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg"),
        );
      },
    );
  }
}
