import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(
      title: 'Weather App',
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var humidity;
  var windSpeed;
  Future getWeather() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=Boston&appid=e4f4155edcfc7211e48c02b040451d01');
    var results = jsonDecode(response.body);
    setState(() {
     this.temp = results['main']
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text('Currently in Boston ',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
                Text(
                  "52 \u00B0",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text('Currently in Boston ',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                      title: Text('Temperature'),
                      trailing: Text('52 \u00b0'),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.cloud),
                      title: Text('Weather'),
                      trailing: Text('wheather'),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.sun),
                      title: Text('Temperature'),
                      trailing: Text('33'),
                    ),
                    ListTile(
                      leading: FaIcon(FontAwesomeIcons.wind),
                      title: Text('Temperature'),
                      trailing: Text('12'),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
