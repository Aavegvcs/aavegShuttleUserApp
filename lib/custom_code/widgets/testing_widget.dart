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

// Imports other custom widgets

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
import 'package:http/http.dart' as http;

import 'package:json_annotation/json_annotation.dart';

class TestingWidget extends StatefulWidget {
  const TestingWidget({
    super.key,
    this.width,
    this.height,
    required this.jsonObject,
    required this.busID,
    required this.routeID,
    required this.tripID,
    required this.tripDate,
  });

  final double? width;
  final double? height;
  final dynamic jsonObject;
  final String busID;
  final String routeID;
  final String tripID;
  final String tripDate;

  @override
  State<TestingWidget> createState() => _TestingWidgetState();
}

class Stop {
  List<dynamic> onBoardingArr;
  List<dynamic> offBoardingArr;
  int onBoardingNumber;
  int offBoardingNumber;
  String stopName;
  int stopStatus;
  dynamic stopID;
  String stopLat;
  String stopLong;
  int seats;
  int distanceMeter;
  String eta;
  String checkForEta;
  String stopReachTime;
  String id;

  Stop({
    required this.onBoardingArr,
    required this.offBoardingArr,
    required this.onBoardingNumber,
    required this.offBoardingNumber,
    required this.stopName,
    required this.stopStatus,
    required this.stopID,
    required this.stopLat,
    required this.stopLong,
    required this.seats,
    required this.distanceMeter,
    required this.eta,
    required this.checkForEta,
    required this.stopReachTime,
    required this.id,
  });

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
      onBoardingArr: json['onBoardingArr'],
      offBoardingArr: json['offBoardingArr'],
      onBoardingNumber: json['onBoardingNumber'],
      offBoardingNumber: json['offBoardingNumber'],
      stopName: json['stopName'],
      stopStatus: json['stopStatus'],
      stopID: json['stopID'],
      stopLat: json['stopLat'],
      stopLong: json['stopLong'],
      seats: json['seats'],
      distanceMeter: json['distanceMeter'],
      eta: json['eta'],
      checkForEta: json['checkForEta'],
      stopReachTime: json['stopReachTime'],
      id: json['_id'],
    );
  }
}

class _TestingWidgetState extends State<TestingWidget> {
  final String apiUrl =
      'http://13.200.168.251:3000/app/v1/tripStatus/userTrack';
  late latlng.LatLng dynamicMarkerPosition;
  late StreamSubscription<dynamic> _subscription;
  late GoogleMapController mapController;

  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<latlng.LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  late final CameraPosition _initialLocation;

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconStart = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconEnd = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconBus = BitmapDescriptor.defaultMarker;
  BitmapDescriptor markerIconDisabled = BitmapDescriptor.defaultMarker;

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

  List<Stop> stops = [];
  List<int> stopStatusList = [];
  List<latlng.LatLng> waypoints = [];
  List<double> stopsLat = [];
  List<double> stopsLong = [];
  List<String> stopNames = [];
  List<PolylineWayPoint> waypointsForLine = [];

  late var stopData;

