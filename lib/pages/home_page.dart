// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var image = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "snorkling.png": "Snorkling",
    "kayaking.png": "Kayaking",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(builder: (context,state)
      {
        if(state is LoadedStates)
          {
            var info=state.places;
            return Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20.0, top: 70.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 30.0,
                        color: Colors.black54,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 20.0,
                        ),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: AppLargeText(text: 'Discover'),
                ),
                const SizedBox(
                  height: 30.0,
                ),
//Tab Bar
                Container(
                  child: TabBar(
                      labelColor: Colors.black54,
                      unselectedLabelColor: Colors.grey,
                      controller: _tabController,
                      labelPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      isScrollable: true,
                      indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                      tabs: const [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspiration",
                        ),
                        Tab(
                          text: "Emotions",
                        ),
                      ]),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20.0),
                  height: 340.0,
                  width: double.maxFinite,
                  child: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: ()
                            {
                              BlocProvider.of<AppCubits>(context).detailPage(info[index]);

                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: NetworkImage("http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          );
                        }),
                    Container(
                      child: const Text('danish'),
                    ),
                    Container(
                      child: const Text('danish'),
                    ),
                  ]),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, top: 30.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore More",
                        size: 22.0,
                      ),
                      AppText(
                        text: "See all",
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 15),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "images/${image.keys.elementAt(index)}",
                                      ),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Expanded(
                                child: AppText(
                                  text: image.values.elementAt(index),
                                  color: AppColors.textColor2,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          }
        else{
          return Container();
        }

      })
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(
      color: color,
      radius: radius,
    );
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height / 1.2 - radius / 2);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
