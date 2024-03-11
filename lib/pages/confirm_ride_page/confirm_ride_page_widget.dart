import '/backend/api_requests/api_calls.dart';
import '/components/make_payment_component/make_payment_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'confirm_ride_page_model.dart';
export 'confirm_ride_page_model.dart';

class ConfirmRidePageWidget extends StatefulWidget {
  const ConfirmRidePageWidget({super.key});

  @override
  State<ConfirmRidePageWidget> createState() => _ConfirmRidePageWidgetState();
}

class _ConfirmRidePageWidgetState extends State<ConfirmRidePageWidget> {
  late ConfirmRidePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmRidePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.statusCheck = InstantTimer.periodic(
        duration: const Duration(milliseconds: 5000),
        callback: (timer) async {
          if (FFAppState().paymentStatus == 0) {
            return;
          }

          if (FFAppState().paymentStatus == 1) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Payment Successfull',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: const Duration(milliseconds: 5000),
                backgroundColor: const Color(0xFF0CE915),
              ),
            );
            _model.bookingCreated =
                await BaseChangeAPIsGroup.createBookingCall.call(
              userID: 1,
              userPickUpLocation: FFAppState().pickupLocation,
              userDropLocation: FFAppState().dropLocation,
              busPickUpLocation: getJsonField(
                FFAppState().routeJsonObject,
                r'''$.userPickPoint''',
              ).toString().toString(),
              busDropLocation: getJsonField(
                FFAppState().routeJsonObject,
                r'''$.userDropPoint''',
              ).toString().toString(),
              bookingDate: dateTimeFormat(
                'yyyy-MM-dd',
                getCurrentTimestamp,
                locale: FFLocalizations.of(context).languageCode,
              ),
              routeID: getJsonField(
                FFAppState().routeJsonObject,
                r'''$.route_id''',
              ),
              userPickUpTime: getJsonField(
                FFAppState().tripTimingData,
                r'''$.etaPickup''',
              ).toString().toString(),
              userDropTime: getJsonField(
                FFAppState().tripTimingData,
                r'''$.etaDrop''',
              ).toString().toString(),
              usertostopdistance: getJsonField(
                FFAppState().routeJsonObject,
                r'''$.userPickPointDistance''',
              ),
              busdroptouserdistance: getJsonField(
                FFAppState().routeJsonObject,
                r'''$.userDropPointDistance''',
              ),
              totalseats: FFAppState().seatsBooked,
              paymentid: FFAppState().paymentID,
              busid: 1,
              bookingtypeid: 1,
              tripid: getJsonField(
                FFAppState().tripTimingData,
                r'''$.tripId''',
              ),
              tripDate: FFAppState().selectedDateforBooking,
              startStop: getJsonField(
                FFAppState().routeJsonObject,
                r'''$.stops[0].stopName''',
              ).toString().toString(),
              endStop: functions.getTheLastElementofListString((getJsonField(
                FFAppState().routeJsonObject,
                r'''$.stops[:].stopName''',
                true,
              ) as List)
                  .map<String>((s) => s.toString())
                  .toList()),
              amountExcludingGst: FFAppState().paymentAmount,
              razorpayId: FFAppState().paymentID,
            );
            if (getJsonField(
              (_model.bookingCreated?.jsonBody ?? ''),
              r'''$.reservationCreated''',
            )) {
              context.goNamed('my_rides');

              FFAppState().paymentStatus = 0;
              FFAppState().isLoading = false;
              FFAppState().pickupLocation = '';
              FFAppState().dropLocation = '';
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'There was an error while making the booking',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: const Duration(milliseconds: 4000),
                  backgroundColor: const Color(0xFFDD2828),
                ),
              );
            }
          } else {
            if (FFAppState().paymentStatus == 2) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'There was an Error',
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  duration: const Duration(milliseconds: 4000),
                  backgroundColor: const Color(0xFFD42525),
                ),
              );
              setState(() {
                FFAppState().paymentStatus = 0;
                FFAppState().isLoading = false;
              });
            } else {
              if (FFAppState().paymentStatus == 3) {
                _model.bookingCreated1 =
                    await BaseChangeAPIsGroup.createBookingByPassCall.call(
                  userID: 1,
                  userPickLocation: FFAppState().pickupLocation,
                  userdroplocation: FFAppState().dropLocation,
                  buspicklocation: getJsonField(
                    FFAppState().routeJsonObject,
                    r'''$.userPickPoint''',
                  ).toString().toString(),
                  busdroplocation: getJsonField(
                    FFAppState().routeJsonObject,
                    r'''$.userDropPoint''',
                  ).toString().toString(),
                  bookingstatus: 1,
                  bookingdate: dateTimeFormat(
                    'yyyy-MM-dd',
                    getCurrentTimestamp,
                    locale: FFLocalizations.of(context).languageCode,
                  ),
                  routeid: getJsonField(
                    FFAppState().routeJsonObject,
                    r'''$.route_id''',
                  ),
                  userpickuptime: getJsonField(
                    FFAppState().tripTimingData,
                    r'''$.etaPickup''',
                  ).toString().toString(),
                  userdroptime: getJsonField(
                    FFAppState().tripTimingData,
                    r'''$.etaDrop''',
                  ).toString().toString(),
                  usertostopdistance: getJsonField(
                    FFAppState().routeJsonObject,
                    r'''$.userPickPointDistance''',
                  ),
                  busdroptouserdistance: getJsonField(
                    FFAppState().routeJsonObject,
                    r'''$.userDropPointDistance''',
                  ),
                  totalseats: 1,
                  busid: getJsonField(
                    FFAppState().tripTimingData,
                    r'''$.busId''',
                  ),
                  bookingtypeid: 2,
                  tripid: getJsonField(
                    FFAppState().tripTimingData,
                    r'''$.tripId''',
                  ),
                  tripDate: FFAppState().selectedDateforBooking,
                  startStop: getJsonField(
                    FFAppState().routeJsonObject,
                    r'''$.stops[0].stopName''',
                  ).toString().toString(),
                  endStop:
                      functions.getTheLastElementofListString((getJsonField(
                    FFAppState().routeJsonObject,
                    r'''$.stops[:].stopName''',
                    true,
                  ) as List)
                          .map<String>((s) => s.toString())
                          .toList()),
                  amountExcludingGst: getJsonField(
                    FFAppState().tripTimingData,
                    r'''$.seatPrice''',
                  ),
                  userBuyPassIds: getJsonField(
                    FFAppState().tripTimingData,
                    r'''$.buyPassIdArray''',
                  ).toString().toString(),
                );
                if ((_model.bookingCreated1?.succeeded ?? true)) {
                  context.goNamed('my_rides');

                  FFAppState().paymentStatus = 0;
                  FFAppState().isLoading = false;
                  FFAppState().pickupLocation = '';
                  FFAppState().dropLocation = '';
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'There was an error while making the booking',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: const Duration(milliseconds: 4000),
                      backgroundColor: const Color(0xFFDD2828),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Undefined Value',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: const Duration(milliseconds: 4000),
                    backgroundColor: const Color(0xFFD42525),
                  ),
                );
                setState(() {
                  FFAppState().paymentStatus = 0;
                });
              }
            }

            return;
          }

          return;
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: !FFAppState().isLoading
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 54.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
                title: Text(
                  FFLocalizations.of(context).getText(
                    '0uv3l6pv' /* Confirm Ride */,
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w600,
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 4.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (FFAppState().isLoading == false) {
                return SingleChildScrollView(
                  primary: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9F2F9),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/safety-left-img.png',
                                  width: 61.0,
                                  height: 76.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 10.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '7dauv6ij' /* This shuttle is fitted with GP... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          fontSize: 12.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 28.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 215.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 4.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ROUTE NO. ${getJsonField(
                                        FFAppState().routeJsonObject,
                                        r'''$.routeNumber''',
                                      ).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Rubik',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Icon(
                                            Icons.circle_outlined,
                                            color: Color(0xFF2DA818),
                                            size: 20.0,
                                          ),
                                          Transform.rotate(
                                            angle: 1.5708,
                                            child: const Icon(
                                              Icons.linear_scale,
                                              color: Color(0xFFD4D4D4),
                                              size: 30.0,
                                            ),
                                          ),
                                          Icon(
                                            Icons.pin_drop_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 20.0,
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'p2vpyhf8' /* PICKUP */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            fontSize: 10.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                  Text(
                                                    getJsonField(
                                                      FFAppState()
                                                          .routeJsonObject,
                                                      r'''$.userPickPoint''',
                                                    )
                                                        .toString()
                                                        .maybeHandleOverflow(
                                                          maxChars: 20,
                                                          replacement: '…',
                                                        ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  2.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '67ia48ek' /* DROP */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                                  fontSize:
                                                                      10.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        FFAppState()
                                                            .routeJsonObject,
                                                        r'''$.userDropPoint''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 20,
                                                            replacement: '…',
                                                          ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.pushNamed(
                                                'RouteMapBookingPage',
                                                queryParameters: {
                                                  'routeID': serializeParam(
                                                    getJsonField(
                                                      FFAppState()
                                                          .routeJsonObject,
                                                      r'''$.route_id''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '6qyek0fh' /* Explore Routes */,
                                            ),
                                            icon: const Icon(
                                              Icons.map_outlined,
                                              size: 15.0,
                                            ),
                                            options: FFButtonOptions(
                                              width: 326.0,
                                              height: 45.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFE9F2F9),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(42.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 15.0, 10.0, 15.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        _model.datePicked != null
                                            ? dateTimeFormat(
                                                'MMMEd',
                                                _model.datePicked,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )
                                            : dateTimeFormat(
                                                'MMMEd',
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      final datePickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: ((_model.datePicked ?? getCurrentTimestamp) ??
                                            DateTime.now()),
                                        firstDate: (getCurrentTimestamp ??
                                            DateTime(1900)),
                                        lastDate: (functions.add3Days(
                                                getCurrentTimestamp) ??
                                            DateTime(2050)),
                                      );

                                      if (datePickedDate != null) {
                                        safeSetState(() {
                                          _model.datePicked = DateTime(
                                            datePickedDate.year,
                                            datePickedDate.month,
                                            datePickedDate.day,
                                          );
                                        });
                                      }
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'wizmfuq5' /* Change Date */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Icon(
                                          Icons.date_range,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetRouteTimingCall.call(
                            routeID: getJsonField(
                              FFAppState().routeJsonObject,
                              r'''$.route_id''',
                            ),
                            startPoint: getJsonField(
                              FFAppState().routeJsonObject,
                              r'''$.userPickPoint''',
                            ).toString(),
                            endPoint: getJsonField(
                              FFAppState().routeJsonObject,
                              r'''$.userDropPoint''',
                            ).toString(),
                            currentDate: dateTimeFormat(
                                          'yyyy-MM-dd',
                                          _model.datePicked,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ) !=
                                        ''
                                ? dateTimeFormat(
                                    'yyyy-MM-dd',
                                    _model.datePicked,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )
                                : dateTimeFormat(
                                    'yyyy-MM-dd',
                                    getCurrentTimestamp,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitCircle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            final containerGetRouteTimingResponse =
                                snapshot.data!;
                            return Container(
                              width: double.infinity,
                              height: 276.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 10.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'zu728326' /* Time Slots Available */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (functions.listCheck(getJsonField(
                                          containerGetRouteTimingResponse
                                              .jsonBody,
                                          r'''$.result''',
                                          true,
                                        ))) {
                                          return Builder(
                                            builder: (context) {
                                              final routeTimingData =
                                                  getJsonField(
                                                containerGetRouteTimingResponse
                                                    .jsonBody,
                                                r'''$.result''',
                                              ).toList();
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    routeTimingData.length,
                                                itemBuilder: (context,
                                                    routeTimingDataIndex) {
                                                  final routeTimingDataItem =
                                                      routeTimingData[
                                                          routeTimingDataIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'qp4a497l' /* Pickup */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Rubik',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 10.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .timeConvert(getJsonField(
                                                                            routeTimingDataItem,
                                                                            r'''$.etaPickup''',
                                                                          ).toString()),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Rubik',
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              20.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                82.0,
                                                                            height:
                                                                                22.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                FaIcon(
                                                                                  FontAwesomeIcons.snowflake,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 14.0,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.directions_bus,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'bk8br7h0' /* AC Bus */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Rubik',
                                                                                        fontSize: 10.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              10.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'jo2fltf9' /* You will reach by */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Rubik',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 10.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .timeConvert(getJsonField(
                                                                            routeTimingDataItem,
                                                                            r'''$.etaDrop''',
                                                                          ).toString()),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Rubik',
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              20.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                105.71,
                                                                            height:
                                                                                22.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: getJsonField(
                                                                                        routeTimingDataItem,
                                                                                        r'''$.seatsAvailable''',
                                                                                      ) ==
                                                                                      getJsonField(
                                                                                        functions.return0().first,
                                                                                        r'''$.value''',
                                                                                      )
                                                                                  ? FlutterFlowTheme.of(context).error
                                                                                  : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.airline_seat_recline_normal,
                                                                                  color: getJsonField(
                                                                                            routeTimingDataItem,
                                                                                            r'''$.seatsAvailable''',
                                                                                          ) ==
                                                                                          getJsonField(
                                                                                            functions.return0().first,
                                                                                            r'''$.value''',
                                                                                          )
                                                                                      ? FlutterFlowTheme.of(context).primaryBackground
                                                                                      : FlutterFlowTheme.of(context).primaryText,
                                                                                  size: 14.0,
                                                                                ),
                                                                                Text(
                                                                                  '${getJsonField(
                                                                                    routeTimingDataItem,
                                                                                    r'''$.seatsAvailable''',
                                                                                  ).toString()} Seats Available',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Rubik',
                                                                                        color: getJsonField(
                                                                                                  routeTimingDataItem,
                                                                                                  r'''$.seatsAvailable''',
                                                                                                ) ==
                                                                                                getJsonField(
                                                                                                  functions.return0().first,
                                                                                                  r'''$.value''',
                                                                                                )
                                                                                            ? FlutterFlowTheme.of(context).primaryBackground
                                                                                            : FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 10.0,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FFButtonWidget(
                                                                          onPressed: (getJsonField(
                                                                                    routeTimingDataItem,
                                                                                    r'''$.seatsAvailable''',
                                                                                  ) ==
                                                                                  getJsonField(
                                                                                    functions.return0().first,
                                                                                    r'''$.value''',
                                                                                  ))
                                                                              ? null
                                                                              : () async {
                                                                                  setState(() {
                                                                                    FFAppState().tripTimingData = getJsonField(
                                                                                      routeTimingDataItem,
                                                                                      r'''$''',
                                                                                    );
                                                                                    FFAppState().selectedDateforBooking = _model.datePicked != null
                                                                                        ? dateTimeFormat(
                                                                                            'yyyy-MM-dd',
                                                                                            _model.datePicked,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          )
                                                                                        : dateTimeFormat(
                                                                                            'yyyy-MM-dd',
                                                                                            getCurrentTimestamp,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          );
                                                                                  });
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: const Color(0x29000000),
                                                                                    useSafeArea: true,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: MakePaymentComponentWidget(
                                                                                            selectedDate: _model.datePicked != null ? _model.datePicked! : getCurrentTimestamp,
                                                                                            selectedTime: getJsonField(
                                                                                              routeTimingDataItem,
                                                                                              r'''$.etaPickup''',
                                                                                            ).toString(),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                          text: getJsonField(
                                                                                    routeTimingDataItem,
                                                                                    r'''$.seatsAvailable''',
                                                                                  ) ==
                                                                                  getJsonField(
                                                                                    functions.return0().first,
                                                                                    r'''$.value''',
                                                                                  )
                                                                              ? 'Fully Booked'
                                                                              : 'Select',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                37.0,
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                24.0,
                                                                                0.0),
                                                                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Rubik',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                const BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(70.0),
                                                                            disabledColor:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            disabledTextColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        } else {
                                          return Container(
                                            width: double.infinity,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'h1vbz4ux' /* No Time Slots Available (Chang... */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Vector.png',
                          width: 300.0,
                          height: 200.0,
                          fit: BoxFit.fitWidth,
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
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
