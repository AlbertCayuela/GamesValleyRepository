import 'package:flutter/material.dart';
import 'package:games_valley/functions/offers_functions.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  var offers;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: context.read<UserRepository>().getAllOffers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('Snapshot has data');
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
  final String title, location, company, imageURL, money, salary;

  Offer(
      {this.title = 'unknown',
      this.location = 'unknown',
      this.company = 'unknown',
      this.salary = 'Salary not available',
      this.imageURL =
          'https://media.redadn.es/imagenes/otros-aticulos_308786.jpg',
      this.money = '€'});

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
              backgroundImage: NetworkImage(this.imageURL),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.deepPurple),
                    ),
                    Text(this.company),
                    SizedBox(height: 10),
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
                        SizedBox(width: 20),
                        Icon(
                          Icons.attach_money,
                          color: Colors.blueGrey,
                          size: 17,
                        ),
                        Text(salary + '/year',
                            style: TextStyle(color: Colors.blueGrey)),
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
