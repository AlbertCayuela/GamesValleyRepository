import 'package:flutter/material.dart';

class CompanyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
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
              ),
              //Company description
              Padding(
                padding: const EdgeInsets.all(4),
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Company Description',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse non consequat elit. Nam neque ante, eleifend vel elit eu, luctus interdum magna. Proin consequat, enim et faucibus eleifend, ex ipsum mollis mauris, et laoreet ex purus sit amet lacus. Cras tristique erat eros, quis commodo ipsum semper sit amet. Fusce eros leo, ultrices at massa in, sagittis bibendum quam. Integer dapibus odio nunc, at sagittis mi luctus eu. Quisque scelerisque porta lectus, vitae facilisis nisl vehicula sit amet. Vivamus euismod malesuada nunc, a vestibulum quam consequat eleifend. Quisque sodales eros orci, malesuada malesuada dui consequat suscipit.')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {}, child: Text('Create a job offer')),
            ],
          ),
        ),
      ),
    );
  }
}
