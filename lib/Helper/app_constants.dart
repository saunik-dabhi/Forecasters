import 'package:flutter/material.dart';

class AppConstants {
  static const String imgBasePath = 'assets/image';
  static const String imgLogo = '$imgBasePath/Climate_Care.png';
  static const String imgNext = '$imgBasePath/Next_page.png';
  static const String imgDoubleLeft = '$imgBasePath/Double_Left.png';
  static const String imgLogout = '$imgBasePath/Logout.png';
  static const String imgAtPressure = '$imgBasePath/Atmospheric_Pressure.png';
  static const String imgRainSensor = '$imgBasePath/Rain_Sensor.png';
  static const String imgSunlight = '$imgBasePath/Sunlight.png';
  static const String imgWindTurbines = '$imgBasePath/Wind_Turbines.png';
  static const String imgCloudy = '$imgBasePath/cloudy.png';
  static const String imgSunny = '$imgBasePath/Sun.png';
  static const String imgSnow = '$imgBasePath/Snow.png';
  static const String imgHeavyRain = '$imgBasePath/Heavy Rain.png';
  static const String imgSnowBg = '$imgBasePath/snow_bg.png';
  static const String imgRainyBg = '$imgBasePath/rainy_bg.png';
  static const String imgSunnyBg = '$imgBasePath/sunny_bg.png';
  static const String imgCloudyBg = '$imgBasePath/cloudy_bg.png';
  static const String imgSunrise = '$imgBasePath/sunrise.png';
  static const String imgSunset = '$imgBasePath/sunset.png';

  static const Color clrNeptuneBlue = Color(0xFF70A4AF);
  static const Color clrBlueTint = Color(0xFF034347);

  static const Gradient grBgGradient = LinearGradient(
    colors: [AppConstants.clrNeptuneBlue, AppConstants.clrBlueTint],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const String baseUrl =
      'https://api.tomorrow.io/v4/weather/forecast?location=';
  static const String apiKey = '&apikey=2WDjvQhforSF50mHbi6Ud3xC1qS2o0Lk';
  static const String mapsApiKey = 'AIzaSyCXiM_WwJQRjQ-0b2OVUBs1vZzTPp_c9A4';
}
