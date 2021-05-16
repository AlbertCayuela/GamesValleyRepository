import 'package:flutter/material.dart';

class DetailedOfferScreen extends StatelessWidget {
  final offer;
  DetailedOfferScreen({this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.approval),
          label: Text('Apply'),
        ),
        body: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
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
                          backgroundImage: offer[3] != null && offer[3] != ''
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
                      Row(
                        children: [
                          Icon(
                            Icons.monetization_on_rounded,
                            color: Colors.blueGrey,
                            size: 17,
                          ),
                          SizedBox(width: 5),
                          Text(
                            offer[7],
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ],
                      ),
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
          ),
        ));
  }
}
