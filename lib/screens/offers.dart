import 'package:flutter/material.dart';
import 'package:games_valley/functions/offers_functions.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List filteredOffers;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    filteredOffers = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'GamesValley',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Filter offers'),
              ),
              ListTile(
                title: Text('Art and animation',
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Audio and video',
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Communication',
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Design and creative direction',
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title:
                    Text('Finance', style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Internship',
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Leadership and executive coordination',
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Legal', style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title:
                    Text('Marketing', style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title:
                    Text('Producing', style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Programming and technology',
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Quality management and localization',
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Sales and monetization',
                    style: TextStyle(color: Colors.blueGrey)),
              ),
              ListTile(
                title: Text('Other', style: TextStyle(color: Colors.blueGrey)),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: context.read<UserRepository>().getAllOffers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Offer(
                    company: snapshot.data[index][1],
                    imageURL: snapshot.data[index][3],
                    title: snapshot.data[index][4],
                    location: snapshot.data[index][5],
                    field: snapshot.data[index][6],
                    salary: snapshot.data[index][7],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('There was an error collecting the data');
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class Offer extends StatelessWidget {
  final String title, location, company, imageURL, money, salary, field;

  Offer(
      {this.title = 'unknown',
      this.location = 'unknown',
      this.company = 'unknown',
      this.salary = 'Salary not available',
      this.imageURL,
      this.money = '€',
      this.field});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: this.imageURL == null || this.imageURL == ''
                  ? null
                  : NetworkImage(this.imageURL),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          this.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.deepPurple),
                        ),
                        Expanded(
                          child: Text(
                            this.field,
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 12),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    Text(this.company),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.place,
                              color: Colors.blueGrey,
                              size: 17,
                            ),
                            Text(
                              this.location,
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              color: Colors.blueGrey,
                              size: 17,
                            ),
                            Text(salary + '/year',
                                style: TextStyle(color: Colors.blueGrey)),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
