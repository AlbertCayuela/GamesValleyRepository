import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/profile/main_info_edit/main_info_edit.dart';

class MainInfoWidget extends StatelessWidget {
  const MainInfoWidget({
    Key key,
    @required this.user,
    @required this.updateUser,
  }) : super(key: key);

  final UserInformation user;
  final Function updateUser;

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditMainInfoScreen(
                                    user: this.user,
                                  ))).then((_) {
                        updateUser();
                      });
                    },
                    child: Text('Edit'),
                  ),
                ),
                CircleAvatar(
                  radius: 40,
                  child: (this.user.profileImageUrl == '')
                      ? Icon(Icons.person, size: 45)
                      : null,
                  backgroundImage: (this.user.profileImageUrl != '')
                      ? NetworkImage(this.user.profileImageUrl)
                      : null,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (this.user.name == '') ? 'Name' : this.user.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      (this.user.surname == '')
                          ? ' Surname'
                          : ' ' + this.user.surname,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 5),
                    Text(
                      (this.user.phone == '')
                          ? 'Phone number'
                          : this.user.phone,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.grading,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(width: 5),
                    Text(
                      (this.user.cvUrl == '')
                          ? 'CV not uploaded'
                          : 'CV uploaded',
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
