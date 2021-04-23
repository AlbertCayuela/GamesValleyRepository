import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';

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
