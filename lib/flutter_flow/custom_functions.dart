import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? seatPriceIncreaser(
  int? seats,
  String price,
) {
  if (seats == null) {
    return ("₹" + (int.parse(price)).toString());
  } else {
    return ("₹" + (int.parse(price) * seats).toString());
  }
}

String? priceForPayment(
  int? seats,
  String price,
) {
  if (seats == null) {
    return ("Pay ₹ " + (int.parse(price)).toString());
  } else {
    return ("Pay ₹ " + (int.parse(price) * seats).toString());
  }
}

List<LatLng>? latLongsFunction(
  List<double>? stopsLat,
  List<double>? stopsLng,
) {
  // return latitude and longitude combined
  if (stopsLat == null || stopsLng == null) {
    return null;
  }
  if (stopsLat.length != stopsLng.length) {
    return null;
  }
  final latLngs = <LatLng>[];
  for (var i = 0; i < stopsLat.length; i++) {
    latLngs.add(LatLng(stopsLat[i], stopsLng[i]));
  }
  print(latLngs);
  return latLngs;
}

String timeConvert(String time) {
  debugPrint(time);
  String timeString = time;
  DateTime parsedTime = DateFormat('HH:mm:ss').parse(timeString);
  String formattedTime = DateFormat('h:mm a').format(parsedTime);
  return formattedTime;
}

int lengthOfArray(List<String> list) {
  return list.length;
}

bool listCheck(List<dynamic>? list) {
  // create a custom function to check if the list is null to return an empty list.
  if (list == null) {
    return false;
  } else {
    return true;
  }
}

DateTime add3Days(DateTime currentTime) {
  // add 3 days to the current DateTime
  return currentTime.add(Duration(days: 3));
}

int? getPrice(
  int seatCount,
  String seatPrice,
) {
  var check = seatPrice.split(".");
  String value = check[0];
  // convert double value to int
  // create a function that multiplies the seatCount and seatPrice
  return seatCount * int.parse(value);
}

int convertDoubletoInt(String doubleValue) {
  var check = doubleValue.split(".");
  String value = check[0];
  // convert double value to int
  return int.parse(value);
}

String changeStringCharactersWithStar(String number) {
  // change first 6 characters of string to * and print the rest as it is
  String newString = '';
  if (number.length > 6) {
    newString = '******' + number.substring(6);
  } else {
    newString = '******';
  }
  return newString;
}

bool mobileNumberLengthCheck(String string) {
  // check whether the string length is 10 or not
  return string.length == 10;
}

double meterToKm(double meterDistance) {
  String result = (meterDistance / 1000).toStringAsFixed(2);
  return double.parse(result);
}

String getTheLastElementofListString(List<String> stringList) {
  // return the last element in the list as string
  return stringList.last;
}

List<dynamic> passDisplay(
  List<dynamic> listResult,
  int index,
) {
  // return the passArr key inside the object in list that is also a list
  return listResult[index]['passArr'];
}

List<dynamic>? findOutActiveNonActivePass(
  int acitveState,
  List<dynamic> listJson,
) {
  // check the list of json objects having a key of pass_status value equal to activeState
  List<dynamic> activePasses = [];
  List<dynamic> nonActivePasses = [];

  for (var pass in listJson) {
    if (pass['pass_status'] == acitveState) {
      activePasses.add(pass);
    } else {
      nonActivePasses.add(pass);
    }
  }

  return activePasses.isNotEmpty ? activePasses : null;
}

int ridesUsedFunction(
  int totalRides,
  int ridesUsed,
) {
  // create a function that returns the value of totalRides subtracted by ridesUsed
  return totalRides - ridesUsed;
}

String convertDateUTCtoReadable(String timeString) {
  // convert this type of timeString (2024-02-11T00:00:00.000Z) into this type of string (Jan 11,2024)
  final dateTime = DateTime.parse(timeString).toLocal();
  final formatter = DateFormat.yMMMMd();
  return formatter.format(dateTime);
}

double priceMultiply(
  String amount,
  int seats,
) {
  // multiply the amount after parsing it to int to the seats
  double parsedAmount = double.parse(amount);
  double totalPrice = parsedAmount * seats;
  return totalPrice;
}

double getLatLong(
  LatLng currentLocation,
  bool latOrLng,
) {
  // send the lat or lng as per the boolean value of latOrlng from the currentLocation
  if (latOrLng) {
    return currentLocation.latitude;
  } else {
    return currentLocation.longitude;
  }
}

String returnImagePath(String string) {
  return string.toString();
}

List<dynamic> return0() {
  return [
    {"value": 0}
  ];
}

String convertUTCforBackend(String timeString) {
  // convert this type of timeString (2024-02-11T00:00:00.000Z) into this type of string (2024-02-02)
  DateTime dateTime = DateTime.parse(timeString);
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}

String splitString(
  String stringReturn,
  bool firstOrSecond,
) {
  String data = stringReturn;

  List<String> words = data.split("-");
  if (firstOrSecond) {
    return words.first;
  } else {
    return words.last;
  }
}

int convertStringToInt(String routeString) {
  return int.parse(routeString);
}

String multiply2Double(
  String price,
  String discount,
) {
  // convert the string price and string discount to double and multiply both
  double priceDouble = double.parse(price);
  double discountDouble = double.parse(discount);
  return (priceDouble * discountDouble).toStringAsFixed(2);
}
