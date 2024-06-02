import 'package:flutter/material.dart';

import '../../../text_styles/text_styles.dart';

class ImageTitle extends StatefulWidget {
  late String title;
  late String imageUrl;
  ImageTitle({super.key, required this.title, required this.imageUrl});

  @override
  State<ImageTitle> createState() =>
      _ImageTitleState(title: title, imageUrl: imageUrl);
}

class _ImageTitleState extends State<ImageTitle> {
  _ImageTitleState({required this.title, required this.imageUrl});
  String title;
  String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Image.network(
            imageUrl,
            width: 358,
            height: 300,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF000000)),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(left: 24, bottom: 14),
            width: 270,
            height: 70,
            child: Text(title, style: MyTextStyles.myTextStyle()),
          ),
        ],
      ),
    );
  }
}
