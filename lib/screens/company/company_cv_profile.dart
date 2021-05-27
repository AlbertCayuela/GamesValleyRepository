import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';

class CompanyCVProfileScreen extends StatelessWidget {
  final UserInformation user;
  CompanyCVProfileScreen(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                  child: user.profileImageUrl != '' ? null : Icon(Icons.person),
                ),
                Text(
                  user.name + user.surname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(user.email),
                Text(user.phone),
                Divider(),
                Column(
                  children: [Text('Work experience')],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
