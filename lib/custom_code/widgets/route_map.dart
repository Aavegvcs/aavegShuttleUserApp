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

import 'index.dart'; // Imports other custom widgets

import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
import 'package:google_maps_flutter/google_maps_flutter.dart' as latlng;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:image/image.dart' as img;
import 'dart:ui' as ui;
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

import 'package:json_annotation/json_annotation.dart';

class RouteMap extends StatefulWidget {
  const RouteMap({
    Key? key,
    this.width,
    this.height,
    required this.jsonObject,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<dynamic> jsonObject;

  @override
  _PolyLineTestState createState() => _PolyLineTestState();
}

// class Route {
//   final int routeId;
//   final String routeStartTime;
//   final String routeEndTime;
//   final String userPickPoint;
//   final String userDropPoint;
//   final double userPickPointDistance;
//   final double userDropPointDistance;
//   final List<Stop> stops;

//   Route({
//     required this.routeId,
//     required this.routeStartTime,
//     required this.routeEndTime,
//     required this.userPickPoint,
//     required this.userDropPoint,
//     required this.userPickPointDistance,
//     required this.userDropPointDistance,
//     required this.stops,
//   });

//   factory Route.fromJson(Map<String, dynamic> json) {
//     var stopsJson = json['stops'] as List;
//     List<Stop> stopsList =
//         stopsJson.map((stopJson) => Stop.fromJson(stopJson)).toList();

//     return Route(
//       routeId: json['route_id'],
//       routeStartTime: json['routeStartTime'],
//       routeEndTime: json['routeEndTime'],
//       userPickPoint: json['userPickPoint'],
//       userDropPoint: json['userDropPoint'],
//       userPickPointDistance: json['userPickPointDistance'],
//       userDropPointDistance: json['userDropPointDistance'],
//       stops: stopsList,
//     );
//   }
// }

class Stop {
  final String stopName;
  final String stopLat;
  final String stopLng;

  Stop({
    required this.stopName,
    required this.stopLat,
    required this.stopLng,
  });

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
      stopName: json['stopName'],
      stopLat: json['stopLat'],
      stopLng: json['stopLng'],
    );
  }
}

class _PolyLineTestState extends State<RouteMap> {
  late GoogleMapController mapController;
  double _originLatitude = 28.67955, _originLongitude = 77.094597;
  double _destLatitude = 28.402572, _destLongitude = 77.044502;
  // double _originLatitude = 26.48424, _originLongitude = 50.04551;
  // double _destLatitude = 26.46423, _destLongitude = 50.06358;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<latlng.LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  late final CameraPosition _initialLocation;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconStart = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconEnd = BitmapDescriptor.defaultMarker;

  // BitmapDescriptor pinLocationIcon = BitmapDescriptor.defaultMarkerWithHue(90);

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
  // String googleAPiKey = "AIzaSyBUKPlUmRfwvktfZXWLEqDG8I7urn9wdtY";

  // List<latlng.LatLng> waypoints = [
  //   latlng.LatLng(28.67955, 77.094597),
  //   latlng.LatLng(28.6655, 77.09245),
  //   latlng.LatLng(28.63278, 77.08142),
  //   latlng.LatLng(28.63337, 77.08643),
  //   latlng.LatLng(28.635674, 77.097055),
  //   latlng.LatLng(28.62558, 77.10143),
  //   latlng.LatLng(28.602329, 77.126148),
  //   latlng.LatLng(28.44686, 77.03736),
  //   latlng.LatLng(28.429045, 77.037085),
  //   latlng.LatLng(28.419514, 77.040034),
  //   latlng.LatLng(28.409691, 77.042909),
  //   latlng.LatLng(28.402572, 77.044502)
  // ];

  List<Stop> stops = [];

  List<latlng.LatLng> waypoints = [];
  List<double> stopsLat = [];
  List<double> stopsLong = [];
  List<String> stopNames = [];
  List<PolylineWayPoint> waypointsForLine = [];

