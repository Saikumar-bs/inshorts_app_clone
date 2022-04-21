import 'package:flutter/material.dart';
import 'constants.dart';
import 'news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: const NewsView(),
    );
  }
}

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  _NewsViewSwipe createState() => _NewsViewSwipe();
}

class _NewsViewSwipe extends State<NewsView> {
  final PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1.0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.vertical,
      children: const [
        NewsScreen(),
        NewsScreen(),
        NewsScreen(),
      ],
    );
  }
}
