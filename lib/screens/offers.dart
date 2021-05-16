import 'package:flutter/material.dart';
import 'package:games_valley/functions/offers_functions.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

enum Filter { field, country, type, delete }

class _OffersScreenState extends State<OffersScreen> {
  List filteredOffers;
  List offers;
  ScrollController _scrollController = ScrollController();

  bool initialFilter = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    filteredOffers = [];
    offers = [];
  }

  void filterOffers(Filter filterType, {String option}) {
    int filter;

    bool isDelete = false;

    switch (filterType) {
      case Filter.field:
        filter = 6;
        break;
      case Filter.country:
        filter = 5;
        break;
      case Filter.type:
        filter = 8;
        break;
      case Filter.delete:
        isDelete = true;
    }
    if (!isDelete) {
      setState(() {
        filteredOffers =
            offers.where((element) => (element[filter] == option)).toList();
        print('FILTERED OFFERS:');
        print(filteredOffers);
      });
    } else {
      setState(() {
        filteredOffers = offers;
      });
    }
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
                padding: const EdgeInsets.only(left: 16, top: 10),
                child: Text(
                  'Filter offers',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              ListTile(
                title: Text('Delete filter',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.delete);
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Workfield',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text('Art and animation',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Art and animation');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Audio and video',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Audio and video');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Communication',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Communication');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Design and creative direction',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field,
                      option: 'Design and creative direction');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Finance', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Finance');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Internship',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Internship');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Leadership and executive coordination',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field,
                      option: 'Leadership and executive coordination');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Legal', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Legal');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Marketing', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Marketing');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Producing', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Producing');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Programming and technology',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field,
                      option: 'Programming and technology');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Quality management and localization',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field,
                      option: 'Quality Management and localization');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sales and monetization',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Sales and monetization');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Other', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  filterOffers(Filter.field, option: 'Other');
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Country',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text('Remote', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Algeria', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Armenia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Argentina', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Australia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Austria', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Azerbaijan',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Bahrain', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Bangladesh',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Belarus', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Belgium', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Bosnia And Herzegovina',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Brazil', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Austria', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Bulgaria', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Cameroon', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Canada', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Cayman Islands',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Chile', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('China', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Colombia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Costa Rica',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Croacia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Cyprus', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Czech Republic',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Denmark', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Ecuador', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Egypt', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('El Salvador',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('England', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Estonia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Finland', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('France', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Georgia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Germany', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Ghana', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Greece', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Guatemala', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Hungary', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Iceland', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('India', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Indonesia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Iran', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Iraq', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Ireland', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Israel', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Italy', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Japan', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Jordan', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Kuwait', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Latvia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Lebanon', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Libya', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Lietchenstein',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Lithuania', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Luxembourg',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Macedonia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Malaysia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Malta', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Mexico', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Moldova', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Morocco', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Myanmar', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Netherlands',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('New Zealand',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Nigeria', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Northern Ireland',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Norway', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Pakistan', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Paraguay', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Peru', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Philippines',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Poland', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Portugal', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Qatar', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Romania', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Russia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Saudi Arabia',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Scotland', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Serbia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Singapore', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Slovakia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Slovenia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('South Africa',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('South Korea',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Spain', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Sri Lanka', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Sweden', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Switzerland',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Syria', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Taiwan', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Thailand', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Tunisia', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Turkey', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Ukraine', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('United Arab Emirates',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('United States',
                    style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Uruguay', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Venezuela', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Vietnam', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Wales', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Type',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title:
                    Text('Full time', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title:
                    Text('Part time', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Other', style: TextStyle(color: Colors.blueGrey)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder(
          future: context.read<UserRepository>().getAllOffers().then((value) {
            offers = value;
            if (!initialFilter) {
              filteredOffers = offers;
              initialFilter = true;
            }
            return offers;
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: filteredOffers.length,
                itemBuilder: (context, index) {
                  return Offer(
                    company: filteredOffers[index][1],
                    imageURL: filteredOffers[index][3],
                    title: filteredOffers[index][4],
                    location: filteredOffers[index][5],
                    field: filteredOffers[index][6],
                    salary: filteredOffers[index][7],
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