  // getCenter() async {
  //   LatLngBounds bounds = await mapController.getVisibleRegion();
  //   LatLng center = LatLng(
  //     (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
  //     (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
  //   );
  //   debugPrint(center.toString());
  //   FFAppState().update(() {
  //     FFAppState().selectLatLng = center;
  //   });
  //   // return center;
  // }

  @override
  void initState() {
    addCustomIcon();

    final _startCoordinate = latlng.LatLng(
      _originLatitude,
      _originLongitude,
    );
    _initialLocation = CameraPosition(
      target: _startCoordinate,
      zoom: 14,
    );

    // var routeData = [widget.jsonObject] as List;

    List<Stop> stopsList =
        widget.jsonObject.map((stopJson) => Stop.fromJson(stopJson)).toList();

    // Parse route data and create Route objects
    // for (var routeJson in routeData) {
    //   var route = Stop.fromJson(routeJson);
    //   stops.add(route);
    // }

    stopsList.asMap().forEach((index, route) {
      var waypoint = latlng.LatLng(
          double.parse(route.stopLat), double.parse(route.stopLng));
      var stopNameFetched = route.stopName;
      waypoints.add(waypoint);
      stopNames.add(stopNameFetched);
      var lat = double.parse(route.stopLat);
      stopsLat.add(lat);
      var lng = double.parse(route.stopLng);
      stopsLong.add(lng);
      if (index != 0 || index != stops.length - 1) {
        var waypointsForLinevar = PolylineWayPoint(location: '$lat,$lng');
        waypointsForLine.add(waypointsForLinevar);
      }
      if (index == 0) {
        setState(() {
          _originLatitude = double.parse(route.stopLat);
          _originLongitude = double.parse(route.stopLng);
        });
      }
      if (index == stops.length - 1) {
        setState(() {
          _destLatitude = double.parse(route.stopLat);
          _destLongitude = double.parse(route.stopLng);
        });
      }
    });
    _getPolyline();
    super.initState();

    // setCustomMapPin();
  }

