import 'package:flutter/material.dart';

import '../../repositories/repository.dart';
import '../../text_styles/text_styles.dart';

class NewPage extends StatefulWidget {
  const NewPage({super.key});

  @override
  State<NewPage> createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  Article? data;

  @override
  void didChangeDependencies() {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments == null || arguments is! Article) {
      return;
    }
    data = arguments;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBox) => [
          SliverAppBar(
            expandedHeight: 495,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 20),
              title: Text(
                data?.title ?? "no Title",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
              background: Image.network(
                  data?.imageUrl ??
                      "https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg",
                  fit: BoxFit.fill),
            ),
          ),
        ],
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                data?.description ?? "No discription",
                style: MyTextStyles.latesTitles(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
