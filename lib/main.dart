import 'dart:convert';
import 'package:covid19_app/countries.dart';
import 'package:covid19_app/globalApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
    title: "Covid 19 tracker",
    debugShowCheckedModeBanner: false,
    home: DashBoard()));

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  GlobalData globalData = GlobalData(active: 0, recovered: 0, deaths: 0);

  fetchData() async {
    var url = Uri.parse("https://corona.lmao.ninja/v2/all");
    var response = await http.get(url);
    globalData = GlobalData.fromJson(jsonDecode(response.body));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Covid 19 Tracker App"),
          centerTitle: true,
          backgroundColor: Colors.cyan,
        ),
        body: (globalData.active == 0 ||
                globalData.deaths == 0 ||
                globalData.recovered == 0)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Global Covid19 Status:",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 30.0),
                      child: Container(
                        child: _displayRecord(),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Countries()));
                    },
                    color: Colors.blue,
                    child: Text(
                      "Get Country Data",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  )
                ],
              ));
  }

  _displayRecord() {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Card(
          elevation: 10.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Active",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${globalData.active}',
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ),
        Card(
          elevation: 10.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Recovered",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${globalData.recovered}',
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ),
        Card(
          elevation: 10.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Deaths",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${globalData.deaths}',
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
