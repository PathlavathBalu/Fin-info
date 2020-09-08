import 'package:Finapp/email_picker.dart';
import 'package:Finapp/valueProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TempratureUpdates extends StatefulWidget {
  @override
  _TempratureUpdatesState createState() => _TempratureUpdatesState();
}

class _TempratureUpdatesState extends State<TempratureUpdates> {
  bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          var provider = Provider.of<DataProvider>(context);
          return Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width,
            color: Color(0xff2C3E4C),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Pick Temperature',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff4ab04d),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: FlatButton(
                              onPressed: () => Navigator.pop(context),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 30),
                                child: Text(
                                  'Set',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Radio(
                                  value: 0,
                                  groupValue: provider.radioVal,
                                  onChanged: (val) {
                                    provider.changeType(val, "C");
                                  },

                                  activeColor: Colors.red,
                                  // focusColor: Colors.white,
                                ),
                                new Text(
                                  'C',
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colors.white70),
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: provider.radioVal,
                                    onChanged: (val) {
                                      provider.changeType(val, "F");
                                    },
                                    activeColor: Colors.red),
                                new Text(
                                  'F',
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colors.white70),
                                ),
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: provider.radioVal,
                                    onChanged: (val) {
                                      print(val);

                                      provider.changeType(val, "K");
                                    },
                                    activeColor: Colors.red),
                                new Text(
                                  'K',
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colors.white70),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    RangeSlider(
                        min: -50,
                        max: 100.0,
                        divisions: 150,
                        inactiveColor: Colors.red,
                        activeColor: Colors.green,
                        labels: RangeLabels(
                            provider.low.toString(), provider.high.toString()),
                        values: RangeValues(provider.low, provider.high),
                        onChanged: (_range) {
                          provider.changeTemp(_range.start, _range.end);
                          // setState(() {
                          //   lowValue = _range.start;
                          //   highValue = _range.end;
                          // });
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Wrap(
                        direction: Axis.horizontal,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20,
                              ),
                              color: Color(0xff394B55),
                              child: Column(
                                children: [
                                  Text(
                                    provider.low.toString() +
                                        " " +
                                        provider.type,

                                    // "-25.0 C",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    "Min",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Card(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20,
                              ),
                              color: Color(0xff394B55),
                              child: Column(
                                children: [
                                  Text(
                                    // "10.0 C",
                                    provider.high.toString() +
                                        " " +
                                        provider.type,
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    "Max",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          );
        });
// return BottomSheet(onClosing: null, builder: null)
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);

    return Scaffold(
      backgroundColor: Color(0xff2C3E4C),
      appBar: AppBar(
        backgroundColor: Color(0xff2C3E4C),
        elevation: 0,
        leading: InkWell(
          onTap: () {
            print("poped");
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 25,
          ),
        ),
        title: RaisedButton(
          onPressed: () {},
          child: Text(
            'Raw Food Freezer',
            style: TextStyle(
              fontSize: 19,
              color: Colors.white,
            ),
          ),
          color: Color(0xff394B55),
        ),
        actions: [
          InkWell(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailPicker()));
            },
                      child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/images/03.jpg',
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'DOWNLOAD',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 15),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xffFD7562),
                                  child: Icon(Icons.description,
                                      color: Colors.white, size: 24)),
                            ),
                            WidgetSpan(
                              child: Container(width: 20),
                            ),
                            WidgetSpan(
                              child: Container(
                                transform:
                                    Matrix4.translationValues(-4.0, -10.0, 0.0),
                                child: Text(
                                  "PDF",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Color(0xff00c872),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(width: 2, color: Colors.white))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 15),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xff00c872),
                                  child: Icon(Icons.description,
                                      color: Colors.white, size: 24)),
                            ),
                            WidgetSpan(
                              child: Container(width: 10),
                            ),
                            WidgetSpan(
                              child: Container(
                                transform:
                                    Matrix4.translationValues(-4.0, -10.0, 0.0),
                                child: Text(
                                  " Excel",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Color(0xff00c872),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "ALERT TEMPERATURE THRESHOLD",
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  Icon(Icons.edit, color: Colors.white, size: 24)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Wrap(
                direction: Axis.horizontal,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20,
                      ),
                      color: Color(0xff394B55),
                      child: Column(
                        children: [
                          Text(
                            provider.low.toString() + " " + provider.type,

                            // "-25.0 C",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Min",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20,
                      ),
                      color: Color(0xff394B55),
                      child: Column(
                        children: [
                          Text(
                            // "10.0 C",
                            provider.high.toString() +
                                " " +
                                provider.type,
                            style: TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "Max",
                            style: TextStyle(
                                fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'DESCRIPTION',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                  child: Text(
                      provider.low.toString() +
                          " to " +
                          provider.high.toString() +
                          " temp",
                      style: TextStyle(color: Colors.white, fontSize: 17)),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 13),
              child: Container(
                width: MediaQuery.of(context).size.width,
                //height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffF34433),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FlatButton(
                  onPressed: () {
                    print("create bottom sheet");
                    bottomSheet();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
