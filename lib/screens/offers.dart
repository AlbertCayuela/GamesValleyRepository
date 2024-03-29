import 'package:flutter/material.dart';
import 'package:games_valley/functions/offers_functions.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/company/company_applicants.dart';
import 'package:provider/provider.dart';

import 'detailed_offer.dart';

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
  bool _workVisible = false;
  bool _countryVisible = false;
  bool _typeVisible = false;

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

  Future _pullRefresh() async {
    var refreshedOffers = await context.read<UserRepository>().getAllOffers();
    setState(() {
      offers = refreshedOffers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
              ListTile(
                title: Text(
                  'Wokrfield',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: !_workVisible
                    ? Icon(Icons.expand_more)
                    : Icon(Icons.expand_less),
                onTap: () {
                  setState(() {
                    _workVisible = !_workVisible;
                  });
                },
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Art and animation',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field, option: 'Art and animation');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Audio and video',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field, option: 'Audio and video');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Communication',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field, option: 'Communication');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Design and creative direction',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field,
                        option: 'Design and creative direction');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title:
                      Text('Finance', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field, option: 'Finance');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Internship',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field, option: 'Internship');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Leadership and executive coordination',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field,
                        option: 'Leadership and executive coordination');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title:
                      Text('Legal', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field, option: 'Legal');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Marketing',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field, option: 'Marketing');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Producing',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field, option: 'Producing');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Programming and technology',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field,
                        option: 'Programming and technology');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Quality management and localization',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field,
                        option: 'Quality Management and localization');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title: Text('Sales and monetization',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field,
                        option: 'Sales and monetization');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _workVisible,
                child: ListTile(
                  title:
                      Text('Other', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.field, option: 'Other');
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Country',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: !_countryVisible
                    ? Icon(Icons.expand_more)
                    : Icon(Icons.expand_less),
                onTap: () {
                  setState(() {
                    _countryVisible = !_countryVisible;
                  });
                },
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Remote', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Remote');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Algeria', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Algeria');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Armenia', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Armenia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Argentina',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Argentina');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Australia',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Australia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Austria', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Austria');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Azerbaijan',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Azerbaijan');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Bahrain', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Bahrain');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Bangladesh',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Bangladesh');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Belarus', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Belarus');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Belgium', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Belgium');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Bosnia And Herzegovina',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country,
                        option: 'Bosnia And Herzegovina');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Brazil', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Brazil');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Bulgaria',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Bulgaria');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Cameroon',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Cameroon');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Canada', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Canada');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Cayman Islands',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Cayman Islands');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Chile', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Chile');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('China', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'China');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Colombia',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Colombia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Costa Rica',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Costa Rica');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Croacia', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Croacia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Cyprus', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Cyprus');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Czech Republic',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Czech Republic');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Denmark', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Denmark');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Ecuador', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Ecuador');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Egypt', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Egypt');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('El Salvador',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'El Salvador');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('England', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'England');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Estonia', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Estonia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Finland', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Finland');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('France', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'France');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Georgia', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Georgia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Germany', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Germany');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Ghana', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Ghana');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Greece', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Greece');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Guatemala',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Guatemala');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Hungary', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Hungary');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Iceland', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Iceland');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('India', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'India');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Indonesia',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Indonesia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Iran', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Iran');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Iraq', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Iraq');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Ireland', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Ireland');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Israel', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Israel');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Italy', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Italy');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Japan', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Japan');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Jordan', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Jordan');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Kuwait', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Kuwait');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Latvia', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Latvia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Lebanon', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Lebanon');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Libya', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Libya');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Lietchenstein',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Lietchenstein');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Lithuania',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Lithuania');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Luxembourg',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Luxembourg');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Macedonia',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Macedonia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Malaysia',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Malaysia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Malta', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Malta');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Mexico', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Mexico');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Moldova', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Moldova');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Morocco', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Morocco');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Myanmar', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Myanmar');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Netherlands',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Netherlands');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('New Zealand',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'New Zealand');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Nigeria', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Nigeria');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Northern Ireland',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Northern Ireland');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Norway', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Norway');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Pakistan',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Pakistan');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Paraguay',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Paraguay');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Peru', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Peru');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Philippines',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Philippines');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Poland', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Poland');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Portugal',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Portugal');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Qatar', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Qatar');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Romania', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Romania');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Russia', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Russia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Saudi Arabia',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Saudi Arabia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Scotland',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Scotland');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Serbia', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Serbia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Singapore',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Singapore');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Slovakia',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Slovakia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Slovenia',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Slovenia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('South Africa',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'South Africa');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('South Korea',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'South Korea');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Spain', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Spain');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Sri Lanka',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Sri Lanka');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Sweden', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Sweden');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Switzerland',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Switzerland');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Syria', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Syria');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Taiwan', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Taiwan');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Thailand',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Thailand');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Tunisia', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Tunisia');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Turkey', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Turkey');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Ukraine', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Ukraine');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('United Arab Emirates',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country,
                        option: 'United Arab Emirates');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('United States',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'United States');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Uruguay', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Uruguay');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title: Text('Venezuela',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Venezuela');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Vietnam', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Vietnam');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _countryVisible,
                child: ListTile(
                  title:
                      Text('Wales', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.country, option: 'Wales');
                    Navigator.pop(context);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Type',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: !_typeVisible
                    ? Icon(Icons.expand_more)
                    : Icon(Icons.expand_less),
                onTap: () {
                  setState(() {
                    _typeVisible = !_typeVisible;
                  });
                },
              ),
              Visibility(
                visible: _typeVisible,
                child: ListTile(
                  title: Text('Full time',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.type, option: 'Full time');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _typeVisible,
                child: ListTile(
                  title: Text('Part time',
                      style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.type, option: 'Part time');
                    Navigator.pop(context);
                  },
                ),
              ),
              Visibility(
                visible: _typeVisible,
                child: ListTile(
                  title:
                      Text('Other', style: TextStyle(color: Colors.blueGrey)),
                  onTap: () {
                    filterOffers(Filter.type, option: 'Other');
                    Navigator.pop(context);
                  },
                ),
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
              return RefreshIndicator(
                onRefresh: _pullRefresh,
                child: ListView.builder(
                  itemCount: filteredOffers.length,
                  itemBuilder: (context, index) {
                    return Offer(
                      timestamp: filteredOffers[index][0],
                      company: filteredOffers[index][1],
                      companyDescription: filteredOffers[index][2],
                      imageURL: filteredOffers[index][3],
                      title: filteredOffers[index][4],
                      location: filteredOffers[index][5],
                      field: filteredOffers[index][6],
                      salary: filteredOffers[index][7],
                      type: filteredOffers[index][8],
                      requirements: filteredOffers[index][9],
                      workerDuties: filteredOffers[index][10],
                      extraInformation: filteredOffers[index][11],
                      uuid: filteredOffers[index][12],
                      money: filteredOffers[index][14],
                    );
                  },
                ),
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
  final String title,
      location,
      company,
      imageURL,
      money,
      salary,
      field,
      timestamp,
      companyDescription,
      type,
      requirements,
      workerDuties,
      extraInformation,
      uuid;
  final int index;
  Offer({
    this.timestamp = '',
    this.company = 'unknown',
    this.companyDescription = '',
    this.imageURL = '',
    this.title = 'unknown',
    this.location = 'unknown',
    this.field = '',
    this.salary = 'Salary not available',
    this.type = '',
    this.requirements = '',
    this.workerDuties = '',
    this.extraInformation = '',
    this.uuid = '',
    this.money = '',
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('offer tapped!!!');
        print(this.uuid);

        context.read<UserRepository>().getIsCompany().then((value) {
          if (value == false) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailedOfferScreen(
                          offer: [
                            this.timestamp,
                            this.company,
                            this.companyDescription,
                            this.imageURL,
                            this.title,
                            this.location,
                            this.field,
                            this.salary,
                            this.type,
                            this.requirements,
                            this.workerDuties,
                            this.extraInformation,
                            this.uuid,
                            this.money,
                          ],
                        )));
          } else if (value == true) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CompanyApplicantsScreen(this.uuid, this.index)));
          }
        });
      },
      child: Card(
        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                child: this.imageURL == null || this.imageURL == ''
                    ? Icon(Icons.person)
                    : null,
                backgroundImage: this.imageURL == null || this.imageURL == ''
                    ? null
                    : NetworkImage(this.imageURL),
                radius: 35,
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
                      Text(
                        this.field,
                        style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                        textAlign: TextAlign.end,
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
                              salary != ''
                                  ? Text('$salary $money / year',
                                      style: TextStyle(color: Colors.blueGrey))
                                  : Text(
                                      'Salary not available',
                                      style: TextStyle(color: Colors.blueGrey),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
