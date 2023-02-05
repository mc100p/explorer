import 'package:explorer/pages/welcome/welcome_pages.dart';
import 'package:explorer/utils/magic_string.dart';
import 'package:flutter/material.dart';

import '../../utils/dot_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;
  int currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> pages = [
    WelcomePage(imgUrl: ImageNames.welcome_cover_image1),
    WelcomePage(imgUrl: ImageNames.welcome_cover_image2),
    WelcomePage(imgUrl: ImageNames.welcome_cover_image3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dx > sensitivity) {
            if (currentIndex > 0) {
              _controller.previousPage(
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            }
          } else if (details.delta.dx < -sensitivity) {
            if (currentIndex < 2) {
              _controller.nextPage(
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
            }
          }
        },
        child: Stack(
          children: [
            PageView(
              pageSnapping: true,
              allowImplicitScrolling: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: pages,
              onPageChanged: (index) {
                setState(
                  () {
                    currentIndex = index;
                  },
                );
              },
            ),
            Positioned(
              bottom: 90,
              left: 30,
              child: Container(
                child: new Center(
                  child: new DotsIndicator(
                    controller: _controller,
                    itemCount: pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