  fetchData() async {
    print('fetchData Called');
    try {
      print('Before Response');
      // final response = await http.get(Uri.parse(apiUrl));
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "busId": widget.busID,
          "routeId": widget.routeID,
          "tripId": widget.tripID,
          "tripDate": widget.tripDate,
        }),
      );
      print('After Response' + response.statusCode.toString());
      if (response.statusCode == 200) {
        print('Inside If Condition');
        final data = jsonDecode(response.body);
        final latitude = double.parse(data['busTrackingData']['latitude']);
        final longitude = double.parse(data['busTrackingData']['longitude']);
        // final latitude = data['latitude'] as double;
        // final longitude = data['longitude'] as double;
        print(' ' + latitude.toString() + ' ' + longitude.toString());
        setState(() {
          dynamicMarkerPosition = latlng.LatLng(latitude, longitude);
          if (data['busTrackingData'] != null &&
              data['busTrackingData'].isNotEmpty) {
            debugPrint('Entered IF ELSE');
            _addMarker(dynamicMarkerPosition, 'hello', markerIconBus, 0,
                data['busTrackingData']['name']);
          }
          var stopData = data['stopsData']['stops'] as List;
          List<Stop> stopsList =
              stopData.map((stopJson) => Stop.fromJson(stopJson)).toList();

          stopsList.asMap().forEach((index, route) {
            var waypoint = latlng.LatLng(
                double.parse(route.stopLat), double.parse(route.stopLong));
            var stopNameFetched = route.stopName.toString();
            waypoints[index] = waypoint;
            stopNames[index] = stopNameFetched;
            var lat = double.parse(route.stopLat);
            stopsLat[index] = lat;
            var lng = double.parse(route.stopLong);
            stopsLong[index] = lng;
            var stopStatus = route.stopStatus;
            stopStatusList[index] = stopStatus;
            if (index != 0 || index != stops.length - 1) {
              var waypointsForLinevar = PolylineWayPoint(location: '$lat,$lng');
              waypointsForLine[index] = waypointsForLinevar;
            }
            // if (index == 0) {
            //   // stopsLat[0] = double.parse(route.stopLat);
            //   // _originLongitude = double.parse(route.stopLong);
            //   final _startCoordinate = latlng.LatLng(
            //     double.parse(route.stopLat),
            //     double.parse(route.stopLong),
            //   );
            //   _initialLocation = CameraPosition(
            //     target: _startCoordinate,
            //     zoom: 14,
            //   );
            // }
            // if (index == stops.length - 1) {
            //   setState(() {
            //     stopsLat.last = double.parse(route.stopLat);
            //     _destLongitude = double.parse(route.stopLng);
            //   });
            // }
          });
        });
        setState(() {
          _addMarker(
              latlng.LatLng(waypoints[0].latitude, waypoints[0].longitude),
              stopNames[0],
              markerIconStart,
              1,
              stopNames[0]);
          _addMarker(
              latlng.LatLng(waypoints[waypoints.length - 1].latitude,
                  waypoints[waypoints.length - 1].longitude),
              stopNames[waypoints.length - 1],
              markerIconEnd,
              waypoints.length,
              stopNames[waypoints.length - 1]);
          for (int i = 0; i < waypoints.length; i++) {
            debugPrint('$i');
            if (i != 0 && i != (waypoints.length - 1)) {
              debugPrint('Hello World $i');
              if (stopStatusList[i] == 0) {
                _addMarker(
                    latlng.LatLng(
                        waypoints[i].latitude, waypoints[i].longitude),
                    stopNames[i],
                    markerIconDisabled,
                    i + 1,
                    stopNames[i]);
              } else {
                _addMarker(
                    latlng.LatLng(
                        waypoints[i].latitude, waypoints[i].longitude),
                    stopNames[i],
                    markerIcon,
                    i + 1,
                    stopNames[i]);
              }
            }
          }
          // if (widget.jsonObject['busTrackingData'] != null &&
          //     widget.jsonObject['busTrackingData'].isNotEmpty) {
          //   debugPrint('Entered IF ELSE');
          //   _addMarker(dynamicMarkerPosition, 'hello', markerIconBus);
          // }
        });
        print('Entered FetchData');
      } else {
        print('Else ka error');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(100, 100)),
            "assets/images/mid_blue.png")
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
            "assets/images/mid_grey.png")
        .then(
      (icon) {
        print(icon);
        setState(() {
          markerIconDisabled = icon;
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
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(100, 100)),
            "assets/images/busLocation.png")
        .then(
      (icon) {
        print(icon);
        setState(() {
          markerIconBus = icon;
        });
      },
    );
  }

  @override
  void initState() {
    // _getPolyline();
    var stopData = widget.jsonObject['stopsData']['stops'] as List;
    List<Stop> stopsList =
        stopData.map((stopJson) => Stop.fromJson(stopJson)).toList();

    stopsList.asMap().forEach((index, route) {
      var waypoint = latlng.LatLng(
          double.parse(route.stopLat), double.parse(route.stopLong));
      var stopNameFetched = route.stopName.toString();
      waypoints.add(waypoint);
      stopNames.add(stopNameFetched);
      var lat = double.parse(route.stopLat);
      stopsLat.add(lat);
      var lng = double.parse(route.stopLong);
      stopsLong.add(lng);
      var stopStatus = route.stopStatus;
      stopStatusList.add(stopStatus);
      if (index != 0 || index != stops.length - 1) {
        var waypointsForLinevar = PolylineWayPoint(location: '$lat,$lng');
        waypointsForLine.add(waypointsForLinevar);
      }
    });

    _getPolyline();
    dynamicMarkerPosition = latlng.LatLng(40.74, -74.1); // Default position
    debugPrint('Entered initState');
    // Fetch initial data and subscribe for updates
    fetchData();
    _subscription =
        Stream<dynamic>.periodic(const Duration(seconds: 15), (timer) {
      fetchData();
    }).listen(null);
    debugPrint(widget.jsonObject.toString());
    addCustomIcon();

    super.initState();
    final _startCoordinate = latlng.LatLng(
      28.711,
      77.7711,
    );
    _initialLocation = CameraPosition(
      target: _startCoordinate,
      zoom: 14,
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _initialLocation,
      myLocationEnabled: true,
      tiltGesturesEnabled: true,
      compassEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
      onMapCreated: _onMapCreated,
      markers: Set<Marker>.of(markers.values),
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
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
    );
  }

  // final MAP_STYLE =
  //     "[{\"featureType\":\"all\",\"elementType\":\"labels.text\",\"stylers\":[{\"color\":\"#878787\"}]},{\"featureType\":\"all\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"landscape\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#f9f5ed\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#f5f5f5\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#c9c9c9\"}]},{\"featureType\":\"water\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#aee0f4\"}]}]";

  final MAP_STYLE =
      "[{\"featureType\":\"all\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#7c93a3\"},{\"lightness\":\"-10\"}]},{\"featureType\":\"administrative.country\",\"elementType\":\"geometry\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"administrative.country\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#a0a4a5\"}]},{\"featureType\":\"administrative.province\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#62838e\"}]},{\"featureType\":\"landscape\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#dde3e3\"}]},{\"featureType\":\"landscape.man_made\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#3f4a51\"},{\"weight\":\"0.30\"}]},{\"featureType\":\"poi\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"simplified\"}]},{\"featureType\":\"poi.attraction\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"poi.business\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.government\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.park\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"poi.place_of_worship\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.school\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"poi.sports_complex\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road\",\"elementType\":\"all\",\"stylers\":[{\"saturation\":\"-100\"},{\"visibility\":\"on\"}]},{\"featureType\":\"road\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#bbcacf\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"lightness\":\"0\"},{\"color\":\"#bbcacf\"},{\"weight\":\"0.50\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"labels\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"labels.text\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"road.highway.controlled_access\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.highway.controlled_access\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#a9b4b8\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"labels.icon\",\"stylers\":[{\"invert_lightness\":true},{\"saturation\":\"-7\"},{\"lightness\":\"3\"},{\"gamma\":\"1.80\"},{\"weight\":\"0.01\"}]},{\"featureType\":\"transit\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#a3c7df\"}]}]";

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    mapController.setMapStyle(MAP_STYLE);
    double miny = (stopsLat[0] <= stopsLat.last) ? stopsLat[0] : stopsLat.last;
    double minx =
        (stopsLong[0] <= stopsLong.last) ? stopsLong[0] : stopsLong.last;
    double maxy = (stopsLat[0] <= stopsLat.last) ? stopsLat.last : stopsLat[0];
    double maxx =
        (stopsLat[0] <= stopsLong.last) ? stopsLong.last : stopsLat[0];

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
          title: number == 0 ? "Bus" : "Stop $number",
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
        color: Color(0xff0f0a34),
        points: polylineCoordinates,
        width: 3);
    polylines[id] = polyline;
    // geodesic = false;
    setState(() {});
  }

  _getPolyline() async {
    try {
      // debugPrint(
      //     'Origin: ($stopsLat[0], $_originLongitude), Dest: ($stopsLat.last, $_destLongitude), APIKEY: $googleMapsApiKey');
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
      Map<String, dynamic> polylineResultToJson(PolylineResult result) {
        return {
          'points': result.points
              .map((point) => {'lat': point.latitude, 'lng': point.longitude})
              .toList(),
          // Add other properties if needed
        };
      }

      debugPrint(
          'Polylines :-      ' + polylineResultToJson(result).toString());
      _addPolyLine();
    } catch (e) {
      debugPrint('Error during API call: $e');
    }
  }
}
