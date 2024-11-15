// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Location',
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//       ),
//       home: const MyHomePage(title: 'Flutter Location Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, this.title}) : super(key: key);
//   final String? title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final Location location = Location();

//    GoogleMapController? mapController;
//   LatLng? _selectedLocation;
//   String? _locationInfo;
//   LatLng? _currentLocation;
//    final Location location = Location();

//   Future<void> _getAddressFromLatLng(LatLng position) async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//           position.latitude, position.longitude);
//       if (placemarks.isNotEmpty) {
//         setState(() {
//           _locationInfo = placemarks.first.name;
//         });
//       } else {
//         setState(() {
//           _locationInfo = "${position.latitude}, ${position.longitude}";
//         });
//       }
//     } catch (e) {
//       print(e);
//       setState(() {
//         _locationInfo = "${position.latitude}, ${position.longitude}";
//       });
//     }
//   }

//   Future<void> _updateCurrentLocation() async {
     
//     try {
//       // طلب الإذن بالوصول إلى الموقع
//       bool _serviceEnabled = await location.serviceEnabled();
//       if (!_serviceEnabled) {
//         _serviceEnabled = await location.requestService();
//         if (!_serviceEnabled) {
//           return;
//         }
//       }
//       PermissionStatus _permissionGranted = await location.hasPermission();
//       if (_permissionGranted == PermissionStatus.denied) {
//         _permissionGranted = await location.requestPermission();
//         if (_permissionGranted != PermissionStatus.granted) {
//           return;
//         }
//       }
      
//       // الحصول على الموقع الحالي
//       LocationData _locationData = await location.getLocation();
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