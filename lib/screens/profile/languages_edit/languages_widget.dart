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
                if (this.user.languages.length > 1)
                  for (int i = 0; i < this.user.languages.length; i++)
                    if (this.user.languages[i].isNotEmpty)
                      Row(
                        children: [
                          Text(this.user.languages[i][0] + ' - '),
                          Text(
                            this.user.languages[i][1] + ' level',
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
              onPressed: () {
                Navigator.pushNamed(context, '/editlanguages');
              },
              child: Text('Edit'),
            ),
          )
        ],
      ),
    );
  }
}
