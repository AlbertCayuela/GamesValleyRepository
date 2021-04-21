import 'package:flutter/material.dart';

class EditWorkScreen extends StatefulWidget {
  @override
  _EditWorkScreenState createState() => _EditWorkScreenState();
}

class _EditWorkScreenState extends State<EditWorkScreen> {
  String startingMonth;
  String finishMonth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit your work experience', style: TextStyle(fontWeight: FontWeight.bold),), ),
      body: 
          Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),                
                    ),
                    child: Row(        
                      children: [
                        Expanded(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Add experience', style: TextStyle(fontSize: 20),),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                //icon: Icon(Icons.mail),
                                labelText: 'Job',
                                border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10)),
                                 ),
                              ),
                              SizedBox(height: 5),
                              TextField(
                                decoration: InputDecoration(
                                //icon: Icon(Icons.mail),
                                labelText: 'Company',
                                border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(10)),
                                 ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  DropdownButton(
                                    value: startingMonth,
                                    hint: Text('Starting month'),
                                    items: [
                                          DropdownMenuItem(child: Text('January'), value: 'January',),
                                          DropdownMenuItem(child: Text('February'), value: 'February',),
                                          DropdownMenuItem(child: Text('March'), value: 'March'),
                                          DropdownMenuItem(child: Text('April'), value: 'April',),
                                          DropdownMenuItem(child: Text('May'), value: 'May',),
                                          DropdownMenuItem(child: Text('June'), value: 'June',),
                                          DropdownMenuItem(child: Text('July'), value: 'July',),
                                          DropdownMenuItem(child: Text('August'), value: 'August'),
                                          DropdownMenuItem(child: Text('September'), value: 'September',),
                                          DropdownMenuItem(child: Text('October'), value: 'October',),
                                          DropdownMenuItem(child: Text('November'), value: 'November',),
                                          DropdownMenuItem(child: Text('December'), value: 'December',),
                                    ],
                                    onChanged: (value){
                                      setState(() {
                                        startingMonth = value;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    
                                     child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                      
                                     labelText: 'Starting year',
                                     border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10)),
                                 ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  DropdownButton(
                                    value: finishMonth,
                                    hint: Text('Finishing month'),
                                    items: [
                                          DropdownMenuItem(child: Text('January'), value: 'January',),
                                          DropdownMenuItem(child: Text('February'), value: 'February',),
                                          DropdownMenuItem(child: Text('March'), value: 'March'),
                                          DropdownMenuItem(child: Text('April'), value: 'April',),
                                          DropdownMenuItem(child: Text('May'), value: 'May',),
                                          DropdownMenuItem(child: Text('June'), value: 'June',),
                                          DropdownMenuItem(child: Text('July'), value: 'July',),
                                          DropdownMenuItem(child: Text('August'), value: 'August'),
                                          DropdownMenuItem(child: Text('September'), value: 'September',),
                                          DropdownMenuItem(child: Text('October'), value: 'October',),
                                          DropdownMenuItem(child: Text('November'), value: 'November',),
                                          DropdownMenuItem(child: Text('December'), value: 'December',),
                                    ],
                                    onChanged: (value){
                                      setState(() {
                                        finishMonth = value;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                      
                                     labelText: 'Finish year',
                                     border: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10)),
                                 ),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
            
              ],
              
            ),
          ),
          
        ),
      
    );
  }
}