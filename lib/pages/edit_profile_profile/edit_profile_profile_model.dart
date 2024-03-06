import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_profile_widget.dart' show EditProfileProfileWidget;
import 'package:flutter/material.dart';

class EditProfileProfileModel
    extends FlutterFlowModel<EditProfileProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for homeAddress widget.
  FocusNode? homeAddressFocusNode;
  TextEditingController? homeAddressController;
  String? Function(BuildContext, String?)? homeAddressControllerValidator;
  // State field(s) for officeAddress widget.
  FocusNode? officeAddressFocusNode;
  TextEditingController? officeAddressController;
  String? Function(BuildContext, String?)? officeAddressControllerValidator;
  // Stores action output result for [Backend Call - API (editUser)] action in Button widget.
  ApiCallResponse? apiResultb9u;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    homeAddressFocusNode?.dispose();
    homeAddressController?.dispose();

    officeAddressFocusNode?.dispose();
    officeAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
