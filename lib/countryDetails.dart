import 'package:covid19_app/countryApi.dart';
import 'package:flutter/material.dart';

class CountryDetails extends StatelessWidget {
  CountryData data;

  CountryDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${data.country}',
        ),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: _countryCases(context),
    );
  }

  _countryCases(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1,
          left: 15.0,
          right: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Text(
                "Country:",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                '${data.country}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          SizedBox(
            width: 10.0,
          ),
          Row(children: [
            Text(
              "Population:",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${data.population}',
              style: TextStyle(fontSize: 18.0),
            )
          ]),
          SizedBox(
            width: 10.0,
          ),
          Row(children: [
            Text(
              "Tests done:",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${data.tests}',
              style: TextStyle(fontSize: 18.0),
            )
          ]),
          SizedBox(
            width: 10.0,
          ),
          Row(children: [
            Text(
              "Total cases:",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${data.cases}',
              style: TextStyle(fontSize: 18.0),
            )
          ]),
          SizedBox(
            width: 10.0,
          ),
          Row(children: [
            Text(
              "Active cases:",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${data.active}',
              style: TextStyle(fontSize: 18.0),
            )
          ]),
          SizedBox(
            width: 10.0,
          ),
          Row(children: [
            Text(
              "Recoverd:",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${data.recovered}',
              style: TextStyle(fontSize: 18.0),
            )
          ]),
          SizedBox(
            width: 10.0,
          ),
          Row(children: [
            Text(
              "Deaths:",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '${data.deaths}',
              style: TextStyle(fontSize: 18.0),
            )
          ])
        ],
      ),
    );
  }
}
