import 'dart:core';
import 'package:flutter/material.dart';
import 'package:inshorts_clone/constants.dart';
import 'package:inshorts_clone/news_class.dart';
import 'constants.dart';

class NewsData extends ChangeNotifier {
  int _newsNumber = 0;

  final List<News> _newsData = [
    News(image: kImage1, newsHead: kHeading1, newsDetails: kDetails1),
    News(image: kImage2, newsHead: kHeading2, newsDetails: kDetails2),
    News(image: kImage3, newsHead: kHeading3, newsDetails: kDetails3),
    News(image: kImage3, newsHead: kHeading4, newsDetails: kDetails4),
    News(image: kImage5, newsHead: kHeading5, newsDetails: kDetails5),
    News(image: kImage5, newsHead: kHeading6, newsDetails: kDetails6),
    News(image: kImage5, newsHead: kHeading7, newsDetails: kDetails7),
    News(image: kImage1, newsHead: kHeading8, newsDetails: kDetails8),
    News(image: kImage1, newsHead: kHeading9, newsDetails: kDetails9),
    News(image: kImage1, newsHead: kHeading10, newsDetails: kDetails10),
  ];

  List<News> get newsData => _newsData;

  void nextNews() {
    if (_newsNumber < _newsData.length - 1) {
      _newsNumber++;
    }
  }

  String getNewsHead() {
    return _newsData[_newsNumber].newsHead;
  }

  String getNewsDetails() {
    return _newsData[_newsNumber].newsDetails;
  }

  AssetImage getImage() {
    return _newsData[_newsNumber].image;
  }
}
