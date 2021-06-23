import 'package:covid19_app/countryApi.dart';
import 'package:covid19_app/countryDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  List<CountryData> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var url = Uri.parse("https://corona.lmao.ninja/v2/countries?sort=cases");
    var response = await http.get(url);
    data = dataFromJson(response.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: data.isEmpty
          ? Center(
              child: Text(
                "Loading......",
                style: TextStyle(fontSize: 25.0),
              ),
            )
          : Container(
              child: _countryNames(),
            ),
    );
  }

  _countryNames() {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CountryDetails(data: data[index])));
              },
              child: Row(
                children: [
                  Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(data[index].countryInfo.flag))),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '${data[index].country}',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          );
        });
  }
}
