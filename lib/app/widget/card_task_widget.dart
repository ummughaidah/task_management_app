import 'package:flutter/material.dart';

class CardTaskWidget extends StatelessWidget {
  final Function() onTap;
  final bool value;
  final Function(bool?) onChanged;
  final String title;
  final String description;
  final Function() onEdit;

  const CardTaskWidget({
    super.key,
    required this.onTap,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.description,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Checkbox(
                      value: value,
                      onChanged: onChanged,
                      activeColor: Colors.white,
                      checkColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.purple,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                  const SizedBox.square(dimension: 4),
                  Text(
                    value ? "Complate" : "Uncomplete",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox.square(dimension: 8),
              Expanded(
                child: Text(
                  description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              const SizedBox.square(dimension: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: onEdit,
                    child: const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.edit,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
