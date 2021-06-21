import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:validators/validators.dart';
import 'package:provider/provider.dart';

class CreateOfferScreen extends StatefulWidget {
  @override
  _CreateOfferScreenState createState() => _CreateOfferScreenState();
}

class _CreateOfferScreenState extends State<CreateOfferScreen> {
  String country;
  String workField;
  String type;
  String currency;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _salaryController = TextEditingController();
  TextEditingController _requirementsController = TextEditingController();
  TextEditingController _workerDutiesController = TextEditingController();
  TextEditingController _extraInformationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create a new job offer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title (Ex.: Lead programmer)*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This field must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                      value: country,
                      isExpanded: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select the country';
                        }
                        return null;
                      },
                      hint: Text('Country*'),
                      onChanged: (value) {
                        setState(() {
                          country = value;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text('Remote'),
                          value: 'Remote',
                        ),
                        DropdownMenuItem(
                          child: Text('Algeria'),
                          value: 'Algeria',
                        ),
                        DropdownMenuItem(
                          child: Text('Armenia'),
                          value: 'Armenia',
                        ),
                        DropdownMenuItem(
                          child: Text('Argentina'),
                          value: 'Argentina',
                        ),
                        DropdownMenuItem(
                          child: Text('Australia‎'),
                          value: 'Australia‎',
                        ),
                        DropdownMenuItem(
                          child: Text('Austria'),
                          value: 'Austria',
                        ),
                        DropdownMenuItem(
                          child: Text('Azerbaijan'),
                          value: 'Azerbaijan',
                        ),
                        DropdownMenuItem(
                          child: Text('Bahrain'),
                          value: 'Bahrain',
                        ),
                        DropdownMenuItem(
                          child: Text('Bangladesh'),
                          value: 'Bangladesh',
                        ),
                        DropdownMenuItem(
                          child: Text('Belarus‎'),
                          value: 'Belarus‎',
                        ),
                        DropdownMenuItem(
                          child: Text('Belgium‎'),
                          value: 'Belgium‎',
                        ),
                        DropdownMenuItem(
                          child: Text('Bosnia And Herzegovina'),
                          value: 'Bosnia And Herzegovina',
                        ),
                        DropdownMenuItem(
                          child: Text('Brazil‎'),
                          value: 'Brazil‎',
                        ),
                        DropdownMenuItem(
                          child: Text('Bulgaria'),
                          value: 'Bulgaria',
                        ),
                        DropdownMenuItem(
                          child: Text('Cameroon'),
                          value: 'Cameroon',
                        ),
                        DropdownMenuItem(
                          child: Text('Canada'),
                          value: 'Canada',
                        ),
                        DropdownMenuItem(
                          child: Text('Cayman Islands'),
                          value: 'Cayman Islands',
                        ),
                        DropdownMenuItem(
                          child: Text('Chile'),
                          value: 'Chile',
                        ),
                        DropdownMenuItem(
                          child: Text('China'),
                          value: 'China',
                        ),
                        DropdownMenuItem(
                          child: Text('Colombia'),
                          value: 'Colombia',
                        ),
                        DropdownMenuItem(
                          child: Text('Costa Rica'),
                          value: 'Costa Rica',
                        ),
                        DropdownMenuItem(
                          child: Text('Croacia'),
                          value: 'Croacia',
                        ),
                        DropdownMenuItem(
                          child: Text('Cyprus'),
                          value: 'Cyprus',
                        ),
                        DropdownMenuItem(
                          child: Text('Czech Republic'),
                          value: 'Czech Republic',
                        ),
                        DropdownMenuItem(
                          child: Text('Denmark'),
                          value: 'Denmark',
                        ),
                        DropdownMenuItem(
                          child: Text('Ecuador'),
                          value: 'Ecuador',
                        ),
                        DropdownMenuItem(
                          child: Text('Egypt'),
                          value: 'Egypt',
                        ),
                        DropdownMenuItem(
                          child: Text('El Salvador'),
                          value: 'El Salvador',
                        ),
                        DropdownMenuItem(
                          child: Text('England'),
                          value: 'England',
                        ),
                        DropdownMenuItem(
                          child: Text('Estonia'),
                          value: 'Estonia',
                        ),
                        DropdownMenuItem(
                          child: Text('Finland'),
                          value: 'Finland',
                        ),
                        DropdownMenuItem(
                          child: Text('France'),
                          value: 'France',
                        ),
                        DropdownMenuItem(
                          child: Text('Georgia'),
                          value: 'Georgia',
                        ),
                        DropdownMenuItem(
                          child: Text('Germany'),
                          value: 'Germany',
                        ),
                        DropdownMenuItem(
                          child: Text('Ghana'),
                          value: 'Ghana',
                        ),
                        DropdownMenuItem(
                          child: Text('Greece'),
                          value: 'Greece',
                        ),
                        DropdownMenuItem(
                          child: Text('Guatemala'),
                          value: 'Guatemala',
                        ),
                        DropdownMenuItem(
                          child: Text('Hungary'),
                          value: 'Hungary',
                        ),
                        DropdownMenuItem(
                          child: Text('Iceland'),
                          value: 'Iceland',
                        ),
                        DropdownMenuItem(
                          child: Text('India'),
                          value: 'India',
                        ),
                        DropdownMenuItem(
                          child: Text('Indonesia'),
                          value: 'Indonesia',
                        ),
                        DropdownMenuItem(
                          child: Text('Iran'),
                          value: 'Iran',
                        ),
                        DropdownMenuItem(
                          child: Text('Iraq'),
                          value: 'Iraq',
                        ),
                        DropdownMenuItem(
                          child: Text('Ireland'),
                          value: 'Ireland',
                        ),
                        DropdownMenuItem(
                          child: Text('Israel'),
                          value: 'Israel',
                        ),
                        DropdownMenuItem(
                          child: Text('Italy'),
                          value: 'Italy',
                        ),
                        DropdownMenuItem(
                          child: Text('Japan'),
                          value: 'Japan',
                        ),
                        DropdownMenuItem(
                          child: Text('Jordan'),
                          value: 'Jordan',
                        ),
                        DropdownMenuItem(
                          child: Text('Kuwait'),
                          value: 'Kuwait',
                        ),
                        DropdownMenuItem(
                          child: Text('Latvia'),
                          value: 'Latvia',
                        ),
                        DropdownMenuItem(
                          child: Text('Lebanon'),
                          value: 'Lebanon',
                        ),
                        DropdownMenuItem(
                          child: Text('Libya'),
                          value: 'Libya',
                        ),
                        DropdownMenuItem(
                          child: Text('Liechtenstein'),
                          value: 'Liechtenstein',
                        ),
                        DropdownMenuItem(
                          child: Text('Lithuania'),
                          value: 'Lithuania',
                        ),
                        DropdownMenuItem(
                          child: Text('Luxembourg'),
                          value: 'Luxembourg',
                        ),
                        DropdownMenuItem(
                          child: Text('Macedonia'),
                          value: 'Macedonia',
                        ),
                        DropdownMenuItem(
                          child: Text('Malaysia'),
                          value: 'Malaysia',
                        ),
                        DropdownMenuItem(
                          child: Text('Malta'),
                          value: 'Malta',
                        ),
                        DropdownMenuItem(
                          child: Text('Mexico'),
                          value: 'Mexico',
                        ),
                        DropdownMenuItem(
                          child: Text('Moldova'),
                          value: 'Moldova',
                        ),
                        DropdownMenuItem(
                          child: Text('Morocco'),
                          value: 'Morocco',
                        ),
                        DropdownMenuItem(
                          child: Text('Myanmar'),
                          value: 'Myanmar',
                        ),
                        DropdownMenuItem(
                          child: Text('Netherlands'),
                          value: 'Netherlands',
                        ),
                        DropdownMenuItem(
                          child: Text('New Zealand'),
                          value: 'New Zealand',
                        ),
                        DropdownMenuItem(
                          child: Text('Nigeria'),
                          value: 'Nigeria',
                        ),
                        DropdownMenuItem(
                          child: Text('Northern Ireland'),
                          value: 'Northern Ireland',
                        ),
                        DropdownMenuItem(
                          child: Text('Norway'),
                          value: 'Norway',
                        ),
                        DropdownMenuItem(
                          child: Text('Pakistan'),
                          value: 'Pakistan',
                        ),
                        DropdownMenuItem(
                          child: Text('Paraguay'),
                          value: 'Paraguay',
                        ),
                        DropdownMenuItem(
                          child: Text('Peru'),
                          value: 'Peru',
                        ),
                        DropdownMenuItem(
                          child: Text('Philippines'),
                          value: 'Philipinnes',
                        ),
                        DropdownMenuItem(
                          child: Text('Poland'),
                          value: 'Poland',
                        ),
                        DropdownMenuItem(
                          child: Text('Portugal'),
                          value: 'Portugal',
                        ),
                        DropdownMenuItem(
                          child: Text('Qatar'),
                          value: 'Qatar',
                        ),
                        DropdownMenuItem(
                          child: Text('Romania'),
                          value: 'Romania',
                        ),
                        DropdownMenuItem(
                          child: Text('Russia'),
                          value: 'Russia',
                        ),
                        DropdownMenuItem(
                          child: Text('Saudi Arabia'),
                          value: 'Saudi Arabia',
                        ),
                        DropdownMenuItem(
                          child: Text('Scotland'),
                          value: 'Scotland',
                        ),
                        DropdownMenuItem(
                          child: Text('Serbia'),
                          value: 'Serbia',
                        ),
                        DropdownMenuItem(
                          child: Text('Singapore'),
                          value: 'Singapore',
                        ),
                        DropdownMenuItem(
                          child: Text('Slovakia'),
                          value: 'Slovakia',
                        ),
                        DropdownMenuItem(
                          child: Text('Slovenia'),
                          value: 'Slovenia',
                        ),
                        DropdownMenuItem(
                          child: Text('South Africa'),
                          value: 'South Africa',
                        ),
                        DropdownMenuItem(
                          child: Text('South Korea'),
                          value: 'South Korea',
                        ),
                        DropdownMenuItem(
                          child: Text('Spain'),
                          value: 'Spain',
                        ),
                        DropdownMenuItem(
                          child: Text('Sri Lanka'),
                          value: 'Sri Lanka',
                        ),
                        DropdownMenuItem(
                          child: Text('Sweden'),
                          value: 'Sweden',
                        ),
                        DropdownMenuItem(
                          child: Text('Switzerland'),
                          value: 'Switzerland',
                        ),
                        DropdownMenuItem(
                          child: Text('Syria'),
                          value: 'Syria',
                        ),
                        DropdownMenuItem(
                          child: Text('Taiwan'),
                          value: 'Taiwan',
                        ),
                        DropdownMenuItem(
                          child: Text('Thailand'),
                          value: 'Thailand',
                        ),
                        DropdownMenuItem(
                          child: Text('Tunisia'),
                          value: 'Tunisia',
                        ),
                        DropdownMenuItem(
                          child: Text('Turkey'),
                          value: 'Turkey',
                        ),
                        DropdownMenuItem(
                          child: Text('Ukraine'),
                          value: 'Ukraine',
                        ),
                        DropdownMenuItem(
                          child: Text('United Arab Emirates'),
                          value: 'United Arab Emirates',
                        ),
                        DropdownMenuItem(
                          child: Text('United States'),
                          value: 'United States',
                        ),
                        DropdownMenuItem(
                          child: Text('Uruguay'),
                          value: 'Uruguay',
                        ),
                        DropdownMenuItem(
                          child: Text('Venezuela'),
                          value: 'Venezuela',
                        ),
                        DropdownMenuItem(
                          child: Text('Vietnam'),
                          value: 'Vietnam',
                        ),
                        DropdownMenuItem(
                          child: Text('Wales'),
                          value: 'Wales',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                      isExpanded: true,
                      value: workField,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select the work field';
                        }
                        return null;
                      },
                      hint: Text('Work field*'),
                      items: [
                        DropdownMenuItem(
                          child: Text('Art and animation'),
                          value: 'Art and animation',
                        ),
                        DropdownMenuItem(
                          child: Text('Programming and technology'),
                          value: 'Programming and technology',
                        ),
                        DropdownMenuItem(
                          child: Text('Design and creative direction'),
                          value: 'Design and creative direction',
                        ),
                        DropdownMenuItem(
                          child: Text('Marketing'),
                          value: 'Marketing',
                        ),
                        DropdownMenuItem(
                          child: Text('Quality Management and localization'),
                          value: 'Quality Management and localization',
                        ),
                        DropdownMenuItem(
                          child: Text('Producing'),
                          value: 'Producing',
                        ),
                        DropdownMenuItem(
                          child: Text('Finance'),
                          value: 'Finance',
                        ),
                        DropdownMenuItem(
                          child: Text('Audio and video'),
                          value: 'Audio and video',
                        ),
                        DropdownMenuItem(
                          child: Text('Communication'),
                          value: 'Communication',
                        ),
                        DropdownMenuItem(
                          child: Text('Legal'),
                          value: 'Legal',
                        ),
                        DropdownMenuItem(
                          child: Text('Leadership and executive coordination'),
                          value: 'Leadership and executive coordination',
                        ),
                        DropdownMenuItem(
                          child: Text('Sales and monetization'),
                          value: 'Sales and monetization',
                        ),
                        DropdownMenuItem(
                          child: Text('Internship'),
                          value: 'Internship',
                        ),
                        DropdownMenuItem(
                          child: Text('Other'),
                          value: 'Other',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          workField = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _salaryController,
                      decoration: InputDecoration(
                        labelText: 'Annual salary',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value.isNotEmpty && !isNumeric(value)) {
                          return 'The value must be a number';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                      isExpanded: true,
                      value: currency,
                      validator: (value) {
                        if (_salaryController.text.isNotEmpty &&
                            value == null) {
                          return 'Plese select a currency';
                        }
                        return null;
                      },
                      hint: Text('Currency'),
                      items: [
                        DropdownMenuItem(
                          child: Text('USD'),
                          value: 'USD',
                        ),
                        DropdownMenuItem(
                          child: Text('EUR'),
                          value: 'EUR',
                        ),
                        DropdownMenuItem(
                          child: Text('GBP'),
                          value: 'GBP',
                        ),
                        DropdownMenuItem(
                          child: Text('AUD'),
                          value: 'AUD',
                        ),
                        DropdownMenuItem(
                          child: Text('CAD'),
                          value: 'CAD',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          currency = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    DropdownButtonFormField(
                      isExpanded: true,
                      value: type,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select your language level';
                        }
                        return null;
                      },
                      hint: Text('Type*'),
                      items: [
                        DropdownMenuItem(
                          child: Text('Full time'),
                          value: 'Full time',
                        ),
                        DropdownMenuItem(
                          child: Text('Part time'),
                          value: 'Part time',
                        ),
                        DropdownMenuItem(
                          child: Text('Other'),
                          value: 'Other',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          type = value;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      maxLines: null,
                      controller: _requirementsController,
                      decoration: InputDecoration(
                        labelText: 'Requirements*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'This field must not be empty';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      maxLines: null,
                      controller: _workerDutiesController,
                      decoration: InputDecoration(
                        //icon: Icon(Icons.mail),
                        labelText: 'Worker duties*',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'The value must not be empty';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      maxLines: null,
                      controller: _extraInformationController,
                      decoration: InputDecoration(
                        labelText: 'Extra information',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            print('everything is fine in this offer!');
                            await context
                                .read<UserRepository>()
                                .createJobOffer(
                                  title: _titleController.text,
                                  country: country,
                                  workField: workField,
                                  type: type,
                                  requirements: _requirementsController.text,
                                  workerDuties: _workerDutiesController.text,
                                  annualSalary: _salaryController.text,
                                  extraInformation:
                                      _extraInformationController.text,
                                  currency: currency,
                                )
                                .then((_) {
                              Navigator.pop(context);
                            });
                          } else {
                            print('Something is wrong in this offer!');
                          }
                        },
                        child: Text('Create offer')),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
