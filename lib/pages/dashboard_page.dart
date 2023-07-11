import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:monthly_budget_app/json/activity_json.dart';
import '../theme/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 350,
          child: Stack(
            children: [
              appBarCurve(),
              appBarBalance(),
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        getActivity(),
        const SizedBox(
          height: 35,
        ),
      ],
    ));
  }

  Widget appBarCurve() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.25,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                primary,
                secondary,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: bgColor.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 10,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: SafeArea(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "\$",
                        style: TextStyle(
                          fontSize: 20,
                          color: white,
                        ),
                      ),
                      Text(
                        "1,752",
                        style: TextStyle(
                          fontSize: 30,
                          color: white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Available Balance",
                    style: TextStyle(
                      color: white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://t3.ftcdn.net/jpg/04/67/63/68/360_F_467636853_Hs8fMr0TucvHVkvO2q0sbksdKU4pdOSQ.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 35,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          border: Border.all(color: primary)),
                    ),
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  Widget appBarBalance() {
    var size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: size.width,
          height: 210,
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: black.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spent",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: black.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "\$1,460",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Earned",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: black.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                "\$3,850",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "You spent \$1,230 on dining out this month. Let's try to make it lower",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Tell me more",
                    style: TextStyle(
                        fontSize: 15,
                        color: primary,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getActivity() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Activity",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 25,
            children: List.generate(items.length, (index) {
              return Container(
                width: (size.width / 3) - 30,
                height: (size.width / 3) - 25,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: black.withOpacity(0.015),
                        spreadRadius: 10,
                        blurRadius: 10),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                              colors: [primary, secondary])),
                      child: Center(
                        child: Icon(
                          items[index]['icon'],
                          color: white,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      items[index]['title'],
                      style: TextStyle(
                          fontSize: 13, color: black.withOpacity(0.5)),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
