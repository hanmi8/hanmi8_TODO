import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:intl/intl.dart';

import '../customDrawer.dart';
import '../utils/values.dart';
import '../widgets/custom_button.dart';

Logger log = Logger();

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreen();
}

class _WeatherScreen extends State<WeatherScreen> {
  late Weather _weather = Weather(
    location: '00',
    temperature: '20',
    description: 'no Data',
    main: 'no Data',
  );

  @override
  void initState() {
    super.initState();
    log.i(_weather);
    _getLocationAndWeather();
  }

  Future<void> _getLocationAndWeather() async {
    // OpenWeatherMap API 호출
    final String apiKey = 'b2869781d075f19dbdaae8767f47ff5b';
    final String apiURL = 'https://api.openweathermap.org/data/2.5/weather?q=Daejeon&appid=${apiKey}';
    final http.Response response = await http.get(Uri.parse(apiURL));

    // API 응답 성공
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      //log.i(data);

      // 상태 변경
      setState(() {
        _weather = Weather(
          location: data['name'],
          temperature: data['main']['temp'].toString(),
          description: data['weather'][0]['description'],
          main: data['weather'][0]['main'],
        );
        log.i(_weather);
      });
    } else {
      throw Exception('Failed to load weather');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // home: Scaffold(
      appBar: AppBar(
        elevation: Sizes.ELEVATION_1,
        backgroundColor: AppColors.blue,
        title: Text(
          'HOME',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white, // 뒤로 가기 화살표 색상 설정
        ),
      ),
      body: Center(
        child:
        _weather.location == "00" ? CircularProgressIndicator() :
        Column(
          children: [
            Container(padding: EdgeInsets.symmetric(vertical: 8.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_weather.location}',
                  style: TextStyle(fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ],
            ),
            Container(
              height: 340, width: 450,
              margin: EdgeInsets.all(24.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                  // side: BorderSide(width:4.0),
                ),
                elevation: 20.0, color: AppColors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 16.0),
                        alignment: Alignment.topCenter,
                        child: Text(style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.white), textAlign: TextAlign.center,
                          '${(double.parse(_weather.temperature.toString()) <
                              10)
                              ? '날씨가 추워요. \n외출할 때는 따뜻하게 입으세요!'
                              : '외출하기 좋은 날씨에요. \n화창한 날씨를 즐기러 밖으로 나가요'
                          }',
                        )
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        margin: EdgeInsets.fromLTRB(10, 0, 0, 40),
                        alignment: Alignment.topCenter,
                        child: Text(style: TextStyle(
                            fontSize: 14, color: Colors.white54),
                          textAlign: TextAlign.center,
                          '${DateFormat('MM.dd HH:mm 기준').format(DateTime
                              .now())}',
                        )
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 120,
                            height: 120,
                            margin: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),),
                                elevation: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, bottom: 0),
                                      child: Icon(Icons.sunny,
                                          color: Colors.amberAccent,
                                          size: 40),
                                    ),
                                    Text(style: TextStyle(fontSize: 20), "날씨",
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text(
                                        '${_weather.main}',
                                      ),
                                    )
                                  ],
                                )
                            )
                        ),
                        Container(
                            width: 120,
                            height: 120,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),),
                                elevation: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, bottom: 0),
                                      child: Icon(Icons.thermostat,
                                          color: Colors.deepOrangeAccent,
                                          size: 40),
                                    ),
                                    Text(
                                        style: TextStyle(fontSize: 20), "기온"),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text(
                                        '${_weather.temperature}ºC',
                                      ),
                                    )
                                  ],
                                )
                            )
                        ),
                        Container(
                            width: 120,
                            height: 120,
                            margin: EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10),
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),),
                                elevation: 4.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, bottom: 0),
                                      child: Icon(
                                          Icons.air, color: Colors.black87,
                                          size: 40),
                                    ),
                                    Text(style: TextStyle(fontSize: 20),
                                        "대기수준"),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: Text(
                                        '${_weather.description}',
                                      ),
                                    )
                                  ],
                                )
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: CustomDrawer(),
    );
  }
}

class Weather {
  final String location;
  final String temperature;
  final String description;
  final String main;

  Weather(
      {required this.location, required this.temperature, required this.description, required this.main});

  @override
  String toString() {
    return 'Weather{location: $location, temperature: $temperature, description: $description, main: $main}';
  }
}