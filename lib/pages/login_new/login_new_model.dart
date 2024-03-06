import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_new_widget.dart' show LoginNewWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginNewModel extends FlutterFlowModel<LoginNewWidget> {
  ///  Local state fields for this page.

  String mobNumber = '-';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for mobileNumber widget.
  FocusNode? mobileNumberFocusNode;
  TextEditingController? mobileNumberController;
  final mobileNumberMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)? mobileNumberControllerValidator;
  String? _mobileNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c1hg5ed5' /* Field is required */,
      );
    }

    if (val.length < 12) {
      return FFLocalizations.of(context).getText(
        '4jcfpxe1' /* Enter the full mobile number */,
      );
    }
    if (val.length > 12) {
      return 'Maximum 12 characters allowed, currently ${val.length}.';
    }
    if (!RegExp('^\\d{3}-\\d{3}-\\d{4}\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '5qfizho1' /* Invalid number type */,
      );
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (createUser)] action in Button widget.
  ApiCallResponse? sendOTP;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    mobileNumberControllerValidator = _mobileNumberControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    mobileNumberFocusNode?.dispose();
    mobileNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
