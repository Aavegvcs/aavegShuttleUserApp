// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RouteDataSelectedStruct extends FFFirebaseStruct {
  RouteDataSelectedStruct({
    int? routeId,
    String? routeStartTime,
    String? routeEndTime,
    String? userPickPoint,
    String? userDropPoint,
    double? userPickPointDistance,
    double? userDropPointDistance,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _routeId = routeId,
        _routeStartTime = routeStartTime,
        _routeEndTime = routeEndTime,
        _userPickPoint = userPickPoint,
        _userDropPoint = userDropPoint,
        _userPickPointDistance = userPickPointDistance,
        _userDropPointDistance = userDropPointDistance,
        super(firestoreUtilData);

  // "route_id" field.
  int? _routeId;
  int get routeId => _routeId ?? 0;
  set routeId(int? val) => _routeId = val;
  void incrementRouteId(int amount) => _routeId = routeId + amount;
  bool hasRouteId() => _routeId != null;

  // "routeStartTime" field.
  String? _routeStartTime;
  String get routeStartTime => _routeStartTime ?? '';
  set routeStartTime(String? val) => _routeStartTime = val;
  bool hasRouteStartTime() => _routeStartTime != null;

  // "routeEndTime" field.
  String? _routeEndTime;
  String get routeEndTime => _routeEndTime ?? '';
  set routeEndTime(String? val) => _routeEndTime = val;
  bool hasRouteEndTime() => _routeEndTime != null;

  // "userPickPoint" field.
  String? _userPickPoint;
  String get userPickPoint => _userPickPoint ?? '';
  set userPickPoint(String? val) => _userPickPoint = val;
  bool hasUserPickPoint() => _userPickPoint != null;

  // "userDropPoint" field.
  String? _userDropPoint;
  String get userDropPoint => _userDropPoint ?? '';
  set userDropPoint(String? val) => _userDropPoint = val;
  bool hasUserDropPoint() => _userDropPoint != null;

  // "userPickPointDistance" field.
  double? _userPickPointDistance;
  double get userPickPointDistance => _userPickPointDistance ?? 0.0;
  set userPickPointDistance(double? val) => _userPickPointDistance = val;
  void incrementUserPickPointDistance(double amount) =>
      _userPickPointDistance = userPickPointDistance + amount;
  bool hasUserPickPointDistance() => _userPickPointDistance != null;

  // "userDropPointDistance" field.
  double? _userDropPointDistance;
  double get userDropPointDistance => _userDropPointDistance ?? 0.0;
  set userDropPointDistance(double? val) => _userDropPointDistance = val;
  void incrementUserDropPointDistance(double amount) =>
      _userDropPointDistance = userDropPointDistance + amount;
  bool hasUserDropPointDistance() => _userDropPointDistance != null;

  static RouteDataSelectedStruct fromMap(Map<String, dynamic> data) =>
      RouteDataSelectedStruct(
        routeId: castToType<int>(data['route_id']),
        routeStartTime: data['routeStartTime'] as String?,
        routeEndTime: data['routeEndTime'] as String?,
        userPickPoint: data['userPickPoint'] as String?,
        userDropPoint: data['userDropPoint'] as String?,
        userPickPointDistance:
            castToType<double>(data['userPickPointDistance']),
        userDropPointDistance:
            castToType<double>(data['userDropPointDistance']),
      );

  static RouteDataSelectedStruct? maybeFromMap(dynamic data) => data is Map
      ? RouteDataSelectedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'route_id': _routeId,
        'routeStartTime': _routeStartTime,
        'routeEndTime': _routeEndTime,
        'userPickPoint': _userPickPoint,
        'userDropPoint': _userDropPoint,
        'userPickPointDistance': _userPickPointDistance,
        'userDropPointDistance': _userDropPointDistance,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'route_id': serializeParam(
          _routeId,
          ParamType.int,
        ),
        'routeStartTime': serializeParam(
          _routeStartTime,
          ParamType.String,
        ),
        'routeEndTime': serializeParam(
          _routeEndTime,
          ParamType.String,
        ),
        'userPickPoint': serializeParam(
          _userPickPoint,
          ParamType.String,
        ),
        'userDropPoint': serializeParam(
          _userDropPoint,
          ParamType.String,
        ),
        'userPickPointDistance': serializeParam(
          _userPickPointDistance,
          ParamType.double,
        ),
        'userDropPointDistance': serializeParam(
          _userDropPointDistance,
          ParamType.double,
        ),
      }.withoutNulls;

  static RouteDataSelectedStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RouteDataSelectedStruct(
        routeId: deserializeParam(
          data['route_id'],
          ParamType.int,
          false,
        ),
        routeStartTime: deserializeParam(
          data['routeStartTime'],
          ParamType.String,
          false,
        ),
        routeEndTime: deserializeParam(
          data['routeEndTime'],
          ParamType.String,
          false,
        ),
        userPickPoint: deserializeParam(
          data['userPickPoint'],
          ParamType.String,
          false,
        ),
        userDropPoint: deserializeParam(
          data['userDropPoint'],
          ParamType.String,
          false,
        ),
        userPickPointDistance: deserializeParam(
          data['userPickPointDistance'],
          ParamType.double,
          false,
        ),
        userDropPointDistance: deserializeParam(
          data['userDropPointDistance'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'RouteDataSelectedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RouteDataSelectedStruct &&
        routeId == other.routeId &&
        routeStartTime == other.routeStartTime &&
        routeEndTime == other.routeEndTime &&
        userPickPoint == other.userPickPoint &&
        userDropPoint == other.userDropPoint &&
        userPickPointDistance == other.userPickPointDistance &&
        userDropPointDistance == other.userDropPointDistance;
  }

  @override
  int get hashCode => const ListEquality().hash([
        routeId,
        routeStartTime,
        routeEndTime,
        userPickPoint,
        userDropPoint,
        userPickPointDistance,
        userDropPointDistance
      ]);
}

RouteDataSelectedStruct createRouteDataSelectedStruct({
  int? routeId,
  String? routeStartTime,
  String? routeEndTime,
  String? userPickPoint,
  String? userDropPoint,
  double? userPickPointDistance,
  double? userDropPointDistance,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RouteDataSelectedStruct(
      routeId: routeId,
      routeStartTime: routeStartTime,
      routeEndTime: routeEndTime,
      userPickPoint: userPickPoint,
      userDropPoint: userDropPoint,
      userPickPointDistance: userPickPointDistance,
      userDropPointDistance: userDropPointDistance,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RouteDataSelectedStruct? updateRouteDataSelectedStruct(
  RouteDataSelectedStruct? routeDataSelected, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    routeDataSelected
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRouteDataSelectedStructData(
  Map<String, dynamic> firestoreData,
  RouteDataSelectedStruct? routeDataSelected,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (routeDataSelected == null) {
    return;
  }
  if (routeDataSelected.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && routeDataSelected.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final routeDataSelectedData =
      getRouteDataSelectedFirestoreData(routeDataSelected, forFieldValue);
  final nestedData =
      routeDataSelectedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = routeDataSelected.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRouteDataSelectedFirestoreData(
  RouteDataSelectedStruct? routeDataSelected, [
  bool forFieldValue = false,
]) {
  if (routeDataSelected == null) {
    return {};
  }
  final firestoreData = mapToFirestore(routeDataSelected.toMap());

  // Add any Firestore field values
  routeDataSelected.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRouteDataSelectedListFirestoreData(
  List<RouteDataSelectedStruct>? routeDataSelecteds,
) =>
    routeDataSelecteds
        ?.map((e) => getRouteDataSelectedFirestoreData(e, true))
        .toList() ??
    [];
