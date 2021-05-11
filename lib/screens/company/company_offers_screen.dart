import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class CompanyOffersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<UserRepository>().getCompanyOffers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot);
          return Scaffold();
        } else if (snapshot.hasError) {
          return Text('Snapshot has error');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
