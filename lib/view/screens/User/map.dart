// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MyMap extends StatefulWidget {
//   @override
//   _MyMapScreenState createState() => _MyMapScreenState();
// }

// class _MyMapScreenState extends State<MyMap> {
//   GoogleMapController? mapController;
//   LatLng? _selectedLocation;
//   String? _locationInfo;
//   LatLng? _currentLocation;
//   final Location _location = Location();
//   final String _apiKey = 'YOUR_GOOGLE_MAPS_API_KEY'; // أدخل مفتاح API الخاص بك هنا

//   Future<void> _getAddressFromLatLng(LatLng position) async {
//     final url =
//         'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$_apiKey';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       if (data['status'] == 'OK') {
//         final results = data['results'];
//         if (results.isNotEmpty) {
//           setState(() {
//             _locationInfo = results[0]['formatted_address'];
//           });
//         } else {
//           setState(() {
//             _locationInfo = "${position.latitude}, ${position.longitude}";
//           });
//         }
//       } else {
//         setState(() {
//           _locationInfo = "${position.latitude}, ${position.longitude}";
//         });
//       }
//     } else {
//       setState(() {
//         _locationInfo = "${position.latitude}, ${position.longitude}";
//       });
//     }
//   }

//   Future<void> _updateCurrentLocation() async {
//     try {
//       bool _serviceEnabled = await _location.serviceEnabled();
//       if (!_serviceEnabled) {
//         _serviceEnabled = await _location.requestService();
//         if (!_serviceEnabled) {
//           return;
//         }
//       }
//       PermissionStatus _permissionGranted = await _location.hasPermission();
//       if (_permissionGranted == PermissionStatus.denied) {
//         _permissionGranted = await _location.requestPermission();
//         if (_permissionGranted != PermissionStatus.granted) {
//           return;
//         }
//       }

//       LocationData _locationData = await _location.getLocation();
//       LatLng newLocation = LatLng(_locationData.latitude!, _locationData.longitude!);

//       setState(() {
//         _currentLocation = newLocation;
//         _selectedLocation = newLocation;
//         _getAddressFromLatLng(newLocation);
//         if (mapController != null) {
//           mapController!.animateCamera(CameraUpdate.newLatLng(newLocation));
//         }
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(33.5138, 36.2765), // إحداثيات دمشق
//                 zoom: 10,
//               ),
//               onMapCreated: (controller) {
//                 setState(() {
//                   mapController = controller;
//                 });
//               },
//               onTap: (LatLng location) async {
//                 setState(() {
//                   _selectedLocation = location;
//                 });
//                 await _getAddressFromLatLng(location);
//               },
//               markers: _selectedLocation != null
//                   ? {
//                       Marker(
//                         markerId: MarkerId('selectedLocation'),
//                         position: _selectedLocation!,
//                       ),
//                     }
//                   : {},
//             ),
//           ),
//           if (_selectedLocation != null && _locationInfo != null)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Text(
//                     'Selected Location: $_locationInfo',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () {
//                       print('Location: ${_selectedLocation!.latitude}, ${_selectedLocation!.longitude}');
//                       print('Location Info: $_locationInfo');
//                       Navigator.pop(context);
//                     },
//                     child: Text('OK'),
//                   ),
//                 ],
//               ),
//             ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ElevatedButton(
//               onPressed: _updateCurrentLocation,
//               child: Text('Update Current Location'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
