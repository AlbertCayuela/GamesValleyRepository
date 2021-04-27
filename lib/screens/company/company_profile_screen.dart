import 'package:flutter/material.dart';

class CompanyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Row(children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.person,
                              size: 45), //todo need to do all the logic yet
                          backgroundImage: null, //todo get image
                        ),
                        Row(
                          children: [
                            Icon(Icons.perm_identity, color: Colors.blueGrey),
                            SizedBox(width: 5),
                            Text(
                              'Company name',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.email_outlined, color: Colors.blueGrey),
                            SizedBox(width: 5),
                            Text(
                              'Company email',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
                //Company description
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
