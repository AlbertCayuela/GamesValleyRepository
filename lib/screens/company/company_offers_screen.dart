import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/offers.dart';
import 'package:provider/provider.dart';

class CompanyOffersScreen extends StatefulWidget {
  @override
  _CompanyOffersScreenState createState() => _CompanyOffersScreenState();
}

class _CompanyOffersScreenState extends State<CompanyOffersScreen> {
  var item;
  var offers;

  void initState() {
    super.initState();
    offers = context.read<UserRepository>().getCompanyOffers();
  }

  Future _pullRefresh() async {
    var refreshedOffers =
        await context.read<UserRepository>().getCompanyOffers();
    setState(() {
      offers = Future.value(refreshedOffers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Create a new job offer'),
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/createjoboffer').then((_) {
              _pullRefresh();
            });
          },
        ),
        body: FutureBuilder(
          future: offers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: _pullRefresh,
                child: ListView.builder(
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
                      uuid: snapshot.data[i][12],
                      money: snapshot.data[i][14],
                      index: i,
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Snapshot has error');
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
