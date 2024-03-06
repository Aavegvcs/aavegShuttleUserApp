import 'dart:async';

import 'serialization_util.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Aaveg_logo_2.gif',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'HomePage': ParameterData.none(),
  'my_rides': ParameterData.none(),
  'profile_page': ParameterData.none(),
  'notification_page': ParameterData.none(),
  'edit_profile_profile': (data) async => const ParameterData(
        allParams: {},
      ),
  'searchRoutesPage': ParameterData.none(),
  'RouteMapBookingPage': (data) async => ParameterData(
        allParams: {
          'routeID': getParameter<int>(data, 'routeID'),
        },
      ),
  'confirmRidePage': ParameterData.none(),
  'buyPassPageBookingProcess': (data) async => ParameterData(
        allParams: {
          'routeID': getParameter<String>(data, 'routeID'),
        },
      ),
  'myPassPage': ParameterData.none(),
  'languageSelectPage': ParameterData.none(),
  'RoutesPage': ParameterData.none(),
  'login_new': ParameterData.none(),
  'otpPageNew': (data) async => ParameterData(
        allParams: {
          'mobileNumber': getParameter<String>(data, 'mobileNumber'),
          'newUser': getParameter<bool>(data, 'newUser'),
        },
      ),
  'completeSignupNew': (data) async => ParameterData(
        allParams: {
          'mobileNumber': getParameter<String>(data, 'mobileNumber'),
        },
      ),
  'supportPage': ParameterData.none(),
  'trackingPage': (data) async => ParameterData(
        allParams: {
          'busID': getParameter<String>(data, 'busID'),
          'routeID': getParameter<String>(data, 'routeID'),
          'tripID': getParameter<String>(data, 'tripID'),
          'tripDate': getParameter<String>(data, 'tripDate'),
        },
      ),
  'searchPagePickup': (data) async => ParameterData(
        allParams: {
          'currentTrueOrFalse': getParameter<bool>(data, 'currentTrueOrFalse'),
          'setLocation': getParameter<bool>(data, 'setLocation'),
        },
      ),
  'setLocationOnMap': (data) async => ParameterData(
        allParams: {
          'pickupOrDrop': getParameter<bool>(data, 'pickupOrDrop'),
        },
      ),
  'TestingLiveTracking': ParameterData.none(),
  'EntireRoutePage': (data) async => ParameterData(
        allParams: {
          'routeID': getParameter<int>(data, 'routeID'),
          'pickUp': getParameter<String>(data, 'pickUp'),
          'drop': getParameter<String>(data, 'drop'),
        },
      ),
  'RouteBookingPage': ParameterData.none(),
  'searchPageDrop': (data) async => ParameterData(
        allParams: {
          'currentTrueOrFalse': getParameter<bool>(data, 'currentTrueOrFalse'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
