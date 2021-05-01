import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class CompanyProfileEdit extends StatefulWidget {
  @override
  _CompanyProfileEditState createState() => _CompanyProfileEditState();
}

class _CompanyProfileEditState extends State<CompanyProfileEdit> {
  String imageUrl;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imageUrl = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit your profile',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                child: (imageUrl == '') ? Icon(Icons.person, size: 45) : null,
                radius: 50,
                backgroundImage:
                    (imageUrl == '') ? null : NetworkImage(imageUrl),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<UserRepository>()
                      .pickImageAndUpload()
                      .then((value) {
                    setState(() {
                      imageUrl = value;
                    });
                  });
                },
                child: Text('Edit profile image'),
              ),
              SizedBox(height: 10),
              TextFormField(
                // controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Company name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: null,
                // controller: _surnameController,
                decoration: InputDecoration(
                  labelText: 'Company description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {}, child: Text('Edit information')),
            ],
          ),
        ),
      ),
    );
  }
}
