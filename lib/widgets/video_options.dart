import 'package:flutter/material.dart';

class PopupMenuVideoOption extends StatelessWidget {
  const PopupMenuVideoOption({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.black,
        size: 25,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text("Sort", style: TextStyle(color: Colors.black)),
            ),
          ),
          PopupMenuItem(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text("Select", style: TextStyle(color: Colors.black)),
            ),
          ),
        ];
      },
    );
  }
}
