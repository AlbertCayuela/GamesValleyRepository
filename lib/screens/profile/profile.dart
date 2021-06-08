import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/profile/work_edit/work_and_studies_widget.dart';
import 'package:provider/provider.dart';

import 'languages_edit/languages_widget.dart';
import 'main_info_edit/main_info.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserInformation user;
  bool _loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;

    context
        .read<UserRepository>()
        .getUserInfo(FirebaseAuth.instance.currentUser.uid)
        .then((value) {
      user = value;
      setState(() {
        _loading = false;
      });
    });
  }

  updateUser() {
    print('calling updateuser function!');
    setState(() {
      _loading = true;
    });
    context
        .read<UserRepository>()
        .getUserInfo(FirebaseAuth.instance.currentUser.uid)
        .then((value) {
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
      return ProfileScreenWidget(user: user, updateUser: updateUser);
    }
  }
}

class ProfileScreenWidget extends StatefulWidget {
  final UserInformation user;
  final Function updateUser;

  const ProfileScreenWidget({
    Key key,
    @required this.user,
    @required this.updateUser,
  }) : super(key: key);

  @override
  _ProfileScreenWidgetState createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                  child: Text('Sign out'),
                  onPressed: () {
                    context.read<UserRepository>().singOut();
                  })),
        )),
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
              child: Column(
                children: [
                  MainInfoWidget(
                      user: widget.user, updateUser: widget.updateUser),
                  WorkAndStudiesWidget(
                    updateUser: widget.updateUser,
                    user: widget.user,
                    isWork: true,
                  ),
                  WorkAndStudiesWidget(
                    updateUser: widget.updateUser,
                    user: widget.user,
                    isWork: false,
                  ),
                  LanguagesWidget(
                    user: widget.user,
                    updateUser: widget.updateUser,
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
