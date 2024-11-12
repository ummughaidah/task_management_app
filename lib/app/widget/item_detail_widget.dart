import 'package:flutter/material.dart';

class ItemDetailWidget extends StatelessWidget {
  final String status;
  final String description;
  const ItemDetailWidget(
      {super.key, required this.status, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Status: $status',
            style: const TextStyle(fontSize: 10),
          ),
        ),
        const SizedBox.square(dimension: 4),
        Text(
          description,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
