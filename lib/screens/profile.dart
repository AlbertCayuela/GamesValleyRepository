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
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                MainInfoWidget(user: user),
                SizedBox(height: 8),
                WorkExperienceWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WorkExperienceWidget extends StatelessWidget {
  const WorkExperienceWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7)),
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
                  'Work Experience:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(
                  'Gameplay programmer at Ubisoft saodsdklsadkadñakdsñakdñakdñakdñakdñakdañdkañdkañdkañ',
                ),
                SizedBox(height: 10),
                Text(
                  'March 2019 - October 2020',
                  style: TextStyle(
                      color: Colors.blueGrey, fontSize: 12),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () {}, child: Text('Edit'))),
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
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://media.redadn.es/imagenes/otros-aticulos_308786.jpg'),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
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
                  Text(
                    user.email,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 15),
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
                  Text(
                    '+34 666 66 66 66',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
