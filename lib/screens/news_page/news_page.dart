import 'package:flutter/material.dart';
import 'package:test_task_era/screens/news_page/widgets/featured_news.dart';
import '../../../text_styles/text_styles.dart';
import 'widgets/lates_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(size: 30),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(
            "Notifications",
            style: MyTextStyles.barStyle(),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Mark all read",
                  style: MyTextStyles.barStyle(),
                ))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("Featured"),
            const TopNews(),
            text("Latest news"),
            Expanded(child: LatesNews()),
          ],
        ));
  }

  Padding text(String lable) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 38, bottom: 19),
      child: Text(
        lable,
        style: const TextStyle(
            fontSize: 25, fontFamily: "SF-Pro", fontWeight: FontWeight.w800),
      ),
    );
  }
}
