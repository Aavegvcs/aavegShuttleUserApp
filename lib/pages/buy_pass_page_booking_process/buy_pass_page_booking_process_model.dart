import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'buy_pass_page_booking_process_widget.dart'
    show BuyPassPageBookingProcessWidget;
import 'package:flutter/material.dart';

class BuyPassPageBookingProcessModel
    extends FlutterFlowModel<BuyPassPageBookingProcessWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? statusCheck;

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
