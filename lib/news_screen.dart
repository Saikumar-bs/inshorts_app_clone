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
          SafeArea(
            child: Align(
              alignment: Alignment(-0.90, -0.25),
              child: Container(
                height: 25.0,
                width: 80.0,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'inshorts',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kTextColor.withOpacity(0.4),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
