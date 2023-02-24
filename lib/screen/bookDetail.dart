import 'dart:async';

import 'package:cin_hub/controller/DetailController.dart';
import 'package:cin_hub/static/MaterialColor.dart';
import 'package:cin_hub/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

import '../model/date.dart';
import '../model/movie.dart';

class BookDetail extends StatefulWidget {
  final Movie movie;
  // ignore: prefer_const_constructors_in_immutables
  BookDetail({super.key, required this.movie});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  void initState() {
    super.initState();
    init();
    if (widget.movie.nbPerson == 0) {
      TextSP.text = widget.movie.nbPerson.toString();
    }
    dateList = [
      DateApp(
        days: "${formatter.format(now)} ${formatter1.format(now)}",
        etat: false,
      ),
      DateApp(
        days:
            "${formatter.format(now.add(const Duration(days: 1)))} ${formatter1.format(now.add(const Duration(days: 1)))}",
        etat: false,
      ),
      DateApp(
        days:
            "${formatter.format(now.add(const Duration(days: 2)))} ${formatter1.format(now.add(const Duration(days: 2)))}",
        etat: false,
      ),
      DateApp(
        days:
            "${formatter.format(now.add(const Duration(days: 3)))} ${formatter1.format(now.add(const Duration(days: 3)))}",
        etat: false,
      ),
    ];
  }

  init() async {
    await Timer(
      Duration(seconds: 2),
      () => setState(() {
        daley = true;
      }),
    );
  }

  bool daley = false;
  bool read = false;
  TextEditingController TextSP = TextEditingController();

  var now = DateTime.now();
  var formatter = DateFormat('dd');
  var formatter1 = DateFormat('EE');
  List<DateApp> dateList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: daley == false
            ? Center(
                child: CircularProgressIndicator(
                backgroundColor: primaryColorDark.withOpacity(0.5),
              ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const SizedBox(height: 45),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.arrow_back),
                          onTap: () => Get.back(),
                        ),
                        const Spacer(),
                        const Text(
                          "Select seats",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: primaryColorDark,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Name :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: primaryColorDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    widget.movie.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: primaryColorDark,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text(
                                  "Catagory :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: primaryColorDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  widget.movie.catagory,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: primaryColorDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text(
                                  "Ratings :",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: primaryColorDark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  children: [
                                    for (int i = 0;
                                        i < widget.movie.nbStar;
                                        i++)
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow.shade700,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        ////////
                        const Spacer(),
                        Image.asset(
                          widget.movie.image,
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.2,
                        )
                      ],
                    ),
                    ////////
                    const SizedBox(height: 50),
                    const Text(
                      "Numbre of spectator",
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColorDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: TextSP,
                      readOnly: widget.movie.nbPerson == 0
                          ? read = true
                          : read = false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20),
                        hintText: "Numbre",
                        filled: true,
                        fillColor: primaryColorLight,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: primaryColorGrey,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "number of places left : ${widget.movie.nbPerson}",
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryColorDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 20),
                                child: ChoiceChip(
                                  selectedColor: CompanyColors.colorYellow,
                                  shape: RoundedRectangleBorder(
                                      side: dateList[index].etat!
                                          ? const BorderSide(
                                              style: BorderStyle.none,
                                            )
                                          : const BorderSide(
                                              style: BorderStyle.solid,
                                              width: 2,
                                              color: Color(0xffF4F4F4)),
                                      borderRadius: BorderRadius.circular(10)),
                                  label: Column(children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 15,
                                      ),
                                      child: Text(
                                        "${dateList[index].days}",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ]),
                                  selected: dateList[index].etat!,
                                  backgroundColor: Colors.white,
                                  labelStyle: dateList[index].etat!
                                      ? const TextStyle(color: Colors.white)
                                      : const TextStyle(
                                          color: primaryColorDark),
                                  onSelected: (value) {
                                    setState(() {
                                      for (int i = 0;
                                          i < dateList.length;
                                          i++) {
                                        if (dateList[index].days !=
                                            dateList[i].days) {
                                          dateList[i].etat = false;
                                        }
                                      }
                                      dateList[index].etat = value;
                                    });
                                  },
                                ),
                              )
                            ],
                          );
                        },
                        itemCount: dateList.length,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(MediaQuery.of(context).size.width, 0),
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Generate your ticket",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: primaryColorLight,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 20),
                  ],
                ),
              ),
      ),
    );
  }
}

class ChoiceChocce extends StatelessWidget {
  String number;
  ChoiceChocce({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) => ChoiceChip(
        label: Text(
          number,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: controller.isSelected ? primaryColorLight : primaryColorDark,
          ),
        ),
        selected: controller.isSelected,
        selectedColor: CompanyColors.colorYellow,
        elevation: 10,
        labelPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onSelected: (value) => controller.selected(),
      ),
    );
  }
}
