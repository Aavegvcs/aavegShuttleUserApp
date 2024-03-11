import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_page_pickup_widget.dart' show SearchPagePickupWidget;
import 'package:flutter/material.dart';

class SearchPagePickupModel extends FlutterFlowModel<SearchPagePickupWidget> {
  ///  Local state fields for this page.

  bool setLocation = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for pickupLocation widget.
  FocusNode? pickupLocationFocusNode;
  TextEditingController? pickupLocationController;
  String? Function(BuildContext, String?)? pickupLocationControllerValidator;
  // State field(s) for dropLocation widget.
  FocusNode? dropLocationFocusNode;
  TextEditingController? dropLocationController;
  String? Function(BuildContext, String?)? dropLocationControllerValidator;
  // Stores action output result for [Backend Call - API (latLongLocation)] action in Container widget.
  ApiCallResponse? apiResult1seCopy;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    pickupLocationFocusNode?.dispose();
    pickupLocationController?.dispose();

    dropLocationFocusNode?.dispose();
    dropLocationController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
