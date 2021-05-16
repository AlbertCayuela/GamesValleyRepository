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
                  timestamp: snapshot.data[i][0],
                  company: snapshot.data[i][1],
                  companyDescription: snapshot.data[i][2],
                  imageURL: snapshot.data[i][3],
                  title: snapshot.data[i][4],
                  location: snapshot.data[i][5],
                  salary: snapshot.data[i][7],
                  type: snapshot.data[i][8],
                  requirements: snapshot.data[i][9],
                  workerDuties: snapshot.data[i][10],
                  extraInformation: snapshot.data[i][11],
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
