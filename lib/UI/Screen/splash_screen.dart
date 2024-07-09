import 'package:flutter/material.dart';
import 'package:forecasters/Helper/app_constants.dart';
import 'package:forecasters/Model/weather.dart';
import 'package:forecasters/UI/Controller/weather_controller.dart';
import 'package:forecasters/UI/Screen/display_weather_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final WeatherController weatherController = Get.put(WeatherController());

  @override
  void initState() {
    super.initState();
    getWeatherData();
    Future.delayed(const Duration(seconds: 1));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
    var position = await Geolocator.getCurrentPosition();
    var address =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    var url =
        '${AppConstants.baseUrl}${position.latitude}, ${position.longitude}${AppConstants.apiKey}';
    var response = await http.get(Uri.parse(url));
    weatherController.city.value = address[0].administrativeArea ?? 'Calcutta';
    weatherController.weather.value = weatherFromJson(response.body);
    weatherController.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppConstants.grBgGradient,
        ),
        child: Column(
          children: [
            const SizedBox(height: 200),
            Center(
              child: Image.asset(
                AppConstants.imgLogo,
                height: 90,
                width: 90,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              '4caster',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Weather App',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 130),
            GestureDetector(
              onTap: () {
                setState(() {});
                getWeatherData();
                Future.delayed(const Duration(seconds: 1));
                Get.to(() => DisplayWeatherScreen());
              },
              child: Center(
                child: Image.asset(AppConstants.imgNext, height: 72),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
