import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/company/company_cv_pdf.dart';
import 'package:provider/provider.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class CompanyApplicantsScreen extends StatelessWidget {
  List applicants = [];
  var initialApplicants = [];
  final offerUid;
  CompanyApplicantsScreen(this.offerUid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Offer applicants',
              style: TextStyle(fontWeight: FontWeight.bold))),
      body: FutureBuilder(
        future: context
            .read<UserRepository>()
            .getOfferApplicants(offerUid)
            .then((value) async {
          initialApplicants = value;
          for (int i = 0; i < value.length; i++) {
            await context
                .read<UserRepository>()
                .getUserInfo(value[i][0])
                .then((result) {
              applicants.add(result);
            });
          }
          return applicants;
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.length);

            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                              snapshot.data[index].profileImageUrl != null &&
                                      snapshot.data[index].profileImageUrl != ''
                                  ? CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          snapshot.data[index].profileImageUrl))
                                  : CircleAvatar(
                                      radius: 30, child: Icon(Icons.person)),
                          title: Text(snapshot.data[index].name +
                              ' ' +
                              snapshot.data[index].surname),
                          subtitle: Text(snapshot.data[index].email),
                          onTap: () async {
                            print(snapshot.data[index].uid);
                            print(initialApplicants);
                            var applicantRef = initialApplicants.firstWhere(
                                (element) =>
                                    element[0] == snapshot.data[index].uid);
                            if (applicantRef[1] == true) {
                              print('this user applied with profile');
                            } else if (applicantRef[1] == false) {
                              print('this user applied with cv');

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CompanyPdfCVScreen(
                                          snapshot.data[index].cvUrl)));
                            }
                          },
                        ),
                      ],
                    ),
                  );
                });
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
