import 'dart:io';
import 'package:flutter/material.dart';
import 'package:utilidades/src/controllers/about_controller.dart';

class AboutView extends StatelessWidget {
  final AboutController controller = AboutController();
  AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final about = controller.getAbout();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(about.photoUrl),
              radius: 60,
            ),
            const SizedBox(height: 20,),
            Column(
              children: about.aboutMe.map(
                (part) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Text(part, style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.justify,
                  ),
                ),
              ).toList(),   
            ),
            SizedBox(height: 20),
             Row(
            children: about.SocialLinks.map((link){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(link.icon)),
                    ],
                  ),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}