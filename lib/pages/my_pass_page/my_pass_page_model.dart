import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/request_manager.dart';

import 'my_pass_page_widget.dart' show MyPassPageWidget;
import 'package:flutter/material.dart';

class MyPassPageModel extends FlutterFlowModel<MyPassPageWidget> {
  ///  Local state fields for this page.

  int selectedPass = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? statusCheck;
  // Stores action output result for [Backend Call - API (buyPass)] action in myPassPage widget.
  ApiCallResponse? bookingCreated;

  /// Query cache managers for this widget.

  final _allPassDataManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allPassData({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allPassDataManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllPassDataCache() => _allPassDataManager.clear();
  void clearAllPassDataCacheKey(String? uniqueKey) =>
      _allPassDataManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    statusCheck?.cancel();

    /// Dispose query cache managers for this widget.

    clearAllPassDataCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
