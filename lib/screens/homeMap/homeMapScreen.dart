import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:rideusertesteapp/styles/band_colors.dart';
import 'package:rideusertesteapp/widgets/branddivider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class HomeMapScreen extends StatefulWidget {

  @override
  _HomeMapScreenState createState() => _HomeMapScreenState();
}

class _HomeMapScreenState extends State<HomeMapScreen> with TickerProviderStateMixin{
  final PanelController panelController = PanelController();

  Completer<GoogleMapController> _controller = Completer();

  GoogleMapController mapController;

  double mapBottomPadding = 0.0;
  //double searchSheetHeight = Platform.isIOS ? 260 : 220; //(Platform.isIOS) ? 220 : 220;
  double rideDetailsSheetHeight = 0; //Platform.isIOS ? 219 : 219;
  double requestingSheetHeight = 0; // (Platform.isAndroid) ? 195 : 220
  double tripSheetHeight = 0; // (Platform.isAndroid) ? 275 : 300

  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  var geoLocator = Geolocator();
  Position currentPosition;

  /*
  void setupPositionLocator() async{
    print('#1');
    Position position = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    print(currentPosition);
    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = CameraPosition(target: pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
  }
  */

  void setupPositionLocator() async{
    final PermissionStatus permission = await _getLocationPermission();
    if (permission == PermissionStatus.granted) {
    //print('#1');
    Position position = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;
    //print(position);

    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = CameraPosition(target: pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
    }
  }

  Future<PermissionStatus> _getLocationPermission() async {
    final PermissionStatus permission = await LocationPermissions()
        .checkPermissionStatus(level: LocationPermissionLevel.location);

    if (permission != PermissionStatus.granted) {
      final PermissionStatus permissionStatus = await LocationPermissions()
          .requestPermissions(
          permissionLevel: LocationPermissionLevel.location);

      return permissionStatus;
    } else {
      return permission;
    }
  }


  @override
  Widget build(BuildContext context) {
    double searchSheetHeight = Platform.isIOS
        ? MediaQuery.of(context).size.height * 0.34
        : 220;
        //: MediaQuery.of(context).size.height * 0.30;  // Testar..
    var celHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: mapBottomPadding),
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              mapController = controller;

              setState(() {
                mapBottomPadding = (Platform.isAndroid) ? 220 : 220;
              });

              setupPositionLocator();

            },
          ),

          // Search Container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () async {
                /*
                var response = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ));
                if (response == 'getDirection') {
                  showDetailSheet();
                }
                */
              },
              child: AnimatedSize(
                vsync: this,
                duration: Duration(milliseconds: 150),
                curve: Curves.easeIn,
                child: Container(
                  height: searchSheetHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15.0,
                        spreadRadius: 0.5,
                        offset: Offset(0.7, 0.7),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.0),
                        Text('Nice to see you', style: TextStyle(fontSize: 10)),
                        Text('Where are you going to',
                            style: TextStyle(
                                fontSize: 18, fontFamily: "Brand-Bold")),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5.0,
                                spreadRadius: 0.5,
                                offset: Offset(0.7, 0.7),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: Colors.blueAccent),
                                SizedBox(width: 10),
                                Text('Search Destination'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 22.0),
                        Row(
                          children: [
                            Icon(OMIcons.home, color: BrandColors.colorDimText),
                            SizedBox(width: 12.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*
                                Text((Provider.of<AppData>(context).pickupAddress != null)
                                    ? Provider.of<AppData>(context).pickupAddress.placeName
                                    : 'Add Home', style: TextStyle(fontSize: 11),
                                ),
                                */
                                Text('Add Home'),
                                SizedBox(height: 3),
                                Text(
                                  'Sua localização',
                                  style: TextStyle(
                                    color: BrandColors.colorDimText,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //SizedBox(height: 10),
                        //Text(celHeight.toStringAsFixed(2)),
                        //Text(searchSheetHeight.toStringAsFixed(2)),
                        BrandDivider(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*
void setupPositionLocator() async{
    //final PermissionStatus permission = await _getLocationPermission();
    //if (permission == PermissionStatus.granted) {
      print('#1');
      Position position = await geoLocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      currentPosition = position;
      print(position);

      LatLng pos = LatLng(position.latitude, position.longitude);
      CameraPosition cp = CameraPosition(target: pos, zoom: 14);
      mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
    //} else {
      //print('#2');
    //}

    // - -
    /*
    Position position = await geoLocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation);
    currentPosition = position;

    LatLng pos = LatLng(position.latitude, position.longitude);
    CameraPosition cp = CameraPosition(target: pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(cp));
    */
  }

  /*
  void location_permission() async {
    final PermissionStatus permission = await _getLocationPermission();
    if (permission == PermissionStatus.granted) {
      final position = await geoLocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      // Use the position to do whatever...
    }
  }
  */

  /*
  Future<PermissionStatus> _getLocationPermission() async {
    final PermissionStatus permission = await LocationPermissions()
        .checkPermissionStatus(level: LocationPermissionLevel.location);

    if (permission != PermissionStatus.granted) {
      final PermissionStatus permissionStatus = await LocationPermissions()
          .requestPermissions(
          permissionLevel: LocationPermissionLevel.location);

      return permissionStatus;
    } else {
      return permission;
    }
  }
  */


 */