import 'package:flutter/material.dart';
import 'package:inshorts_clone/newsCard.dart';
import 'package:inshorts_clone/provider/card_provider.dart';
import 'constants.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1.0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: const Key('Scaffold'),
      body: SafeArea(
        child: SizedBox.expand(
          child: GestureDetector(
            // onPanStart: (details) {
            //   final provider =
            //       Provider.of<NewsDataCard>(context, listen: false);
            //   provider.startPosition(details);
            // },
            onPanUpdate: (details) {
              final provider =
                  Provider.of<NewsDataCard>(context, listen: false);
              provider.updatePosition(details, context);
            },
            // onPanEnd: (details) {
            //   final provider =
            //       Provider.of<NewsDataCard>(context, listen: false);
            //   provider.endPosition();
            // },
            child: PageView(
                key: const Key('pageview'),
                controller: _controller,
                scrollDirection: Axis.vertical,
                children: [
                  NewsCard(
                      size: size,
                      headings: kHeading1,
                      info: kDetails1,
                      image: kImage1),
                  NewsCard(
                      size: size,
                      headings: kHeading2,
                      info: kDetails2,
                      image: kImage2),
                  NewsCard(
                      size: size,
                      headings: kHeading3,
                      info: kDetails3,
                      image: kImage3),
                  NewsCard(
                      size: size,
                      headings: kHeading4,
                      info: kDetails4,
                      image: kImage4),
                  NewsCard(
                      size: size,
                      headings: kHeading5,
                      info: kDetails5,
                      image: kImage5),
                  NewsCard(
                      size: size,
                      headings: kHeading6,
                      info: kDetails6,
                      image: kImage6),
                  NewsCard(
                      size: size,
                      headings: kHeading7,
                      info: kDetails7,
                      image: kImage7),
                  NewsCard(
                      size: size,
                      headings: kHeading8,
                      info: kDetails8,
                      image: kImage8),
                  NewsCard(
                      size: size,
                      headings: kHeading9,
                      info: kDetails9,
                      image: kImage1),
                  NewsCard(
                      size: size,
                      headings: kHeading10,
                      info: kDetails10,
                      image: kImage10)
                ]),
          ),
        ),
      ),
    );
  }
}
