import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'confirm_ride_page_widget.dart' show ConfirmRidePageWidget;
import 'package:flutter/material.dart';

class ConfirmRidePageModel extends FlutterFlowModel<ConfirmRidePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? statusCheck;
  // Stores action output result for [Backend Call - API (createBooking)] action in confirmRidePage widget.
  ApiCallResponse? bookingCreated;
  // Stores action output result for [Backend Call - API (createBookingByPass)] action in confirmRidePage widget.
  ApiCallResponse? bookingCreated1;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    statusCheck?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
