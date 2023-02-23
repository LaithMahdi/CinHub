import 'package:cin_hub/main.dart';
import 'package:cin_hub/screen/detail.dart';
import 'package:cin_hub/static/MaterialColor.dart';
import 'package:cin_hub/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../static/static.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name = sharedPref!.getString("name");
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: CompanyColors.colorYellow,
              ),
              child: Center(child: Text("$name")),
            ),
            InkWell(
              child: const Text("Logout"),
              onTap: () {
                sharedPref!.clear();
                Get.offAllNamed("/");
              },
            )
          ],
        ),
      ),
      drawerEnableOpenDragGesture: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 45),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello $name",
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: primaryColorDark,
                  ),
                ),
                Builder(
                  builder: (context) => // Ensure Scaffold is in context
                      GestureDetector(
                    child: const Icon(Icons.menu, color: primaryColorDark),
                    onTap: () => Scaffold.of(context).openEndDrawer(),
                  ),
                )
              ],
            ),
            const SizedBox(height: 45),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "What would You like to see today ?",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: CompanyColors.colorYellow),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: primaryColorDark,
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 14,
                      color: primaryColorGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          listFilm[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                  itemCount: listFilm.length),
            ),
            const SizedBox(height: 25),
            const Text(
              "Movie for today",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: primaryColorDark,
              ),
            ),
            const SizedBox(height: 25),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Hero(
                  tag: movieList[index],
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detail(movie: movieList[index]),
                    )),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                              child: Image.asset(
                                movieList[index].image,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Text(
                                  movieList[index].name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  movieList[index].catagory,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: primaryColorGrey,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    for (int i = 0;
                                        i < movieList[index].nbStar;
                                        i++)
                                      const Icon(
                                        Icons.star,
                                        color: CompanyColors.colorYellow,
                                      ),
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: movieList.length,
            )
          ],
        ),
      )),
    );
  }
}
