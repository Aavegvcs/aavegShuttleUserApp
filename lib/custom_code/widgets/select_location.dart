// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:image/image.dart' as img;
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';
// import 'package:http/http.dart' as http;

class SelectLocation extends StatefulWidget {
  const SelectLocation({
    Key? key,
    this.width,
    this.height,
    required this.currentLocation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng currentLocation;

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  late GoogleMapController mapController;
  // double _originLatitude = ,
  //     _originLongitude = ;
  // double _destLatitude = 28.402572, _destLongitude = 77.044502;
  late final CameraPosition _initialLocation;

  String get googleMapsApiKey {
    if (kIsWeb) {
      return "AIzaSyCgXvsYMxZdITayY6uMjiciI1frli0_AOM";
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return '';
      case TargetPlatform.iOS:
        return "AIzaSyB9YJRhcD3peaF3ugmQDzTskR84K1WnjUc";
      case TargetPlatform.android:
        return "AIzaSyBUKPlUmRfwvktfZXWLEqDG8I7urn9wdtY";
      default:
        return "AIzaSyCgXvsYMxZdITayY6uMjiciI1frli0_AOM";
    }
  }

  getCenter() async {
    LatLngBounds bounds = await mapController.getVisibleRegion();
    LatLng center = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );
    debugPrint(center.toString());
    FFAppState().update(() {
      FFAppState().selectLatLng = center;
    });
    // return center;
  }

  @override
  void initState() {
    final _startCoordinate = latlng.LatLng(
      widget.currentLocation.latitude,
      widget.currentLocation.longitude,
    );
    _initialLocation = CameraPosition(
      target: _startCoordinate,
      zoom: 14,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GoogleMap(
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              tiltGesturesEnabled: true,
              compassEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              onMapCreated: _onMapCreated,
              // onCameraMove: (position) => {getCenter()}
              onCameraIdle: () => {getCenter()})),
    );
  }

  final MAP_STYLE =
      "[{\"featureType\":\"all\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#7c93a3\"},{\"lightness\":\"-10\"}]},{\"featureType\":\"administrative.country\",\"elementType\":\"geometry\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"administrative.country\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#a0a4a5\"}]},{\"featureType\":\"administrative.province\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#62838e\"}]},{\"featureType\":\"landscape\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#dde3e3\"}]},{\"featureType\":\"landscape.man_made\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#3f4a51\"},{\"weight\":\"0.30\"}]},{\"featureType\":\"poi\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"simplified\"}]},{\"featureType\":\"poi.attraction\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"poi.business\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.government\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.park\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"poi.place_of_worship\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.school\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.sports_complex\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road\",\"elementType\":\"all\",\"stylers\":[{\"saturation\":\"-100\"},{\"visibility\":\"on\"}]},{\"featureType\":\"road\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#bbcacf\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"lightness\":\"0\"},{\"color\":\"#bbcacf\"},{\"weight\":\"0.50\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"labels\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"labels.text\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"road.highway.controlled_access\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.highway.controlled_access\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#a9b4b8\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"labels.icon\",\"stylers\":[{\"invert_lightness\":true},{\"saturation\":\"-7\"},{\"lightness\":\"3\"},{\"gamma\":\"1.80\"},{\"weight\":\"0.01\"}]},{\"featureType\":\"transit\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#a3c7df\"}]}]";

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    mapController.setMapStyle(MAP_STYLE);
    // double miny =
    //     (_originLatitude <= _destLatitude) ? _originLatitude : _destLatitude;
    // double minx = (_originLongitude <= _destLongitude)
    //     ? _originLongitude
    //     : _destLongitude;
    // double maxy =
    //     (_originLatitude <= _destLatitude) ? _destLatitude : _originLatitude;
    // double maxx =
    //     (_originLatitude <= _destLongitude) ? _destLongitude : _originLatitude;

    // double southWestLatitude = miny;
    // double southWestLongitude = minx;

    // double northEastLatitude = maxy;
    // double northEastLongitude = maxx;

    // // Accommodate the two locations within the camera view of the map
    // mapController.animateCamera(
    //   CameraUpdate.newLatLngBounds(
    //     LatLngBounds(
    //       northeast: latlng.LatLng(northEastLatitude, northEastLongitude),
    //       southwest: latlng.LatLng(southWestLatitude, southWestLongitude),
    //     ),
    //     60.0,
    //   ),
    // );
  }
}
