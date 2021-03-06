
import 'package:alsignon/Router/RoutConstants.dart';
import 'package:flutter/material.dart';

import 'package:introduction_screen/introduction_screen.dart';


class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
   Navigator.pushReplacementNamed(context, countryRoute);
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('lib/Assets/image/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 15.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title:"Relax and get your task done!"  ,
          body:
              "Enjoy your time to do what you love",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Want to completehome task?",
          body:
              "Choose from over 100+ home services at best pratice",
          image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
        // PageViewModel(
        //   title: "Kids and teens",
        //   body:
        //       "Kids and teens can track their stocks 24/7 and place trades that you approve.",
        //   image: _buildImage('img3'),
        //   decoration: pageDecoration,
        // ),
        // PageViewModel(
        //   title: "Another title page",
        //   body: "Another beautiful body text for this example onboarding",
        //   image: _buildImage('img2'),
        //   footer: RaisedButton(
        //     onPressed: () {
        //       introKey.currentState?.animateScroll(0);
        //     },
        //     child: const Text(
        //       'FooButton',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     color: Colors.lightBlue,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8.0),
        //     ),
        //   ),
        //   decoration: pageDecoration,
        // ),
        PageViewModel(
          title: "Compare offers and choose",
          // bodyWidget: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: const [
          //     Text("Click on ", style: bodyStyle),
          //     Icon(Icons.edit),
          //     Text(" to edit a post", style: bodyStyle),
          //   ],
          // ),
          body: "The most sutable for you and connect ai call or chat",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Start', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

