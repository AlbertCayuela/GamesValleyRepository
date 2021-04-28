import 'package:flutter/material.dart';

class CompanyProfileEdit extends StatelessWidget {
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
                child: Icon(Icons.person, size: 45),
                radius: 50,
              ),
              ElevatedButton(
                onPressed: () {},
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
