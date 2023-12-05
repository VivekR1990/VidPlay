import 'package:flutter/material.dart';

class PopupMenuButtonVideo extends StatelessWidget {
  const PopupMenuButtonVideo({super.key});

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
                  const Text("Favorite", style: TextStyle(color: Colors.black)),
            ),
          ),
          PopupMenuItem(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  const Text("Delete", style: TextStyle(color: Colors.black)),
            ),
          ),
        ];
      },
    );
  }
}
