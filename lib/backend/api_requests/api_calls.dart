import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start baseChangeAPIs Group Code

class BaseChangeAPIsGroup {
  static String baseUrl = 'http://13.200.168.251:3000';
  static Map<String, String> headers = {};
  static CreateUserCall createUserCall = CreateUserCall();
  static VerifyOTPCall verifyOTPCall = VerifyOTPCall();
  static CreateBookingCall createBookingCall = CreateBookingCall();
  static GetAllPassCall getAllPassCall = GetAllPassCall();
  static GetUserPassCall getUserPassCall = GetUserPassCall();
  static GetUserBookingsCall getUserBookingsCall = GetUserBookingsCall();
  static ExploreRoutesCall exploreRoutesCall = ExploreRoutesCall();
  static CreateBookingByPassCall createBookingByPassCall =
      CreateBookingByPassCall();
  static UserTrackingAPICall userTrackingAPICall = UserTrackingAPICall();
  static DownloadInvoiceCall downloadInvoiceCall = DownloadInvoiceCall();
  static BuyPassCall buyPassCall = BuyPassCall();
  static GetAllRoutesCall getAllRoutesCall = GetAllRoutesCall();
  static GetUserDetailsCall getUserDetailsCall = GetUserDetailsCall();
  static SupportMessageCall supportMessageCall = SupportMessageCall();
  static SignUpApiCall signUpApiCall = SignUpApiCall();
  static EditUserCall editUserCall = EditUserCall();
}

