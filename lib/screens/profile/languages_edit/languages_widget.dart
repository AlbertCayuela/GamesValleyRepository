import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';

class LanguagesWidget extends StatelessWidget {
  const LanguagesWidget({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserInfo user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Languages',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('English - '),
                    Text(
                      'Professional level',
                      style: TextStyle(color: Colors.blueGrey),
                    )
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: Text('Edit'),
            ),
          )
        ],
      ),
    );
  }
}
