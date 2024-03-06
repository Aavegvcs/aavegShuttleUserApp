import '/backend/api_requests/api_calls.dart';
import '/components/emergency_s_o_s/emergency_s_o_s_widget.dart';
import '/components/explore_routes/explore_routes_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-50.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 400.ms,
          duration: 600.ms,
          begin: const Offset(0.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 100.ms,
          duration: 600.ms,
          begin: const Offset(0.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0));
      setState(() {
        FFAppState().isUserLogged = true;
      });
      _model.actionLocationName = await LatLongLocationCall.call(
        lat: functions.getLatLong(currentUserLocationValue!, true).toString(),
        lng: functions.getLatLong(currentUserLocationValue!, false).toString(),
      );
      if ((_model.actionLocationName?.succeeded ?? true)) {
        setState(() {
          FFAppState().pickupLocation = getJsonField(
            (_model.actionLocationName?.jsonBody ?? ''),
            r'''$.results[0].formatted_address''',
          ).toString().toString();
          FFAppState().pickupLat =
              functions.getLatLong(currentUserLocationValue!, true).toString();
          FFAppState().pickupLong =
              functions.getLatLong(currentUserLocationValue!, false).toString();
        });
      }
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
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: const Color(0x7C000000),
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: const EmergencySOSWidget(),
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            elevation: 8.0,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.2, 0.03),
                    child: Icon(
                      Icons.sos_sharp,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      size: 24.0,
                    ),
                  ),
                  const Align(
                    alignment: AlignmentDirectional(-0.66, 0.49),
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(53.0),
            child: AppBar(
              backgroundColor: const Color(0xFFE9F2F9),
              automaticallyImplyLeading: false,
              title: Align(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Vector.png',
                    width: 112.0,
                    height: 28.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              actions: [
                Align(
                  alignment: const AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('notification_page');
                      },
                      child: const Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: SizedBox(
                      width: double.infinity,
                      height: 152.0,
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 152.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/backgroundSearch.png',
                                ).image,
                              ),
                            ),
                            child: Opacity(
                              opacity: 0.8,
                              child: ClipRect(
                                child: ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: 2.0,
                                    sigmaY: 2.0,
                                  ),
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 30.0,
                                      height: 152.0,
                                      child: Stack(
                                        children: [
                                          const Align(
                                            alignment: AlignmentDirectional(
                                                0.0, -0.52),
                                            child: Icon(
                                              Icons.circle_outlined,
                                              color: Colors.white,
                                              size: 18.0,
                                            ),
                                          ),
                                          const Align(
                                            alignment: AlignmentDirectional(
                                                0.17, 0.56),
                                            child: Icon(
                                              Icons.pin_drop_outlined,
                                              color: Colors.white,
                                              size: 28.0,
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.01, -0.33),
                                            child: Container(
                                              width: 2.0,
                                              height: 5.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF8694B7),
                                                border: Border.all(
                                                  color: const Color(0x00FFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.01, -0.23),
                                            child: Container(
                                              width: 2.0,
                                              height: 5.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF8694B7),
                                                border: Border.all(
                                                  color: const Color(0x00FFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.01, -0.13),
                                            child: Container(
                                              width: 2.0,
                                              height: 5.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF8694B7),
                                                border: Border.all(
                                                  color: const Color(0x00FFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.01, -0.03),
                                            child: Container(
                                              width: 2.0,
                                              height: 5.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF8694B7),
                                                border: Border.all(
                                                  color: const Color(0x00FFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.01, 0.07),
                                            child: Container(
                                              width: 2.0,
                                              height: 5.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF8694B7),
                                                border: Border.all(
                                                  color: const Color(0x00FFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.01, 0.17),
                                            child: Container(
                                              width: 2.0,
                                              height: 5.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF8694B7),
                                                border: Border.all(
                                                  color: const Color(0x00FFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: const AlignmentDirectional(
                                                0.01, 0.27),
                                            child: Container(
                                              width: 2.0,
                                              height: 5.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF8694B7),
                                                border: Border.all(
                                                  color: const Color(0x00FFFFFF),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).animateOnPageLoad(animationsMap[
                                    'columnOnPageLoadAnimation']!),
                              ),
                              Flexible(
                                flex: 4,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await requestPermission(
                                                locationPermission);

                                            context.pushNamed(
                                              'searchPagePickup',
                                              queryParameters: {
                                                'currentTrueOrFalse':
                                                    serializeParam(
                                                  true,
                                                  ParamType.bool,
                                                ),
                                                'setLocation': serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFDDDDDD),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nikqy4qa' /* Current Location */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation1']!),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await requestPermission(
                                                locationPermission);

                                            context.pushNamed(
                                              'searchPageDrop',
                                              queryParameters: {
                                                'currentTrueOrFalse':
                                                    serializeParam(
                                                  false,
                                                  ParamType.bool,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        13.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '8itcqrvl' /* Drop Location */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation2']!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150.0,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 150.0,
                          child: CarouselSlider(
                            items: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Group_48097402.jpg',
                                  width: 380.0,
                                  height: 250.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Banner2.jpg',
                                  width: 380.0,
                                  height: 250.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                            carouselController: _model.carouselController ??=
                                CarouselController(),
                            options: CarouselOptions(
                              initialPage: 1,
                              viewportFraction: 0.93,
                              disableCenter: false,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.15,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayInterval:
                                  const Duration(milliseconds: (800 + 4000)),
                              autoPlayCurve: Curves.linear,
                              pauseAutoPlayInFiniteScroll: true,
                              onPageChanged: (index, _) =>
                                  _model.carouselCurrentIndex = index,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  wrapWithModel(
                    model: _model.exploreRoutesModel,
                    updateCallback: () => setState(() {}),
                    child: const ExploreRoutesWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
