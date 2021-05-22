import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class CompanyApplicantsScreen extends StatelessWidget {
  List<UserInformation> applicants;
  final offerUid;
  CompanyApplicantsScreen(this.offerUid);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context
            .read<UserRepository>()
            .getOfferApplicants(offerUid)
            .then((value) {
          if (value != null) {
            for (int i = 0; i < applicants.length; i++) {
              context
                  .read<UserRepository>()
                  .getUserInfo(value[i][0])
                  .then(((user) {
                applicants.add(user);
              }));
            }
          }
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text('snapshot has data');
          } else if (snapshot.hasError) {
            return Text('There was an error collecting the data');
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
