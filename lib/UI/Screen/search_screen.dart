// import 'package:flutter/material.dart';
// import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
// import 'package:forecasters/Helper/app_constants.dart';
// import 'package:forecasters/UI/Screen/display_weather_screen.dart';
// import 'package:forecasters/UI/Widget/search_card.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../../Model/weather.dart';
// import '../Controller/weather_controller.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   final WeatherController weatherController = Get.put(WeatherController());
//   late final FlutterGooglePlacesSdk _places;
//   final searchController = TextEditingController();
//   final List<PlaceField> _list = [
//     PlaceField.Id,
//     PlaceField.Location,
//     PlaceField.Name
//   ];
//   FetchPlaceResponse? fetchResponse;
//
//   @override
//   void initState() {
//     super.initState();
//     _places = FlutterGooglePlacesSdk(AppConstants.mapsApiKey);
//     Future.delayed(const Duration(seconds: 1));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: AppConstants.grBgGradient,
//         ),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 50,
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8),
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextField(
//                         controller: searchController,
//                         style: const TextStyle(
//                           color: AppConstants.clrBlueTint,
//                           fontSize: 20,
//                         ),
//                         onSubmitted: (str) {
//                           if(str.isEmpty||!str.isAlphabetOnly) {
//                             return;
//                           }
//                           _places
//                               .fetchPlace(str, fields: _list)
//                               .then((value) => fetchResponse = value);
//                           searchController.clear();
//                         },
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           searchController.clear();
//                         },
//                         icon: const Icon(
//                           Icons.close,
//                           color: AppConstants.clrBlueTint,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 60),
//             const Text(
//               'Recent Searches',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: Divider(color: Colors.white),
//             ),
//             if (fetchResponse != null)
//               GestureDetector(
//                 onTap: () {
//                   var url =
//                       '${AppConstants.baseUrl}${fetchResponse?.place?.latLng?.lat}, ${fetchResponse?.place?.latLng?.lng}${AppConstants.apiKey}';
//                   http.get(Uri.parse(url)).then((value) {
//                     weatherController.city.value =
//                         fetchResponse?.place?.name ?? 'Calcutta';
//                     weatherController.weather.value =
//                         weatherFromJson(value.body);
//                     weatherController.update();
//                     Future.delayed(const Duration(seconds: 1));
//                     Get.to(() => DisplayWeatherScreen());
//                   });
//                 },
//                 child: SearchCard(title: fetchResponse?.place?.name ?? ''),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
