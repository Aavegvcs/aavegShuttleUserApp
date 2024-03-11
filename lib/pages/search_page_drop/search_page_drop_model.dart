import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_page_drop_widget.dart' show SearchPageDropWidget;
import 'package:flutter/material.dart';

class SearchPageDropModel extends FlutterFlowModel<SearchPageDropWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (latLongLocation)] action in searchPageDrop widget.
  ApiCallResponse? apiResult1se;
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
  // Stores action output result for [Backend Call - API (latLongLocation)] action in Container widget.
  ApiCallResponse? latLongAPI;

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
