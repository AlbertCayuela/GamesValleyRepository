import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class CompanyProfileScreen extends StatefulWidget {
  @override
  _CompanyProfileScreenState createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  CompanyInfo company;
  bool _loading;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loading = true;
    context.read<UserRepository>().getCompanyInfo().then((value) {
      company = value;
      setState(() {
        _loading = false;
      });
      print(company);
    });
  }

  updateCompany() {
    print('calling updateuser function!');
    setState(() {
      _loading = true;
    });
    context.read<UserRepository>().getCompanyInfo().then((value) {
      company = value;
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(child: CircularProgressIndicator());
    } else
      return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.person,
                            size: 45), //todo need to do all the logic yet
                        backgroundImage: null, //todo get image
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.perm_identity,
                                    color: Colors.blueGrey),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    company.name,
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.email_outlined,
                                    color: Colors.blueGrey),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    company.email,
                                    style: TextStyle(
                                        color: Colors.blueGrey, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/companyeditprofile')
                              .then((_) {
                            updateCompany();
                          });
                        },
                        child: Text('Edit Profile'),
                      ),
                    ]),
                  ),
                ),
                //Company description
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Company Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(company.description)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {}, child: Text('Create a job offer')),
              ],
            ),
          ),
        ),
      );
  }
}
