import '/flutter_flow/flutter_flow_util.dart';
import 'set_location_on_map_widget.dart' show SetLocationOnMapWidget;
import 'package:flutter/material.dart';

class SetLocationOnMapModel extends FlutterFlowModel<SetLocationOnMapWidget> {
  ///  Local state fields for this page.

  LatLng? latLng;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
