import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  State<StatefulWidget> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  static const menuItems = <String>[
    'Cricket',
    'Football',
    'Kabadi',
    'Other',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuItems= menuItems.map((String value) => DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  )
  ).toList();

  String _btn2SelectedVal;

  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _time1 = TimeOfDay.now();

  final formKey = GlobalKey<FormState>();

  //making asyncronize call
  Future _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);

    if (picked != null) {
      print('$_time');
      setState(() => _time = picked);
    }
  }

  Future _selectTime1(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time1);

    if (picked != null) {
      print('$_time1');
      setState(() => _time1 = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '           Booking Info.',
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[


            Column(
              children: <Widget>[
                ListTile(
                title: Text('Type of Sport',style: TextStyle(fontSize: 20)),
                  trailing: DropdownButton(
                    value: _btn2SelectedVal,
                    hint: Text('Select'),
                    onChanged: ((String newValue){
                      setState(() {
                        _btn2SelectedVal=newValue;
                      });
                    }),
                    items: _dropDownMenuItems,
                  ),
              ),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: Row(children: <Widget>[
                    Text('Start Time : ', style: TextStyle(fontSize: 20)),
                    OutlineButton(
                        child: Text(
                          '${_time.format(context)}',
                          style: TextStyle(fontSize: 20),
                        ),
                        textColor: Colors.green,
                        onPressed: () {
                          _selectTime(context);
                        })
                  ]
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width*0.70,
                  child: Row(children: <Widget>[
                    Text('End Time : ', style: TextStyle(fontSize: 20)),
                    OutlineButton(
                        textColor: Colors.green,
                        child: Text('${_time1.format(context)}',
                            style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          _selectTime1(context);
                        })
                  ]
                  ),
                ),
                SizedBox(height: 20),
                Text('Net Booking Price: 200 BDT',
                    style: TextStyle(fontSize: 22)
                ),

              ],
            ),
          Positioned(
            bottom: 0,
            child: Container(
                margin: EdgeInsets.all(10.0),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.95,
                child: RaisedButton(
                  child: Text('Confirm', style: TextStyle(fontSize: 20)),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width * 0.50,
                              height: MediaQuery.of(context).size.height * 0.20,
                              color: Colors.white,
                              child: Card(
                                  color: Colors.white,
                                  elevation: 10.0,
                                  child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      height: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Book No.20056 Placed Successfully. Payment fo BDT 200 will be due upon arrival.",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                decorationStyle: null,
                                                decoration: null),
                                          ),
                                          SizedBox(height: 10),
                                          RaisedButton(
                                            child: Text('OK'),
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            onPressed: () {
                                              exit(1);
                                            },
                                          )
                                        ],
                                      ))));
                        });
                  },
                )),
          )
        ],
      ),
    );
  }
}
