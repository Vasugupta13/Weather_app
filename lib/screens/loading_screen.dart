import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key,});


  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async {


    var weatherData=await WeatherModel().getLocationWeather();

     if(context.mounted)
     {
        Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen(locationWeather:weatherData,);
        }));
     }

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}