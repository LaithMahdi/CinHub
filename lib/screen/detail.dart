import 'package:cin_hub/model/movie.dart';
import 'package:flutter/material.dart';

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
            children: [
              Text(widget.movie.name),
            ],
          ),
        ),
      ),
    );
  }
}
