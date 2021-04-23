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
            this.title + ' at ' + this.place,
          ),
          Text(
            this.startMonth +
                ' ' +
                this.startYear.toString() +
                ' - ' +
                this.finalMonth +
                ' ' +
                this.finalYear.toString(),
            style: TextStyle(color: Colors.blueGrey, fontSize: 12),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
