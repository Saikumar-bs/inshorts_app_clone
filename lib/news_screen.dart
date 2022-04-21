import 'package:flutter/material.dart';
import 'constants.dart';

class NewsScreen extends StatelessWidget {
  final headline;
  final text;
  const NewsScreen({
    Key? key,
    this.headline,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            height: size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fill,
                image: AssetImage(
                  "assets/images/breaking_news.jpg",
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              headline,
              style: TextStyle(
                color: kTextColor,
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 12.0, 20.0, 12.0),
            child: Text(
              text,
              style: TextStyle(
                color: kTextColor,
                fontSize: 18.0,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

// class LinkView extends StatefulWidget {
//   const LinkView({Key? key}) : super(key: key);

//   @override
//   _LinkViewSwipe createState() => _LinkViewSwipe();
// }

// class _LinkViewSwipe extends State<NewsView> {
//   final PageController _controller =
//       PageController(initialPage: 0, viewportFraction: 1.0);

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       controller: _controller,
//       scrollDirection: Axis.horizontal,
//       children: [
//         _launchURL,
//       ],
//     );
//   }
// }

// _launchURL() async {
//   const url = 'https://fwd.wiki';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }
