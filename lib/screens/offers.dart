import 'package:flutter/material.dart';
import 'package:games_valley/functions/offers_functions.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List<Offer> offersList;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    offersList = List.generate(10, (index) => Offer(title: '$index'));
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreOffers(10, offersList);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: offersList.length,
      itemBuilder: (context, index) {
        return offersList[index];
      },
    );
  }
}

class Offer extends StatelessWidget {
  final String title, location, company, imageURL, money;
  final int minSalary, maxSalary;
  Offer(
      {this.title = 'unknown',
      this.location = 'unknown',
      this.company = 'unknown',
      this.minSalary = 0,
      this.maxSalary = 0,
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
                        Text('${this.minSalary} - ${this.maxSalary} $money',
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
