import '/backend/api_requests/api_calls.dart';
import '/components/explore_routes/explore_routes_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool closeIcon = false;

  bool closeIcon1 = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (latLongLocation)] action in HomePage widget.
  ApiCallResponse? actionLocationName;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 1;

  // Model for ExploreRoutes component.
  late ExploreRoutesModel exploreRoutesModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    exploreRoutesModel = createModel(context, () => ExploreRoutesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    exploreRoutesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
