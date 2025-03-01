import 'dart:ui';
import 'package:explorer/model/places_model.dart';
import 'package:explorer/pages/explore/explore.dart';
import 'package:explorer/utils/custom_icons_icons.dart';
import 'package:explorer/utils/magic_string.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          TabBarView(controller: tabController, children: [
            HomePageContent(),
            Explore(),
            Container(),
            Container(),
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
              child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 8.0, sigmaY: 18.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff171433).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      )),
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: tabController,
                    indicatorColor: Colors.transparent,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.grey,
                    onTap: (value) {
                      setState(() {
                        currentIndex = tabController.index;
                      });
                    },
                    tabs: [
                      icons(currentIndex == 0
                          ? CustomIcons.home_filled
                          : CustomIcons.home),
                      icons(currentIndex == 1
                          ? CustomIcons.explore_filled
                          : CustomIcons.explore),
                      icons(currentIndex == 2
                          ? CustomIcons.heart_filled
                          : CustomIcons.heart),
                      icons(currentIndex == 3
                          ? CustomIcons.person_filled
                          : CustomIcons.person),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget icons(IconData icon) {
    return Icon(icon, size: 22.0);
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List countries = [
      'Africa',
      'Asia',
      'Europe',
      'Spain',
    ];
    return CustomScrollView(
      slivers: [
        SliverPadding(padding: const EdgeInsets.symmetric(vertical: 50)),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Find your",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "favourite place",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(22.0),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            CustomIcons.notification,
                            size: 25,
                          ),
                        ),
                        Positioned(
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: countries.length,
                    itemBuilder: ((context, index) {
                      return containerTile(countries[index]);
                    })),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return slivercountcontainer(context, places[index]);
            },
            childCount: places.length,
          ),
        ),
        SliverPadding(padding: const EdgeInsets.symmetric(vertical: 80)),
      ],
    );
  }

  Widget containerTile(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            border: name == 'Asia'
                ? Border.all(color: Colors.black)
                : Border.all(color: Color.fromARGB(255, 212, 211, 211)),
            borderRadius: BorderRadius.circular(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageNames.earth,
              height: 22,
              width: 22,
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(
                  fontWeight:
                      name == 'Asia' ? FontWeight.w600 : FontWeight.w100,
                  fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget slivercountcontainer(BuildContext context, Places places) {
    Size size = MediaQuery.of(context).size;
    String str = places.name;
    var names = str.split(" ");
    var firstName = names[0];
    var lastName = names[1];
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              places.imgUrl,
              fit: BoxFit.cover,
              height: size.height * 0.40,
              width: size.width * 100,
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
                  color: Color(0xff171433).withValues(alpha: 0.1)),
              child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 25.0, sigmaY: 25.0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '\$${places.cost}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: '/Person',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w200)),
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
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff171433).withValues(alpha: 0.1)),
              child: BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Icon(
                  CustomIcons.heart,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          left: 15,
          child: Text(
            '$firstName \n$lastName',
            style: TextStyle(fontSize: 32, color: Colors.white),
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
                  places.location,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            )),
        Positioned(
          bottom: 30,
          right: 15,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).primaryColor),
            child: Icon(
              CustomIcons.up_right_arrow,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
