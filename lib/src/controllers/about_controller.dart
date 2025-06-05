import 'package:flutter/material.dart';
import 'package:utilidades/src/models/about_model.dart';

class AboutController {
  AboutModel getAbout() {
    return AboutModel(
      photoUrl:
          "https://avatars.githubusercontent.com/u/195806201?s=400&u=89e1c0f7ce985e6c4efe3c23c0c74ab3d5e5eea4&v=4",
      aboutMe:[
          "💻 Entra21/PróWay Flutter, SQL, JS📲"
          "Olá sou o Lucas Joel"
          "Profisional Tec"
          ],
      SocialLinks: [
        SocialLink(
          name: "Github",
          icon: Icons.add,
          url: "https://github.com/MrLucasjoel",
        ),
        SocialLink(
          name: "LinKedIn",
          icon: Icons.add,
          url: "https://www.linkedin.com/in/lucas-joel-pfleger-278146342/",
        ),
      ],
    );
  }
}
