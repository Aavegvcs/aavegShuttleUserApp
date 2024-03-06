import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_routes_page_widget.dart' show SearchRoutesPageWidget;
import 'package:flutter/material.dart';

class SearchRoutesPageModel extends FlutterFlowModel<SearchRoutesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getLatLong)] action in searchRoutesPage widget.
  ApiCallResponse? apiResultpjj;
  // Stores action output result for [Backend Call - API (getLatLong)] action in searchRoutesPage widget.
  ApiCallResponse? apiResult2hz;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
