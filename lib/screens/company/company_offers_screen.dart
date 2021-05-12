import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/offers.dart';
import 'package:provider/provider.dart';

class CompanyOffersScreen extends StatelessWidget {
  var item;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<UserRepository>().getCompanyOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //print(snapshot);
          return Scaffold(
            body: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                print(snapshot.data[i]);
                return Offer(
                  title: snapshot.data[i][0],
                  location: snapshot.data[i][1],
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Snapshot has error');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
