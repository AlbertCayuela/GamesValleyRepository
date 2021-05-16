import 'package:flutter/material.dart';

class DetailedOfferScreen extends StatelessWidget {
  final offer;
  DetailedOfferScreen({this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flex(direction: Axis.horizontal),
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: offer[4] != null && offer[4] != ''
                          ? NetworkImage(offer[4])
                          : null,
                    ),
                    Text(offer[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                  ],
                ),
              ),
              Text(
                offer[2],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.place,
                    color: Colors.blueGrey,
                    size: 17,
                  ),
                  SizedBox(width: 20),
                  Text(
                    offer[1],
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_rounded,
                    color: Colors.blueGrey,
                    size: 17,
                  ),
                  SizedBox(width: 20),
                  Text(
                    offer[3],
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.monetization_on_rounded,
                    color: Colors.blueGrey,
                    size: 17,
                  ),
                  SizedBox(width: 20),
                  Text(
                    offer[3],
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
