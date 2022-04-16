import 'package:flutter/material.dart';
import 'package:inshorts_clone/main.dart';
import 'constants.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/images/breaking_news.jpg",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