  // void setCustomMapPin() async {
  //   pinLocationIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(devicePixelRatio: 2.5),
  //       'assets/images/location_blue.png');
  //   setState(() {});
  // }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(100, 100)),
            "assets/images/mid_grey.png")
        .then(
      (icon) {
        print(icon);
        setState(() {
          markerIcon = icon;
        });
      },
    );
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(100, 100)),
            "assets/images/st2x.png")
        .then(
      (icon) {
        print(icon);
        setState(() {
          markerIconStart = icon;
        });
      },
    );
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(100, 100)),
            "assets/images/sp2x.png")
        .then(
      (icon) {
        print(icon);
        setState(() {
          markerIconEnd = icon;
        });
      },
    );
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
        markers: Set<Marker>.of(markers.values),
        // markers: {
        //   Marker(
        //     markerId: const MarkerId("marker1"),
        //     position: const latlng.LatLng(28.63278, 77.08142),
        //     draggable: true,
        //     onDragEnd: (value) {
        //       // value is the new position
        //     },
        //     icon: markerIcon,
        //   )
        // },
        polylines: Set<Polyline>.of(polylines.values),
        // onCameraMove: (position) => {getCenter()}
        // onCameraIdle: () => {getCenter()}
      )),
    );
  }

  final MAP_STYLE =
      "[{\"featureType\":\"all\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#7c93a3\"},{\"lightness\":\"-10\"}]},{\"featureType\":\"administrative.country\",\"elementType\":\"geometry\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"administrative.country\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#a0a4a5\"}]},{\"featureType\":\"administrative.province\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#62838e\"}]},{\"featureType\":\"landscape\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#dde3e3\"}]},{\"featureType\":\"landscape.man_made\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#3f4a51\"},{\"weight\":\"0.30\"}]},{\"featureType\":\"poi\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"simplified\"}]},{\"featureType\":\"poi.attraction\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"poi.business\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.government\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.park\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"poi.place_of_worship\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.school\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.sports_complex\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road\",\"elementType\":\"all\",\"stylers\":[{\"saturation\":\"-100\"},{\"visibility\":\"on\"}]},{\"featureType\":\"road\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#bbcacf\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"lightness\":\"0\"},{\"color\":\"#bbcacf\"},{\"weight\":\"0.50\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"labels\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"labels.text\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"road.highway.controlled_access\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.highway.controlled_access\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#a9b4b8\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"labels.icon\",\"stylers\":[{\"invert_lightness\":true},{\"saturation\":\"-7\"},{\"lightness\":\"3\"},{\"gamma\":\"1.80\"},{\"weight\":\"0.01\"}]},{\"featureType\":\"transit\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#a3c7df\"}]}]";

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    mapController.setMapStyle(MAP_STYLE);
    double miny =
        (_originLatitude <= _destLatitude) ? _originLatitude : _destLatitude;
    double minx = (_originLongitude <= _destLongitude)
        ? _originLongitude
        : _destLongitude;
    double maxy =
        (_originLatitude <= _destLatitude) ? _destLatitude : _originLatitude;
    double maxx =
        (_originLatitude <= _destLongitude) ? _destLongitude : _originLatitude;

    double southWestLatitude = miny;
    double southWestLongitude = minx;

    double northEastLatitude = maxy;
    double northEastLongitude = maxx;

    // Accommodate the two locations within the camera view of the map
    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: latlng.LatLng(northEastLatitude, northEastLongitude),
          southwest: latlng.LatLng(southWestLatitude, southWestLongitude),
        ),
        60.0,
      ),
    );

    // BitmapDescriptor pinLocationIcon = await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(), 'assets/images/location_blue.png');

    setState(() {
      for (int i = 0; i < waypoints.length; i++) {
        debugPrint('$i');
        if (i == 0) {
          _addMarker(
              latlng.LatLng(waypoints[i].latitude, waypoints[i].longitude),
              stopNames[i],
              markerIconStart,
              i + 1,
              stopNames[i]);
        } else if (i == (waypoints.length - 1)) {
          _addMarker(
              latlng.LatLng(waypoints[i].latitude, waypoints[i].longitude),
              stopNames[i],
              markerIconEnd,
              i + 1,
              stopNames[i]);
        } else {
          _addMarker(
              latlng.LatLng(waypoints[i].latitude, waypoints[i].longitude),
              stopNames[i],
              markerIcon,
              i + 1,
              stopNames[i]);
        }
      }
    });
  }

  _addMarker(latlng.LatLng position, String id, BitmapDescriptor descriptor,
      int number, String stopName) async {
    try {
      MarkerId markerId = MarkerId(id);
      Marker marker = Marker(
        markerId: markerId,
        icon: descriptor,
        position: position,
        infoWindow: InfoWindow(
          title: "Stop $number",
          snippet: stopName,
        ),
      );
      markers[markerId] = marker;
    } catch (e) {
      print('Error loading BitmapDescriptor: ' + e.toString());
      // Handle the error here, such as using a default marker icon
    }

    // setState(() {});
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: const Color(0xff0f0a34),
        points: polylineCoordinates,
        width: 3);
    polylines[id] = polyline;
    // geodesic = false;
    setState(() {});
  }

  _getPolyline() async {
    try {
      debugPrint(
          'Origin: ($_originLatitude, $_originLongitude), Dest: ($_destLatitude, $_destLongitude), APIKEY: $googleMapsApiKey , point1' +
              stopsLat[0].toString() +
              '  ,  point 2' +
              stopsLat.last.toString());
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          "AIzaSyCIMCOybLnjmCqxReCEQj-vByzVDlgmFnY",
          // googleMapsApiKey,
          PointLatLng(stopsLat[0], stopsLong[0]),
          PointLatLng(stopsLat.last, stopsLong.last),
          travelMode: TravelMode.driving,
          wayPoints: waypointsForLine);
      if (result.points.isNotEmpty) {
        polylineCoordinates = [];
        result.points.forEach((PointLatLng point) {
          polylineCoordinates
              .add(latlng.LatLng(point.latitude, point.longitude));
        });
      } else {
        debugPrint(result.errorMessage);
      }
      _addPolyLine();
    } catch (e) {
      debugPrint('Error during API call: $e');
    }
  }
}
