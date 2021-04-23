import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserInfo user;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;

    context.read<UserRepository>().getUserInfo().then((value) {
      user = value;
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ProfileScreenWidget(user: user);
    }
  }
}

class ProfileScreenWidget extends StatelessWidget {
  const ProfileScreenWidget({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserInfo user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  MainInfoWidget(user: user),
                  SizedBox(height: 8),
                  WorkAndStudiesWidget(
                    user: user,
                    isWork: true,
                  ),
                  SizedBox(height: 8),
                  WorkAndStudiesWidget(
                    user: user,
                    isWork: false,
                  ),
                  SizedBox(height: 8),
                  Container(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
                  for (int i = 1; i < this.user.workExperiences.length; i++)
                    WorkAndStudiesInfo(
                        user: user,
                        title: this.user.workExperiences[i][0],
                        place: this.user.workExperiences[i][1],
                        startMonth: this.user.workExperiences[i][2],
                        startYear: this.user.workExperiences[i][3],
                        finalMonth: this.user.workExperiences[i][4],
                        finalYear: this.user.workExperiences[i][5]),
                //is studies ?
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {
                    isWork
                        ? Navigator.popAndPushNamed(
                            context,
                            '/editwork',
                          )
                        : null;
                    print(user.workExperiences);
                  },
                  child: Text('Edit'))),
        ],
      ),
    );
  }
}

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

class MainInfoWidget extends StatelessWidget {
  const MainInfoWidget({
    Key key,
    @required this.user,
  }) : super(key: key);

  final UserInfo user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://media.redadn.es/imagenes/otros-aticulos_308786.jpg'),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Margarita Robles',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.perm_identity,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 5),
                    Text(
                      user.username,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        user.email,
                        style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '+34 666 66 66 666666 66666 6666666',
                        style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                      ),
                    ),
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
          ),
        ],
      ),
    );
  }
}
