import 'package:flutter/material.dart';
import 'package:games_valley/repositories/user_repository.dart';
import 'package:games_valley/screens/profile/languages_edit/languages_create.dart';
import 'package:provider/provider.dart';

class LanguageEditScreen extends StatefulWidget {
  List languages;
  LanguageEditScreen(this.languages);

  @override
  _LanguageEditScreenState createState() => _LanguageEditScreenState();
}

class _LanguageEditScreenState extends State<LanguageEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text(
            'Edit you languages',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
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
                      Expanded(
                        child: Text(widget.languages[i][1],
                            style: TextStyle(color: Colors.blueGrey)),
                      ),
                      TextButton(
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
                                          onPressed: () async {
                                            await context
                                                .read<UserRepository>()
                                                .updateLanguages(
                                                    this.widget.languages, i)
                                                .then((_) async {
                                              await context
                                                  .read<UserRepository>()
                                                  .getLanguages();
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
                                CreateLanguageScreen())).then((languages) {
                      if (languages != null) {
                        setState(() {
                          this.widget.languages = languages;
                        });
                      }
                    });
                  }),
            ),
          ]),
        ));
  }
}
