import 'package:flutter/material.dart';

class ContainerWidgate extends StatelessWidget {
  ContainerWidgate({super.key, required this.childrens});
  final List<Widget> childrens;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: childrens),
    );
  }
}
