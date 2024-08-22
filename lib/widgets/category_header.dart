import 'package:flutter/material.dart';

class CategoryHeader extends StatefulWidget {
  final String title;
  final String count;

  const CategoryHeader({super.key, required this.title, required this.count});

  @override
  State<CategoryHeader> createState() => _CategoryHeaderState();
}

class _CategoryHeaderState extends State<CategoryHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [Text(widget.title), Text(widget.count), Text("See All")],
        )
      ],
    );
  }
}
