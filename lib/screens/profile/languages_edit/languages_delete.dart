import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/profile/languages_edit/languages_edit.dart';
import 'package:provider/provider.dart';

class LanguageDeleteScreen extends StatefulWidget {
  List languages;
  LanguageDeleteScreen(this.languages);

  @override
  _LanguageDeleteScreenState createState() => _LanguageDeleteScreenState();
}

class _LanguageDeleteScreenState extends State<LanguageDeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            'Edit you languages',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey,
            child: Column(children: [
              for (int i = 0; i < widget.languages.length; i++)
                Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(widget.languages[i][0]),
                        Text(
                          ' - ',
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        Text(widget.languages[i][1],
                            style: TextStyle(color: Colors.blueGrey)),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                child: Icon(Icons.clear, color: Colors.red),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Text(
                                              'Do you want to delete this language?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<UserRepository>()
                                                      .updateLanguages(
                                                          this.widget.languages,
                                                          i)
                                                      .then((_) {
                                                    context
                                                        .read<UserRepository>()
                                                        .getLanguages()
                                                        .then((value) {
                                                      setState(() {
                                                        widget.languages =
                                                            value;
                                                      });
                                                    });
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Yes')),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Cancel'),
                                            )
                                          ],
                                        );
                                      });
                                }),
                          ),
                        )
                      ],
                    )),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    child: Text('Add a new language'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EditLanguagesScreen())).then((_) {
                        context
                            .read<UserRepository>()
                            .getLanguages()
                            .then((value) {
                          setState(() {
                            widget.languages = value;
                          });
                        });
                      });
                    }),
              ),
            ]),
          ),
        ));
  }
}
