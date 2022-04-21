import 'package:flutter/material.dart';
import 'package:inshorts_clone/main.dart';
import 'constants.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

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
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'From its medieval origins to the digital era, learn everything there is to know',
              style: TextStyle(
                color: kTextColor,
                fontSize: 25.0,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Lorem ipsum, or ipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Ciceros De Finibus Bonorum et Malorum for use in a type specimen book.',
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

_launchURL() async {
  const url = 'https://fwd.wiki';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
