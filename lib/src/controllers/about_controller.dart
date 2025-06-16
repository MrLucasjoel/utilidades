import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utilidades/src/models/about_model.dart';

class AboutController {
  AboutModel getAbout() {
    return AboutModel(
      photoUrl:
          "https://avatars.githubusercontent.com/u/195806201?s=400&u=89e1c0f7ce985e6c4efe3c23c0c74ab3d5e5eea4&v=4",
      aboutMe:[
          "Olá me chamo Lucas Joel",
          "Venha conhecer um pouco mais de mim",
          "Profisional Tec",
          "💻 Entra21/PróWay Flutter, SQL, JS📲",
          "     +Devs2/Senai Flutter",
          "Siga-me nas redes sociasis",
          ],
      SocialLinks: [
        SocialLink(
          name: "Github",
          icon: FontAwesomeIcons.github,
          color: Colors.black,
          url: "https://github.com/MrLucasjoel",
        ),
        SocialLink(
          name: "LinKedIn",
          icon: FontAwesomeIcons.linkedin,
          color: Colors.blue,
          url: "https://www.linkedin.com/in/lucas-joel-pfleger-278146342/",
        ),
        SocialLink(
          name: "Youtube",
          icon: FontAwesomeIcons.youtube,
          color: Colors.red,
          url: "https://www.youtube.com/watch?v=ofuHDFOcgr8",
        ),
      ],
    );
  }
}
