import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(context.read<UserRepository>().getUserEmail()),
          RaisedButton(
            onPressed: () {
              context.read<UserRepository>().singOut();
            },
            child: Text('Sing out'),
          )
        ],
      ),
    );
  }
}
