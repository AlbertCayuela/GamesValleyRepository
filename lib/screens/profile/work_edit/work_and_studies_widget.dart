import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/profile/work_edit/work_and_studies_info.dart';

class WorkAndStudiesWidget extends StatelessWidget {
  const WorkAndStudiesWidget({
    Key key,
    @required this.isWork,
    @required this.user,
  }) : super(key: key);

  final bool isWork;

  final UserInfo user;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(7)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isWork ? 'Work experience' : 'Studies',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5),
                if (isWork && this.user.workExperiences.length > 1)
                  for (int i = 0; i < this.user.workExperiences.length; i++)
                    if (this.user.workExperiences[i].isNotEmpty)
                      WorkAndStudiesInfo(
                          user: user,
                          title: this.user.workExperiences[i][0],
                          place: this.user.workExperiences[i][1],
                          startMonth: this.user.workExperiences[i][2],
                          startYear: this.user.workExperiences[i][3],
                          finalMonth: this.user.workExperiences[i][4],
                          finalYear: this.user.workExperiences[i][5]),
                if (!isWork && this.user.studies.length > 1)
                  for (int i = 0; i < this.user.studies.length; i++)
                    if (this.user.studies[i].isNotEmpty)
                      WorkAndStudiesInfo(
                          user: user,
                          title: this.user.studies[i][0],
                          place: this.user.studies[i][1],
                          startMonth: this.user.studies[i][2],
                          startYear: this.user.studies[i][3],
                          finalMonth: this.user.studies[i][4],
                          finalYear: this.user.studies[i][5]),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    isWork
                        ? Navigator.pushNamed(context, '/editwork')
                        : Navigator.pushNamed(context, '/editstudies');
                    print(user.workExperiences);
                  },
                  child: Text('Edit'))),
        ],
      ),
    );
  }
}