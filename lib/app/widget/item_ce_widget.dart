import 'package:flutter/material.dart';

class ItemCEWidget extends StatelessWidget {
  final TextEditingController? controllerTitle;
  final TextEditingController? controllerDescription;
  final Function() onPressed;
  const ItemCEWidget(
      {super.key,
      this.controllerTitle,
      this.controllerDescription,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controllerTitle,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              contentPadding: const EdgeInsets.all(8),
              labelText: 'Title',
              hintText: 'create title'),
        ),
        const SizedBox.square(dimension: 16),
        TextFormField(
          controller: controllerDescription,
          maxLines: 8,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              contentPadding: const EdgeInsets.all(8),
              labelText: 'Description',
              hintText: 'create description'),
        ),
        const SizedBox.square(dimension: 16),
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            // backgroundColor: WidgetStateProperty.all<Color>(y),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
          child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: const Center(child: Text('Save'))),
        )
      ],
    );
  }
}
