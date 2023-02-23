import 'package:cin_hub/controller/DetailController.dart';
import 'package:cin_hub/static/MaterialColor.dart';
import 'package:cin_hub/static/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
