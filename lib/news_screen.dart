import 'package:flutter/material.dart';
import 'package:inshorts_clone/main.dart';
import 'constants.dart';

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
          // Container(
          //   height: 20.0,
          //   width: 80.0,
          //   decoration: BoxDecoration(
          //       color: kBackgroundColor, borderRadius: BorderRadius.circular(10)),
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: Text(
          //       'inshorts',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         color: kTextColor.withOpacity(0.45),
          //         fontSize: 14.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'From its medieval origins to the digital era, learn everything there is to know',
              style: TextStyle(
                color: kTextColor,
                fontSize: 25.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Ciceros De Finibus Bonorum et Malorum for use in a type specimen book.',
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
