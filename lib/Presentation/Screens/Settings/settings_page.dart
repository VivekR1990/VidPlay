import 'package:flutter/material.dart';
import 'package:video_vid_play/Presentation/Screens/Settings/about_page.dart';
import 'package:video_vid_play/Presentation/Screens/Settings/terms_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 80),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutPage()),
                  ),
                  child: const Text('About VidPlay',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsPage()),
                  ),
                  child: const Text('Terms And Conditions',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