class CreateUserCall {
  Future<ApiCallResponse> call({
    String? mobile = '',
  }) async {
    final ffApiRequestBody = '''
{
  "mobile": "$mobile"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createUser',
      apiUrl: '${BaseChangeAPIsGroup.baseUrl}/app/v1/user/createUser',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyOTPCall {
  Future<ApiCallResponse> call({
    String? mobile = '',
    int? otp,
  }) async {
    final ffApiRequestBody = '''
{
  "mobileNumber": "$mobile",
  "otp": $otp
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifyOTP',
      apiUrl: '${BaseChangeAPIsGroup.baseUrl}/app/v1/user/verifyOtp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateBookingCall {
  Future<ApiCallResponse> call({
    int? userID,
    String? userPickUpLocation = '',
    String? userDropLocation = '',
    String? busPickUpLocation = '',
    String? busDropLocation = '',
    String? bookingDate = '',
    int? routeID,
    String? userPickUpTime = '',
    String? userDropTime = '',
    double? usertostopdistance,
    double? busdroptouserdistance,
    int? totalseats,
    String? paymentid = '',
    int? busid,
    int? bookingtypeid,
    int? tripid,
    String? tripDate = '',
    String? startStop = '',
    String? endStop = '',
    double? amountExcludingGst,
    String? razorpayId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userid": $userID,
  "userpicklocation": "$userPickUpLocation",
  "userdroplocation": "$userDropLocation",
  "buspicklocation": "$busPickUpLocation",
  "busdroplocation": "$busDropLocation",
  "bookingstatus": 1,
  "bookingdate": "$bookingDate",
  "routeid": $routeID,
  "userpickuptime": "$userPickUpTime",
  "userdroptime": "$userDropTime",
  "usertostopdistance": $usertostopdistance,
  "busdroptouserdistance": $busdroptouserdistance,
  "totalseats": $totalseats,
  "paymentid": "$paymentid",
  "busid": $busid,
  "bookingtypeid": $bookingtypeid,
  "tripid": $tripid,
  "tripDate": "$tripDate",
  "startStop": "$startStop",
  "endStop": "$endStop",
  "amountExcludingGst": $amountExcludingGst,
  "razorpayId": "$razorpayId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createBooking',
      apiUrl: '${BaseChangeAPIsGroup.baseUrl}/app/v1/booking/createBooking',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic base(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetAllPassCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetAllPass',
      apiUrl:
          '${BaseChangeAPIsGroup.baseUrl}/app/v1/pass/getAllRoutesPassesAndStops',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic jsonObject(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetUserPassCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserPass',
      apiUrl:
          '${BaseChangeAPIsGroup.baseUrl}/app/v1/pass/getAllUserPasses/$userID',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? result(dynamic response) => getJsonField(
        response,
        r'''$.result[:]''',
        true,
      ) as List?;
  dynamic base(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetUserBookingsCall {
  Future<ApiCallResponse> call({
    int? userID,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserBookings',
      apiUrl:
          '${BaseChangeAPIsGroup.baseUrl}/app/v1/user/userBookings/$userID',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic base(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class ExploreRoutesCall {
  Future<ApiCallResponse> call({
    String? routeID = '',
  }) async {
    final ffApiRequestBody = '''
{
  "routeId":"$routeID"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ExploreRoutes',
      apiUrl:
          '${BaseChangeAPIsGroup.baseUrl}/app/v1/stops/getSpecificRouteStops',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic base(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class CreateBookingByPassCall {
  Future<ApiCallResponse> call({
    int? userID,
    String? userPickLocation = '',
    String? userdroplocation = '',
    String? buspicklocation = '',
    String? busdroplocation = '',
    int? bookingstatus,
    String? bookingdate = '',
    int? routeid,
    String? userpickuptime = '',
    String? userdroptime = '',
    double? usertostopdistance,
    double? busdroptouserdistance,
    int? totalseats,
    String? paymentid = '',
    int? busid,
    int? bookingtypeid,
    int? tripid,
    String? tripDate = '',
    String? startStop = '',
    String? endStop = '',
    double? amountExcludingGst,
    String? razorpayId = '',
    String? userBuyPassIds = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userid": $userID,
  "userpicklocation": "$userPickLocation",
  "userdroplocation": "$userdroplocation",
  "buspicklocation": "$buspicklocation",
  "busdroplocation": "$busdroplocation",
  "bookingstatus": $bookingstatus,
  "bookingdate": "$bookingdate",
  "routeid": $routeid,
  "userpickuptime": "$userpickuptime",
  "userdroptime": "$userdroptime",
  "usertostopdistance": $usertostopdistance,
  "busdroptouserdistance": $busdroptouserdistance,
  "totalseats": $totalseats,
  "paymentid": "$paymentid",
  "busid": $busid,
  "bookingtypeid": $bookingtypeid,
  "tripid": $tripid,
  "tripDate": "$tripDate",
  "startStop": "$startStop",
  "endStop": "$endStop",
  "amountExcludingGst": $amountExcludingGst,
  "razorpayId": "$razorpayId",
  "userBuyPassIds": "$userBuyPassIds"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createBookingByPass',
      apiUrl:
          '${BaseChangeAPIsGroup.baseUrl}/app/v1/booking/createBookingByPass',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UserTrackingAPICall {
  Future<ApiCallResponse> call({
    String? busID = '',
    String? routeID = '',
    String? tripID = '',
    String? tripDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "busId": "$busID",
  "routeId": "$routeID",
  "tripId": "$tripID",
  "tripDate": "$tripDate"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'userTrackingAPI',
      apiUrl: '${BaseChangeAPIsGroup.baseUrl}/app/v1/tripStatus/userTrack',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DownloadInvoiceCall {
  Future<ApiCallResponse> call({
    String? bookingID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'downloadInvoice',
      apiUrl:
          '${BaseChangeAPIsGroup.baseUrl}/app/v1/payments/generateInvoice/$bookingID',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BuyPassCall {
  Future<ApiCallResponse> call({
    int? passID,
    int? userId,
    int? routeId,
    String? paymentGatewayId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "paymentId": "$paymentGatewayId",
  "passId": $passID,
  "userId": $userId,
  "routeId": $routeId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'buyPass',
      apiUrl:
          '${BaseChangeAPIsGroup.baseUrl}/app/v1/pass/insBuyPassAndPassPayment',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllRoutesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAllRoutes',
      apiUrl: '${BaseChangeAPIsGroup.baseUrl}/app/v1/route/getAllRoutes',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic base(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetUserDetailsCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserDetails',
      apiUrl: '${BaseChangeAPIsGroup.baseUrl}/app/v1/user/userInfo/$userID',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SupportMessageCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? message = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userId": "$userID",
  "userMessage": "$message"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'supportMessage',
      apiUrl:
          '${BaseChangeAPIsGroup.baseUrl}/app/v1/usergrievance/sendUserGrievance',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SignUpApiCall {
  Future<ApiCallResponse> call({
    String? fullName = '',
    String? email = '',
    String? gender = '',
    String? mobileNumber = '',
    String? homeAddress = '',
    String? officeAddress = '',
  }) async {
    final ffApiRequestBody = '''
{
  "fullName": "$fullName",
  "email": "$email",
  "gender": "$gender",
  "mobileNumber": "$mobileNumber",
  "homeAddress": "$homeAddress",
  "officeAddress": "$officeAddress"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signUpApi',
      apiUrl: '${BaseChangeAPIsGroup.baseUrl}/app/v1/user/signupUserController',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class EditUserCall {
  Future<ApiCallResponse> call({
    int? userid,
    String? username = '',
    String? useremail = '',
    String? userhomeaddressline1 = '',
    String? userofficeaddressline1 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userid": $userid,
  "username": "$username",
  "useremail": "$useremail",
  "userhomeaddressline1": "$userhomeaddressline1",
  "userofficeaddressline1": "$userofficeaddressline1"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editUser',
      apiUrl: '${BaseChangeAPIsGroup.baseUrl}/app/v1/user/editUser',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End baseChangeAPIs Group Code

class LocationApiCall {
  static Future<ApiCallResponse> call({
    String? searchText = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'locationApi',
      apiUrl: 'http://13.200.168.251:3000/app/v1/google/$searchText',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? locations(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
  static List? locationPrediction(dynamic response) => getJsonField(
        response,
        r'''$.predictions''',
        true,
      ) as List?;
}

class GetLatLongCall {
  static Future<ApiCallResponse> call({
    String? placeID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getLatLong',
      apiUrl:
          'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeID&key=AIzaSyAXVR7rD8GXKZ2HBhLn8qOQ2Jj_-mPfWSo',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'placeID': placeID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchRouteApiCall {
  static Future<ApiCallResponse> call({
    String? pickUpLat = '',
    String? pickUpLng = '',
    String? dropLat = '',
    String? dropLng = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pickLat": "$pickUpLat",
  "pickLng": "$pickUpLng",
  "dropLat": "$dropLat",
  "dropLng": "$dropLng"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'searchRouteApi',
      apiUrl: 'http://13.200.168.251:3000/app/v1/route/sendValidUserRoutes',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic pathROutes(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetRouteTimingCall {
  static Future<ApiCallResponse> call({
    int? routeID,
    String? startPoint = '',
    String? endPoint = '',
    String? currentDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "routeId": $routeID,
  "todaysDate": "$currentDate",
  "startStop": "$startPoint",
  "endStop": "$endPoint",
  "userId": "1"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getRouteTiming',
      apiUrl: 'http://13.200.168.251:3000/app/v1/trip/getTripTime',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ParticularRoutePassCall {
  static Future<ApiCallResponse> call({
    String? routeID = '',
  }) async {
    final ffApiRequestBody = '''
{
  "routeId": "$routeID"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'particularRoutePass',
      apiUrl: 'http://13.200.168.251:3000/app/v1/pass/getPassByRouteId',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LatLongLocationCall {
  static Future<ApiCallResponse> call({
    String? lat = '',
    String? lng = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'latLongLocation',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyAXVR7rD8GXKZ2HBhLn8qOQ2Jj_-mPfWSo',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic base(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
