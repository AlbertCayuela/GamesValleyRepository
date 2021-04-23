import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/profile/work_and_studies_widget.dart';
import 'package:provider/provider.dart';

import 'main_info.dart';

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
