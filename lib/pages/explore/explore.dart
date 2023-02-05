import 'dart:ui';
import 'package:explorer/model/explore_model.dart';
import 'package:explorer/utils/custom_icons_icons.dart';
import 'package:explorer/utils/magic_string.dart';
import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: CustomScrollView(
          slivers: [
            SliverPadding(padding: const EdgeInsets.symmetric(vertical: 40)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 17,
                      child: TextFormField(
                        initialValue: "Where to?",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 17),
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(CustomIcons.search, color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(28),
                            borderSide:
                                BorderSide(color: Colors.grey), //<-- SEE HERE
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[200]),
                      child: Icon(
                        CustomIcons.settings,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        ImageNames.epic_surf,
                        fit: BoxFit.cover,
                        height: size.height * 0.40,
                        width: size.width * 100,
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 10,
                      child: Text(
                        "Epic Surf \nTrips",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 10,
                      child: Text(
                        "Travelors share their favorite \ndestinations",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        left: 10,
                        child: MaterialButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 24.0, horizontal: 36.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                          color: Theme.of(context).primaryColor,
                          onPressed: () {},
                          child: Text(
                            "Explore Now",
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Spend a little time with nature",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    height: 400,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: explore.length,
                        itemBuilder: (context, index) {
                          // String str = explore[index].name;
                          // var names = str.split(" ");

                          // print(names[1]);
                          // // var firstName = names[0];
                          // // var lastName = names[1];
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    explore[index].imgUrl,
                                    fit: BoxFit.fill,
                                    height: size.height * 0.40,
                                    width: size.width * 0.70,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 28,
                                left: 15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: const EdgeInsets.all(18.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.black.withOpacity(0.2)),
                                    child: BackdropFilter(
                                      filter: new ImageFilter.blur(
                                          sigmaX: 25.0, sigmaY: 25.0),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: '\$${explore[index].cost}',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500)),
                                        TextSpan(
                                            text: '/Person',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w200)),
                                      ])),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 28,
                                right: 15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    padding: const EdgeInsets.all(18.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.black.withOpacity(0.1)),
                                    child: BackdropFilter(
                                      filter: new ImageFilter.blur(
                                          sigmaX: 1.0, sigmaY: 1.0),
                                      child: Icon(
                                        CustomIcons.heart,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 100,
                                left: 15,
                                child: Text(
                                  explore[index].name,
                                  style: TextStyle(
                                      fontSize: 32, color: Colors.white),
                                ),
                              ),
                              Positioned(
                                  bottom: 40,
                                  left: 15,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        explore[index].location,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  )),
                              Positioned(
                                bottom: 30,
                                right: 15,
                                child: Container(
                                  padding: const EdgeInsets.all(22.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Theme.of(context).primaryColor),
                                  child: Icon(
                                    Icons.arrow_circle_left,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                )),
            SliverPadding(padding: const EdgeInsets.symmetric(vertical: 100))
          ],
        ),
      ),
    );
  }
}
