import 'package:cin_hub/screen/home.dart';
import 'package:cin_hub/static/MaterialColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../static/color.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var _chosenValue;
  TextEditingController card = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController cvv = TextEditingController();
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back),
                    onTap: () => Get.back(),
                  ),
                  const Spacer(),
                  const Text(
                    "Payment Method",
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
              const Text(
                "Add new payment method",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryColorDark,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColorDark),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButton<String>(
                  value: _chosenValue,
                  //elevation: 5,
                  style: const TextStyle(color: primaryColorDark),

                  items: <String>[
                    'Visa card',
                    'Master card',
                    'Smart D17 ',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(20),
                  isExpanded: true,
                  hint: const Text(
                    "Please choose your payment method",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _chosenValue = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              TextForm(
                tilte: "Card number",
                controller: card,
                keyborad: TextInputType.number,
              ),
              const SizedBox(height: 30),
              TextForm(
                tilte: "Exp Date",
                controller: date,
                keyborad: TextInputType.datetime,
              ),
              const SizedBox(height: 30),
              TextForm(
                tilte: "CVV Code ",
                controller: cvv,
                keyborad: TextInputType.number,
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Checkbox(
                    value: isCheck,
                    onChanged: (value) {
                      setState(() {
                        isCheck = value!;
                      });
                    },
                  ),
                  const Text("Set as your default payment method"),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (card.text.isEmpty &&
                      cvv.text.isEmpty &&
                      date.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red.shade500,
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        clipBehavior: Clip.none,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(20),
                        content: const Text(
                          "Required value",
                          style: TextStyle(
                            color: primaryColorLight,
                          ),
                        ),
                      ),
                    );
                  } else if (isCheck == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red.shade500,
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        clipBehavior: Clip.none,
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.all(20),
                        content: const Text(
                          "Please check the button",
                          style: TextStyle(
                            color: primaryColorLight,
                          ),
                        ),
                      ),
                    );
                  } else {
                    showAlertDialog();
                  }
                },
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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Ticket generated'),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  const Text("Your ticket has generated with success"),
                  const SizedBox(height: 25),
                  Image.asset(
                    "assets/images/qrcode.png",
                    width: MediaQuery.of(context).size.width * 0.45,
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ));
                  },
                  child: const Text('Next')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Cancel',
                  )),
            ],
          );
        });
  }
}

// ignore: must_be_immutable
class TextForm extends StatelessWidget {
  TextEditingController controller;
  TextInputType keyborad;
  String tilte;
  TextForm({
    super.key,
    required this.tilte,
    required this.controller,
    required this.keyborad,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyborad,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: tilte,
        hintText: tilte,
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
    );
  }
}
