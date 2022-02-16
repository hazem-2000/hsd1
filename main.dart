import 'package:flutter/material.dart';
import 'package:weather_app/additional_information.dart';
import 'package:weather_app/model.dart';
import 'package:weather_app/search.dart';
import 'package:weather_app/weather_api.dart';

import 'current_weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? x="Damascus";

  WeatherApi client =WeatherApi();
  Weather?data;


  Future<void>getData()async{
    data=await client.getCurrentWeather("$x");
  }

  @override



  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      //backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: Text(
          "Weather App",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context){
                      return Search();
                    }
                )).then((valueFromTextField){
                  // use your valueFromTextField from the second page
                  setState(() {
                    x=valueFromTextField;

                  });

                });


            });
          },
          icon: Icon(Icons.search),
          color: Colors.black,
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imm.jpg"),
            fit: BoxFit.cover
          )
        ),
        child: FutureBuilder(
          future: getData(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather( "${data!.con}","${data!.temp}", "${data!.cityName}"),

                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Additional information",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xdd212121)),
                  ),
                  Divider(),
                  SizedBox(height: 20,),
                  additionalInformation("${data!.wind}", "${data!.humidity}", "${data!.pressure}", "${data!.feelsLike}")
                ],
              );

            }
            else if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            return Container();
          },
        ),
      )
    );
  }
}
