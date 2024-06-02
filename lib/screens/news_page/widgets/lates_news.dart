import 'package:flutter/material.dart';
import 'package:test_task_era/text_styles/my_styles.dart';
import '../../../repositories/repository.dart';

class LatesNews extends StatefulWidget {
  const LatesNews({super.key});

  @override
  State<LatesNews> createState() => _LatesNewsState();
}

class _LatesNewsState extends State<LatesNews> {
  Future<List<Article>> newsList = MockNewsRepository().getLatestArticles();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: newsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return builderLatesNews(snapshot);
          } else if (snapshot.hasError) {
            return Text("${snapshot.hasError}");
          }
          return const CircularProgressIndicator();
        });
  }

  ListView builderLatesNews(AsyncSnapshot<List<Article>> data) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.data?.length,
      itemBuilder: (context, index) {
        Article articl = data.data![index];
        DataCard datCard = DataCard(
            index: index,
            color: !articl.readed ? Colors.white : Colors.grey.shade400,
            article: articl);
        return GestureDetector(
          child: newCard(datCard),
          onTap: () {
            Navigator.of(context).pushNamed(
              '/newPage',
              arguments: data.data?[index],
            );
            setState(() {});
          },
        );
      },
    );
  }
}

Card newCard(DataCard data) {
  return Card(
    color: data.color,
    child: ListTile(
      title: Text(data.title, style: MyTextStyles.latesTitles()),
      leading: Card(
        child: Image.network(
          data.imgUrl,
          width: 90,
          height: 60,
          fit: BoxFit.fill,
        ),
      ),
      subtitle: Text(
        data.difference,
        style: MyTextStyles.subtitleStyle(),
      ),
    ),
  );
}

class DataCard {
  int index;
  Color color;
  Article article;

  late String title;
  late String imgUrl;
  late String difference;

  DataCard({required this.index, required this.color, required this.article}) {
    title = article.title;
    imgUrl = article.imageUrl;
    int dateTime = article.publicationDate.day;
    int toDay = DateTime.now().day.toInt();
    difference =
        (toDay - dateTime) == 0 ? "today" : "${(toDay - dateTime)} day ago";
  }
}
