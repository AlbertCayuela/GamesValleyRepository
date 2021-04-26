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

  updateUser() {
    print('calling updateuser function!');
    setState(() {
      _loading = true;
    });
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
      return ProfileScreenWidget(user: user, updateUser: updateUser);
    }
  }
}

class ProfileScreenWidget extends StatefulWidget {
  final UserInfo user;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  MainInfoWidget(
                      user: widget.user, updateUser: widget.updateUser),
                  SizedBox(height: 8),
                  WorkAndStudiesWidget(
                    user: widget.user,
                    isWork: true,
                  ),
                  SizedBox(height: 8),
                  WorkAndStudiesWidget(
                    user: widget.user,
                    isWork: false,
                  ),
                  SizedBox(height: 8),
                  LanguagesWidget(
                    user: widget.user,
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
