import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';

class WorkAndStudiesInfo extends StatelessWidget {
  const WorkAndStudiesInfo({
    Key key,
    @required this.user,
    @required this.title,
    @required this.place,
    @required this.startMonth,
    @required this.startYear,
    @required this.finalMonth,
    @required this.finalYear,
  }) : super(key: key);

  final UserInfo user;
  final String title;
  final String place;
  final String startMonth;
  final String startYear;
  final String finalMonth;
  final String finalYear;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (this.place == null || this.place == '')
                ? this.title
                : this.title + ' at ' + this.place,
          ),
          Row(
            children: [
              Text(
                this.startMonth + ' ' + this.startYear,
                style: TextStyle(color: Colors.blueGrey, fontSize: 12),
              ),
              if (this.finalMonth != null)
                Text(
                  ' - ' + this.finalMonth,
                  style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                ),
              Text(
                ' ' + this.finalYear,
                style: TextStyle(color: Colors.blueGrey, fontSize: 12),
              )
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
