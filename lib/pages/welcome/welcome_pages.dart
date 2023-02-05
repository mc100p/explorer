import 'package:explorer/utils/magic_string.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  final String imgUrl;
  const WelcomePage({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(0, 0, 0, 0),
                const Color(0xCC000000),
              ])),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                this.imgUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 280,
          left: 20,
          child: Wrap(
            children: [
              Text(
                "Explore the \nBeauty of the\nworld with us",
                style: TextStyle(fontSize: 42.0, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 200,
          left: 20,
          child: Wrap(
            children: [
              Text(
                "If you like to travel, this is your place! Here you\ncan travel without hassle and enjoy it",
                style: TextStyle(
                    fontSize: 16.8,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 60,
          right: 30,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 35.0, vertical: 22.0),
            color: Theme.of(context).primaryColor,
            onPressed: () => context.pushNamed(
              RouteNames.homepage,
            ),
            child: Text(
              "Get Started",
              style: TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
