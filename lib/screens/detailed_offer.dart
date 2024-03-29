import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetailedOfferScreen extends StatelessWidget {
  final offer;
  DetailedOfferScreen({this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Text('Choose the way you want to apply:'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Text(
                                        'Do you want to send your information?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<UserRepository>()
                                                .applyToOffer(
                                                    offer[12],
                                                    FirebaseAuth.instance
                                                        .currentUser.uid,
                                                    true)
                                                .then((value) {
                                              if (value == false) {
                                                print('the value is false');
                                                showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Could not apply for this offer, fulfill your basic profile information first.'),
                                                            actions: [
                                                              TextButton(
                                                                child:
                                                                    Text('OK'),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              )
                                                            ],
                                                          );
                                                        })
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                              } else if (value == true) {
                                                showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'You applied for this offer!'),
                                                            actions: [
                                                              TextButton(
                                                                  child: Text(
                                                                      'OK'),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  })
                                                            ],
                                                          );
                                                        })
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                              }
                                            });
                                          },
                                          child: Text('Yes')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('No')),
                                    ],
                                  );
                                });
                          },
                          child: Text('Apply with your profile information')),
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content:
                                        Text('Do you want to send your CV?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<UserRepository>()
                                                .applyToOffer(
                                                    offer[12],
                                                    FirebaseAuth.instance
                                                        .currentUser.uid,
                                                    false)
                                                .then((value) {
                                              if (value == false) {
                                                showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'Could not apply for this offer, fulfill your basic profile information first.'),
                                                            actions: [
                                                              TextButton(
                                                                  child: Text(
                                                                      'OK'),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  }),
                                                            ],
                                                          );
                                                        })
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                              } else if (value == true) {
                                                showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                'You applied for this offer!'),
                                                            actions: [
                                                              TextButton(
                                                                  child: Text(
                                                                      'OK'),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  })
                                                            ],
                                                          );
                                                        })
                                                    .then((value) =>
                                                        Navigator.pop(context));
                                              }
                                            });
                                          },
                                          child: Text('Yes')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('No')),
                                    ],
                                  );
                                });
                          },
                          child: Text('Apply with your own CV')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')),
                    ],
                  );
                });
          },
          icon: Icon(Icons.approval),
          label: Text('Apply'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flex(direction: Axis.horizontal),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  offer[3] != null && offer[3] != ''
                                      ? NetworkImage(offer[3])
                                      : null,
                            ),
                            Text(offer[4],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                          ],
                        ),
                      ),
                      Text(
                        offer[1],
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.place,
                                color: Colors.blueGrey,
                                size: 17,
                              ),
                              SizedBox(width: 5),
                              Text(
                                offer[5],
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          offer[7] != ''
                              ? Text(
                                  offer[7] + ' ' + offer[13] + ' / year',
                                  style: TextStyle(color: Colors.blueGrey),
                                )
                              : Text('Salary not available',
                                  style: TextStyle(color: Colors.blueGrey)),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                color: Colors.blueGrey,
                                size: 17,
                              ),
                              SizedBox(width: 5),
                              Text(
                                offer[8],
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                      ),
                      Text(
                        'Requierements',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(offer[9]),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                      ),
                      Text(
                        'Worker duties',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(offer[10]),
                    ],
                  ),
                ),
                if (offer[11] != '')
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flex(
                          direction: Axis.horizontal,
                        ),
                        Text(
                          'Extra information',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(offer[11]),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
