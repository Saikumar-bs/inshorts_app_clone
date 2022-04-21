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
        NewsScreen(
          headline:
              "Russia has warned Mariupol residents to wear white ribbon or get shot: Ukraine",
          text:
              "The Russian forces in the besieged city of Mariupol, Ukraine, have threatened to shoot civilians if they don't wear white ribbons, Petro Andriushchenko, advisor to the Mayor of Mariupol, said. The white ribbon is believed to be a symbol for Russian troops to identify Ukrainians who've accepted defeat. Russian President Vladimir Putin on Thursday claimed to have 'successfully liberated' Mariupol.",
        ),
        NewsScreen(
          headline:
              "UK PM climbs onto a bulldozer at JCB factory in Gujarat; video surfaces",
          text:
              "A video showing UK PM Boris Johnson climbing onto a bulldozer at JCB's new factory and waving during his visit to Gujarat's Panchmahal has surfaced online. Johnson was visiting the factory with Gujarat CM Bhupendra Patel on Thursday. He also met business tycoon Gautam Adani, who tweeted, 'Honoured to host Boris Johnson, the first UK PM to visit Gujarat.'",
        ),
        NewsScreen(
          headline:
              "Odisha Dalit man forced to rub nose in spit for refusing ₹500 temple donation",
          text:
              "A 32-year-old Dalit man was allegedly forced to rub his nose in his own spit for refusing to donate ₹500 for a temple renovation work in Odisha's Kendrapara, police said. His wife alleged that the village sarpanch abused the couple for refusing to give the donation. The sarpanch, who dismissed the allegations, has been booked along with three others.",
        ),
        NewsScreen(
          headline:
              "India's richest person Adani hosts UK PM Boris Johnson in Gujarat; shares pic",
          text:
              "Gautam Adani, India's richest person and the world's sixth-richest person with Dollar 117 billion wealth, hosted UK's PM Boris Johnson on Thursday at the Adani Group headquarters in Gujarat. Johnson, who's on a two-day visit to India, is the first UK PM to visit Gujarat. Adani tweeted that he was 'honoured' to host the UK PM.",
        ),
        NewsScreen(
          headline:
              "Filled with pride for my powerhouse bhaijaan: Ishaan praises Shahid for Jersey",
          text:
              "Actor Ishaan Khatter took to Instagram to praise actor Shahid Kapoor for his recently released film 'Jersey'. Sharing his review for the movie, Ishaan wrote, 'As a brother, I'm filled with pride, as an actor with respect and as an audience with admiration for my powerhouse bhaijaan ShahidKapoor. Thank you for sharing what you did through this character.'",
        ),
        NewsScreen(
          headline:
              "Still can't believe you're gone: Actress Akshara Gowda on her mother's demise",
          text:
              "Actress Akshara Gowda mourned the loss of her mother who passed away on April 12. Taking to Instagram, she shared a post for her and wrote, 'The worst part about the death of someone you love is...you can't die with them (I so wish I can)...I still can't believe you are gone...I hope I'll make you proud.'",
        ),
        NewsScreen(
          headline:
              "Abhishek Bachchan is very humble & supportive: 'Dasvi' co-star Arun",
          text:
              "'Dasvi' actor Arun Kushwah, speaking about his film's co-star Abhishek Bachchan, has said, 'Abhishek sir is a great company, very humble and supportive. Arun further stated that he and Abhishek never had a boring moment together. 'I also believe that you get to learn a lot when you work with experienced individuals,'' he added. The film also featured Yami Gautam.",
        ),
        NewsScreen(
          headline:
              "I am not sure how relevant MI-CSK rivalry is in IPL 2022: Harbhajan",
          text:
              "Discussing the upcoming match between MI and CSK, ex-India spinner Harbhajan Singh said he is not sure how 'relevant' their rivalry is in IPL 2022. 'The franchises that were in the top two are now in bottom two, 'added Harbhajan. 'This match was like India versus Pakistan in terms of rivalry,' stated Harbhajan. Harbhajan represented both franchises during his career.",
        ),
        NewsScreen(
          headline:
              "No taboos for us: Germany's Baerbock on providing weapons to Ukraine",
          text:
              "Foreign Minister Annalena Baerbock said there are ;'no taboos' in Germany supplying armoured vehicles and weapons to Ukraine as Russia's invasion of the country continues. She added that Germany's priority was to quickly provide Ukraine with Soviet-designed kit that its military could use without requiring any extra training. 'We know that everyday counts, Baerbock said.",
        ),
        NewsScreen(
          headline:
              "German Finance Minister tests positive for COVID-19 during US trip",
          text:
              "German Finance Minister Christian Lindner on Wednesday said he tested positive for COVID-19 after his appointments with the International Monetary Fund and the G20 in Washington. Lindner added that due to having taken three vaccinations he was experiencing 'only mild and already fading cold symptoms'. Lindner, 43, had more appointments scheduled on Thursday in the US before returning to Germany.",
        ),
      ],
    );
  }
}
