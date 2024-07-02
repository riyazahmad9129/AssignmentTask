import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:login_task/child_screen.dart';
import 'package:login_task/components/menu_component.dart';
import 'package:login_task/components/mytext_data.dart';
import 'package:login_task/distrtict_screen.dart';
import 'package:login_task/provider/log_out.dart';
import 'package:login_task/state_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final menuList = [
    {
      "title": "STATE",
      "page": const StateScreen(),
      "child": const Icon(
        Icons.account_balance_outlined,
        size: 60,
        color: Colors.green,
      ),
    },
    {
      "title": "DISTRICT",
      "page": const DistrictScreen(),
      "child": const Icon(
        Icons.home_outlined,
        size: 60,
        color: Colors.green,
      ),
    },
    {
      "title": "CHILD",
      "page": const ChildScreen(),
      "child": const Icon(
        Icons.child_care_outlined,
        size: 60,
        color: Colors.green,
      ),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(500, 60),
        child: AppBar(
          backgroundColor: Colors.green.shade800,
          leading: const Padding(
            padding: EdgeInsets.only(left: 28.0),
            child: Icon(
              CupertinoIcons.person_alt_circle,
              size: 50,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: GestureDetector(
                onTap: () async {
                  context.loaderOverlay.show();

                  AuthProvider();

                  await Future.delayed(const Duration(seconds: 2));

                  context.loaderOverlay.hide();
                  // Navigator.pop(context);
                },
                child: const Icon(
                  CupertinoIcons.power,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: OrientationBuilder(
          builder: (context,orn) {
            if(orn == Orientation.landscape){
              return Row(
                children: [
                  Expanded(child:   Image.asset(
                    "lib/assets/download.png",
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                    height: 300,
                  ),),
                  SizedBox(width: 20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                        homeWidget(),
                          const SizedBox(
                            height: 25,
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: menuList.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemBuilder: (context, index) {
                              final menu = menuList[index];
                              return MenuComponent(
                                text: menu["title"]?.toString() ?? "",
                                child: menu["child"] as Widget?,
                                onTap: () async {
                                  context.loaderOverlay.show();

                                  await Future.delayed(const Duration(seconds: 2));

                                  context.loaderOverlay.hide();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => menu["page"] as Widget,
                                    ),
                                  );
                                },
                              );
                            },
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return Column(
              children: [
              homeWidget(),
                SizedBox(
                  height: 25,
                ),
                Image.asset(
                  "lib/assets/download.png",
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    final menu = menuList[index];
                    return MenuComponent(
                      text: menu["title"]?.toString() ?? "",
                      child: menu["child"] as Widget?,
                      onTap: () async {
                        context.loaderOverlay.show();

                        await Future.delayed(const Duration(seconds: 2));

                        context.loaderOverlay.hide();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => menu["page"] as Widget,
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            );
          }
        ),
      ),
    );
  }
  Widget homeWidget(){
    return const Column(

      children: [
        MyTextData(title: "Name", data: "Hamza"),
        MyTextData(title: "Organization", data: "Bal Vikas"),
        MyTextData(title: "Designation", data: "Kanpur"),

      ],
    );
  }
}
