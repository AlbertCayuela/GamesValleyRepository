import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

class EditMainInfoScreen extends StatefulWidget {
  final UserInformation user;

  EditMainInfoScreen({Key key, @required this.user}) : super(key: key);

  @override
  _EditMainInfoScreenState createState() => _EditMainInfoScreenState();
}

class _EditMainInfoScreenState extends State<EditMainInfoScreen> {
  String imageUrl;
  String currentCV;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    imageUrl = widget.user.profileImageUrl;
    currentCV = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit your main information',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Flex(direction: Axis.horizontal),
                      CircleAvatar(
                        child: (imageUrl != '')
                            ? null
                            : Icon(Icons.person, size: 45),
                        radius: 50,
                        backgroundImage:
                            (imageUrl != '') ? NetworkImage(imageUrl) : null,
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
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (currentCV != '')
                        Expanded(
                            child:
                                currentCV == '' ? Text('') : Text(currentCV)),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<UserRepository>()
                              .pickCVAndUpload()
                              .then((value) {
                            setState(() {
                              currentCV = value;
                            });
                          });
                        },
                        child: Text('Upload new CV'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _surnameController,
                        decoration: InputDecoration(
                          labelText: 'Surname',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                          labelText:
                              'Phone number (please add your country code)',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            if (_nameController.text != '') {
                              print('changing name!');
                              context
                                  .read<UserRepository>()
                                  .changeName(_nameController.text);
                            }
                            if (_surnameController.text != '') {
                              print('changing surname!');
                              context
                                  .read<UserRepository>()
                                  .changeSurname(_surnameController.text);
                            }
                            if (_phoneNumberController.text != '') {
                              print('changing phone number!');
                              context
                                  .read<UserRepository>()
                                  .changePhone(_phoneNumberController.text);
                            }
                            Navigator.pop(context);
                          },
                          child: Text('Edit information')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
