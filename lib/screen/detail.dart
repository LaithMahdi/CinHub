import 'package:cin_hub/controller/DetailController.dart';
import 'package:cin_hub/model/movie.dart';
import 'package:cin_hub/static/MaterialColor.dart';
import 'package:cin_hub/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detail extends StatefulWidget {
  final Movie movie;
  Detail({super.key, required this.movie});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      widget.movie.image,
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 20,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: primaryColorLight.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.arrow_back)),
                            onTap: () => Get.back(),
                          ),
                          GetBuilder<DetailController>(
                            init: DetailController(),
                            builder: (controller) => GestureDetector(
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: primaryColorLight.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: controller.isTaped
                                      ? const Icon(Icons.favorite)
                                      : const Icon(Icons.favorite_border)),
                              onTap: () => controller.like(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movie.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: primaryColorDark,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.movie.catagory,
                          style: const TextStyle(
                            color: primaryColorDark,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          children: [
                            for (int i = 0; i < widget.movie.nbStar; i++)
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.movie.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 14,
                        color: primaryColorGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "Actors",
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColorDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Container(
                          child: Row(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                widget.movie.listActeur[index].image,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Text(
                                  widget.movie.listActeur[index].name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: primaryColorDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  widget.movie.listActeur[index].role,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: primaryColorGrey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ]),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 15),
                        itemCount: widget.movie.listActeur.length,
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                        ),
                        child: const Text(
                          "book",
                          style: TextStyle(
                            fontSize: 18,
                            color: primaryColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
