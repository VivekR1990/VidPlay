import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 25,
              )),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            const Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(
                    'VidPlay',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ]),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Version 1.0',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
