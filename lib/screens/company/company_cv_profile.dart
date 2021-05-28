import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';

class CompanyCVProfileScreen extends StatelessWidget {
  final UserInformation user;
  CompanyCVProfileScreen(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: user.profileImageUrl != ''
                        ? NetworkImage(user.profileImageUrl)
                        : null,
                    child:
                        user.profileImageUrl != '' ? null : Icon(Icons.person),
                  ),
                  Text(
                    user.name + user.surname,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(user.phone),
                  Divider(
                    color: Colors.deepPurple,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work experience',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      for (int i = 0; i < user.workExperiences.length; i++)
                        ExperienceWidget(user.workExperiences[i]),
                      Divider(color: Colors.deepPurple),
                      Text(
                        'Studies',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      for (int j = 0; j < user.studies.length; j++)
                        ExperienceWidget(user.studies[j]),
                      Divider(color: Colors.deepPurple),
                      Text('Languages',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      for (int k = 0; k < user.languages.length; k++)
                        LanguagesWidget(user.languages[k]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  final List experiences;
  ExperienceWidget(this.experiences);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              experiences[0],
              style: TextStyle(fontSize: 15),
            ),
            if (experiences[1] != '') Text(' at ' + experiences[1]),
          ],
        ),
        Row(
          children: [
            Text(
              experiences[2] + ' ' + experiences[3],
              style: TextStyle(color: Colors.blueGrey),
            ),
            Text(' - ', style: TextStyle(color: Colors.blueGrey)),
            experiences[4] != null
                ? Text(experiences[4] + ' ' + experiences[5],
                    style: TextStyle(color: Colors.blueGrey))
                : Text('Now', style: TextStyle(color: Colors.blueGrey))
          ],
        ),
      ],
    );
  }
}

class LanguagesWidget extends StatelessWidget {
  final List languages;
  LanguagesWidget(this.languages);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(languages[0]),
        Text(' - '),
        Text(languages[1], style: TextStyle(color: Colors.blueGrey)),
      ],
    );
  }
}
