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
      body: Column(
        children: [
          Text(context.read<UserRepository>().getUserEmail()),
          RaisedButton(
            onPressed: () {
              context.read<UserRepository>().singOut();
              Navigator.popAndPushNamed(context, '/authwrapper');
            },
            child: Text('Sing out'),
          ),
          Text(user.username),
          Text(user.uid),
          Text(user.email),
        ],
      ),
    );
  }
}
