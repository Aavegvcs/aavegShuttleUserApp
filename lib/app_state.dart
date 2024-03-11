import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isUserLogged = prefs.getBool('ff_isUserLogged') ?? _isUserLogged;
    });
    _safeInit(() {
      _userID = prefs.getInt('ff_userID') ?? _userID;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _phoneNumber = '';
  String get phoneNumber => _phoneNumber;
  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String _pickupLocation = '';
  String get pickupLocation => _pickupLocation;
  set pickupLocation(String value) {
    _pickupLocation = value;
  }

  String _dropLocation = '';
  String get dropLocation => _dropLocation;
  set dropLocation(String value) {
    _dropLocation = value;
  }

  bool _pickupFlag = false;
  bool get pickupFlag => _pickupFlag;
  set pickupFlag(bool value) {
    _pickupFlag = value;
  }

  bool _dropFlag = false;
  bool get dropFlag => _dropFlag;
  set dropFlag(bool value) {
    _dropFlag = value;
  }

  String _reverseLocations = '';
  String get reverseLocations => _reverseLocations;
  set reverseLocations(String value) {
    _reverseLocations = value;
  }

  bool _maleorfemale = false;
  bool get maleorfemale => _maleorfemale;
  set maleorfemale(bool value) {
    _maleorfemale = value;
  }

  bool _resendOTP = false;
  bool get resendOTP => _resendOTP;
  set resendOTP(bool value) {
    _resendOTP = value;
  }

  String _latLng = '28.56177074637899, 77.0670181100069';
  String get latLng => _latLng;
  set latLng(String value) {
    _latLng = value;
  }

  List<double> _stopLat = [
    28.67955,
    28.6655,
    28.63278,
    28.63337,
    28.635674,
    28.62558,
    28.602329,
    28.44686,
    28.429045,
    28.419514,
    28.409691,
    28.402572
  ];
  List<double> get stopLat => _stopLat;
  set stopLat(List<double> value) {
    _stopLat = value;
  }

  void addToStopLat(double value) {
    _stopLat.add(value);
  }

  void removeFromStopLat(double value) {
    _stopLat.remove(value);
  }

  void removeAtIndexFromStopLat(int index) {
    _stopLat.removeAt(index);
  }

  void updateStopLatAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _stopLat[index] = updateFn(_stopLat[index]);
  }

  void insertAtIndexInStopLat(int index, double value) {
    _stopLat.insert(index, value);
  }

  List<double> _stopLng = [
    77.094597,
    77.09245,
    77.08142,
    77.08643,
    77.097055,
    77.10143,
    77.126148,
    77.03736,
    77.037085,
    77.040034,
    77.042909,
    77.044502
  ];
  List<double> get stopLng => _stopLng;
  set stopLng(List<double> value) {
    _stopLng = value;
  }

  void addToStopLng(double value) {
    _stopLng.add(value);
  }

  void removeFromStopLng(double value) {
    _stopLng.remove(value);
  }

  void removeAtIndexFromStopLng(int index) {
    _stopLng.removeAt(index);
  }

  void updateStopLngAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    _stopLng[index] = updateFn(_stopLng[index]);
  }

  void insertAtIndexInStopLng(int index, double value) {
    _stopLng.insert(index, value);
  }

  List<LatLng> _latLngForTesting = [
    const LatLng(37.7749, -122.4194),
    const LatLng(34.0522, -118.2437),
    const LatLng(41.8781, -87.6298)
  ];
  List<LatLng> get latLngForTesting => _latLngForTesting;
  set latLngForTesting(List<LatLng> value) {
    _latLngForTesting = value;
  }

  void addToLatLngForTesting(LatLng value) {
    _latLngForTesting.add(value);
  }

  void removeFromLatLngForTesting(LatLng value) {
    _latLngForTesting.remove(value);
  }

  void removeAtIndexFromLatLngForTesting(int index) {
    _latLngForTesting.removeAt(index);
  }

  void updateLatLngForTestingAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    _latLngForTesting[index] = updateFn(_latLngForTesting[index]);
  }

  void insertAtIndexInLatLngForTesting(int index, LatLng value) {
    _latLngForTesting.insert(index, value);
  }

  String _routeDistance = '';
  String get routeDistance => _routeDistance;
  set routeDistance(String value) {
    _routeDistance = value;
  }

  String _routeDuration = '';
  String get routeDuration => _routeDuration;
  set routeDuration(String value) {
    _routeDuration = value;
  }

  LatLng? _startLatLng = const LatLng(28.576885605691093, 77.0647441266656);
  LatLng? get startLatLng => _startLatLng;
  set startLatLng(LatLng? value) {
    _startLatLng = value;
  }

  LatLng? _endLatLng = const LatLng(28.44693487277288, 77.03309886249731);
  LatLng? get endLatLng => _endLatLng;
  set endLatLng(LatLng? value) {
    _endLatLng = value;
  }

  String _pickupPlaceID = '';
  String get pickupPlaceID => _pickupPlaceID;
  set pickupPlaceID(String value) {
    _pickupPlaceID = value;
  }

  String _dropPlaceID = '';
  String get dropPlaceID => _dropPlaceID;
  set dropPlaceID(String value) {
    _dropPlaceID = value;
  }

  String _pickupLat = '';
  String get pickupLat => _pickupLat;
  set pickupLat(String value) {
    _pickupLat = value;
  }

  String _pickupLong = '';
  String get pickupLong => _pickupLong;
  set pickupLong(String value) {
    _pickupLong = value;
  }

  String _dropLat = '';
  String get dropLat => _dropLat;
  set dropLat(String value) {
    _dropLat = value;
  }

  String _dropLong = '';
  String get dropLong => _dropLong;
  set dropLong(String value) {
    _dropLong = value;
  }

  dynamic _routeJsonObject;
  dynamic get routeJsonObject => _routeJsonObject;
  set routeJsonObject(dynamic value) {
    _routeJsonObject = value;
  }

  dynamic _tripTimingData;
  dynamic get tripTimingData => _tripTimingData;
  set tripTimingData(dynamic value) {
    _tripTimingData = value;
  }

  int _paymentStatus = 0;
  int get paymentStatus => _paymentStatus;
  set paymentStatus(int value) {
    _paymentStatus = value;
  }

  String _paymentID = '';
  String get paymentID => _paymentID;
  set paymentID(String value) {
    _paymentID = value;
  }

  int _passSelectValue = 0;
  int get passSelectValue => _passSelectValue;
  set passSelectValue(int value) {
    _passSelectValue = value;
  }

  bool _isUserLogged = false;
  bool get isUserLogged => _isUserLogged;
  set isUserLogged(bool value) {
    _isUserLogged = value;
    prefs.setBool('ff_isUserLogged', value);
  }

  int _userID = 0;
  int get userID => _userID;
  set userID(int value) {
    _userID = value;
    prefs.setInt('ff_userID', value);
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  int _seatsBooked = 0;
  int get seatsBooked => _seatsBooked;
  set seatsBooked(int value) {
    _seatsBooked = value;
  }

  String _selectedDateforBooking = '';
  String get selectedDateforBooking => _selectedDateforBooking;
  set selectedDateforBooking(String value) {
    _selectedDateforBooking = value;
  }

  double _paymentAmount = 0.0;
  double get paymentAmount => _paymentAmount;
  set paymentAmount(double value) {
    _paymentAmount = value;
  }

  String _selectLocationValue = '';
  String get selectLocationValue => _selectLocationValue;
  set selectLocationValue(String value) {
    _selectLocationValue = value;
  }

  LatLng? _selectLatLng = const LatLng(28.48275860799908, 77.10528608267425);
  LatLng? get selectLatLng => _selectLatLng;
  set selectLatLng(LatLng? value) {
    _selectLatLng = value;
  }

  dynamic _userTrackingJSONObject;
  dynamic get userTrackingJSONObject => _userTrackingJSONObject;
  set userTrackingJSONObject(dynamic value) {
    _userTrackingJSONObject = value;
  }

  dynamic _buyPassObject;
  dynamic get buyPassObject => _buyPassObject;
  set buyPassObject(dynamic value) {
    _buyPassObject = value;
  }

  dynamic _testingJsonObject = jsonDecode(
      '{\"result\":[{\"route_id\":2,\"routeStartTime\":\"07:30:00\",\"routeEndTime\":\"09:00:00\",\"routeNumber\":211,\"userPickPoint\":\"Candor Tech Space/Infotech Centre\",\"userDropPoint\":\"Guru Dronacharya Metro Station\",\"userPickPointDistance\":2830.6994607320285,\"userDropPointDistance\":274.94467040779585,\"stops\":[{\"stopName\":\"India Bulls Enigma\",\"stopLat\":\"28.5013242281\",\"stopLng\":\"77.0095010145\"},{\"stopName\":\"International City Sobha\",\"stopLat\":\"28.5133001848\",\"stopLng\":\"76.9964963241\"},{\"stopName\":\"ATS Tourmaline\",\"stopLat\":\"28.5151625356\",\"stopLng\":\"77.0030085830\"},{\"stopName\":\"Chintels Serenity\",\"stopLat\":\"28.5141691260\",\"stopLng\":\"77.0045642642\"},{\"stopName\":\"Brisk Lumbini\",\"stopLat\":\"28.5130236885\",\"stopLng\":\"77.0062594203\"},{\"stopName\":\"Sobha International city Block A Sector 109\",\"stopLat\":\"28.5122738145\",\"stopLng\":\"77.0073085398\"},{\"stopName\":\"Raheja Atharva Sector 109 Gurugram\",\"stopLat\":\"28.5095608949\",\"stopLng\":\"77.0056178052\"},{\"stopName\":\"ATS Kocoon\",\"stopLat\":\"28.5088283811\",\"stopLng\":\"77.0044141427\"},{\"stopName\":\"Caladium\",\"stopLat\":\"28.5079302433\",\"stopLng\":\"77.0031688865\"},{\"stopName\":\"Candor Tech Space/Infotech Centre\",\"stopLat\":\"28.5092360099\",\"stopLng\":\"77.0730162914\"},{\"stopName\":\"DLF Cyber Park\",\"stopLat\":\"28.5021695927\",\"stopLng\":\"77.0898712929\"},{\"stopName\":\"Ambiance Mall\",\"stopLat\":\"28.5054270860\",\"stopLng\":\"77.0951069649\"},{\"stopName\":\"DLF Downtown Gurugram\",\"stopLat\":\"28.5049981020\",\"stopLng\":\"77.0949567611\"},{\"stopName\":\"Cyber Hub\",\"stopLat\":\"28.4988957990\",\"stopLng\":\"77.0902003672\"},{\"stopName\":\"Building No. 9A/9B\",\"stopLat\":\"28.4964442869\",\"stopLng\":\"77.0921315577\"},{\"stopName\":\"Cyber Green\",\"stopLat\":\"28.4933609580\",\"stopLng\":\"77.0920296337\"},{\"stopName\":\"Building No. 5 Cyber city\",\"stopLat\":\"28.4890076790\",\"stopLng\":\"77.0911595951\"},{\"stopName\":\"Guru Dronacharya Metro Station\",\"stopLat\":\"28.4822909297\",\"stopLng\":\"77.1025285839\"}]}]}');
  dynamic get testingJsonObject => _testingJsonObject;
  set testingJsonObject(dynamic value) {
    _testingJsonObject = value;
  }

  bool _setLocation = false;
  bool get setLocation => _setLocation;
  set setLocation(bool value) {
    _setLocation = value;
  }

  final _profileDataManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> profileData({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _profileDataManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfileDataCache() => _profileDataManager.clear();
  void clearProfileDataCacheKey(String? uniqueKey) =>
      _profileDataManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
