import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'tracking_page_model.dart';
export 'tracking_page_model.dart';

class TrackingPageWidget extends StatefulWidget {
  const TrackingPageWidget({
    super.key,
    required this.busID,
    required this.routeID,
    required this.tripID,
    required this.tripDate,
  });

  final String? busID;
  final String? routeID;
  final String? tripID;
  final String? tripDate;

  @override
  State<TrackingPageWidget> createState() => _TrackingPageWidgetState();
}

class _TrackingPageWidgetState extends State<TrackingPageWidget> {
  late TrackingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 5000),
        callback: (timer) async {
          _model.userTrackAPIResponse =
              await BaseChangeAPIsGroup.userTrackingAPICall.call(
            busID: widget.busID,
            routeID: widget.routeID,
            tripID: widget.tripID,
            tripDate: widget.tripDate,
          );
          if ((_model.userTrackAPIResponse?.succeeded ?? true)) {
            setState(() {
              FFAppState().userTrackingJSONObject = getJsonField(
                (_model.userTrackAPIResponse?.jsonBody ?? ''),
                r'''$''',
              );
            });
          }
        },
        startImmediately: true,
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Builder(
              builder: (context) {
                if (FFAppState().userTrackingJSONObject != null) {
                  return SizedBox(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.65,
                          child: custom_widgets.TestingWidget(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.65,
                            jsonObject: getJsonField(
                              FFAppState().userTrackingJSONObject,
                              r'''$''',
                            ),
                            busID: widget.busID!,
                            routeID: widget.routeID!,
                            tripID: widget.tripID!,
                            tripDate: widget.tripDate!,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.02),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 0.7,
                            child: custom_widgets.DraggableWidget(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 0.7,
                              jsonObject: getJsonField(
                                FFAppState().userTrackingJSONObject,
                                r'''$.stopsData.stops''',
                                true,
                              )!,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-0.88, -0.93),
                          child: Container(
                            width: 42.0,
                            height: 42.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFCECECE),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                setState(() {
                                  FFAppState().userTrackingJSONObject = null;
                                });
                                context.safePop();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, -1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/Vector.png',
                            width: MediaQuery.sizeOf(context).width * 0.5,
                            height: 200.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Lottie.asset(
                        'assets/lottie_animations/whiteBack.json',
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        fit: BoxFit.fitWidth,
                        animate: true,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
