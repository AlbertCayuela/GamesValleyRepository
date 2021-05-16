import 'package:flutter/material.dart';

import 'offers.dart';

class DetailedOfferScreen extends StatelessWidget {
  final offer;
  DetailedOfferScreen({this.offer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text(this.offer[0]),
            Text(this.offer[1]),
            Text(this.offer[2]),
            Text(this.offer[3]),
            Text(this.offer[4]),
          ],
        ),
      ),
    );
  }
}
