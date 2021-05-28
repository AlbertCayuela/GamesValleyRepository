import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class CompanyProfileEdit extends StatefulWidget {
  String imageUrl;

  CompanyProfileEdit({Key key, @required this.imageUrl}) : super(key: key);
  @override
  _CompanyProfileEditState createState() => _CompanyProfileEditState();
}

class _CompanyProfileEditState extends State<CompanyProfileEdit> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit your profile',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                child: (widget.imageUrl == '')
                    ? Icon(Icons.person, size: 45)
                    : null,
                radius: 50,
                backgroundImage: (widget.imageUrl == '')
                    ? null
                    : NetworkImage(widget.imageUrl),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<UserRepository>()
                      .pickImageAndUpload()
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        widget.imageUrl = value;
                      });
                    }
                  });
                },
                child: Text('Edit profile image'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Company name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                maxLines: null,
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Company description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    print('pressed editing company info button!');
                    if (_nameController.text != '') {
                      print('changing company name!');
                      context
                          .read<UserRepository>()
                          .changeUsername(_nameController.text);
                    }
                    if (_descriptionController.text != '') {
                      print('changing company description!');
                      context.read<UserRepository>().changeCompanyDescription(
                          _descriptionController.text);
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Edit information')),
            ],
          ),
        ),
      ),
    );
  }
}
