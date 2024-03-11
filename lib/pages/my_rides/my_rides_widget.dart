import '/backend/api_requests/api_calls.dart';
import '/components/invoice_email/invoice_email_widget.dart';
import '/components/no_booking/no_booking_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'my_rides_model.dart';
export 'my_rides_model.dart';

class MyRidesWidget extends StatefulWidget {
  const MyRidesWidget({super.key});

  @override
  State<MyRidesWidget> createState() => _MyRidesWidgetState();
}

class _MyRidesWidgetState extends State<MyRidesWidget>
    with TickerProviderStateMixin {
  late MyRidesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyRidesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().userTrackingJSONObject = null;
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'eyjxbr5c' /* My Rides */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Rubik',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: FutureBuilder<ApiCallResponse>(
              future: BaseChangeAPIsGroup.getUserBookingsCall.call(
                userID: 1,
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
                final columnGetUserBookingsResponse = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: TabBar(
                              labelColor: FlutterFlowTheme.of(context).tertiary,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                              unselectedLabelStyle: const TextStyle(),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              indicatorWeight: 3.0,
                              padding: const EdgeInsets.all(4.0),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'eqjacwoa' /* Upcoming rides */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'q5365qh7' /* History */,
                                  ),
                                ),
                              ],
                              controller: _model.tabBarController,
                              onTap: (i) async {
                                [() async {}, () async {}][i]();
                              },
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _model.tabBarController,
                              children: [
                                Builder(
                                  builder: (context) {
                                    if (functions.listCheck(getJsonField(
                                      columnGetUserBookingsResponse.jsonBody,
                                      r'''$.presentBookings''',
                                      true,
                                    ))) {
                                      return Builder(
                                        builder: (context) {
                                          final upcoming = getJsonField(
                                            columnGetUserBookingsResponse
                                                .jsonBody,
                                            r'''$.presentBookings''',
                                          ).toList();
                                          if (upcoming.isEmpty) {
                                            return Center(
                                              child: SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                child: const NoBookingWidget(
                                                  text: 'Bookings',
                                                ),
                                              ),
                                            );
                                          }
                                          return SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children:
                                                  List.generate(upcoming.length,
                                                      (upcomingIndex) {
                                                final upcomingItem =
                                                    upcoming[upcomingIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {},
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 8.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  functions
                                                                      .convertDateUTCtoReadable(
                                                                          getJsonField(
                                                                    upcomingItem,
                                                                    r'''$.booking_date''',
                                                                  ).toString()),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0xFFEEEEFF),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'eliak3yj' /* OTP - */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Rubik',
                                                                                  fontSize: 16.0,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                getJsonField(
                                                                              upcomingItem,
                                                                              r'''$.book_otp''',
                                                                            ).toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontSize: 16.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Rubik',
                                                                              letterSpacing: 2.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        15.0,
                                                                        16.0,
                                                                        15.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    getJsonField(
                                                                      upcomingItem,
                                                                      r'''$.driver_document.driverImage''',
                                                                    ).toString(),
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.25,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.1,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    errorBuilder: (context,
                                                                            error,
                                                                            stackTrace) =>
                                                                        Image
                                                                            .asset(
                                                                      'assets/images/error_image.png',
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.25,
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
                                                                              0.1,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.1,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            upcomingItem,
                                                                            r'''$.driver_name''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Rubik',
                                                                                color: Colors.black,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            upcomingItem,
                                                                            r'''$.bus_number''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Rubik',
                                                                                color: const Color(0xFF7B7B7B),
                                                                                fontSize: 12.0,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'nym9eh5t' /* 4.8 Ratings */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Rubik',
                                                                                      color: const Color(0xFFAEAEAE),
                                                                                      fontSize: 10.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        100.0,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    const Icon(
                                                                                      Icons.circle_outlined,
                                                                                      color: Color(0xFF2DA818),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'muiuprsr' /* PICKUP */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Rubik',
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    fontSize: 10.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              upcomingItem,
                                                                                              r'''$.bus_picklocation''',
                                                                                            ).toString().maybeHandleOverflow(
                                                                                                  maxChars: 15,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                    height: 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.pin_drop_outlined,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'a6lwnm27' /* DROP */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Rubik',
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    fontSize: 10.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              upcomingItem,
                                                                                              r'''$.bus_droplocation''',
                                                                                            ).toString().maybeHandleOverflow(
                                                                                                  maxChars: 15,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -0.94,
                                                                              -0.39),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                2.0,
                                                                            height:
                                                                                5.0,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFC5C5C5),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -0.94,
                                                                              -0.19),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                2.0,
                                                                            height:
                                                                                5.0,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFC5C5C5),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -0.94,
                                                                              0.01),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                2.0,
                                                                            height:
                                                                                5.0,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFC5C5C5),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -0.94,
                                                                              0.21),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                2.0,
                                                                            height:
                                                                                5.0,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFC5C5C5),
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
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        10.0,
                                                                        16.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                              .userTrackingJSONObject =
                                                                          null;
                                                                    });

                                                                    context
                                                                        .pushNamed(
                                                                      'trackingPage',
                                                                      queryParameters:
                                                                          {
                                                                        'busID':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            upcomingItem,
                                                                            r'''$.bus_id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'routeID':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            upcomingItem,
                                                                            r'''$.route_id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'tripID':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            upcomingItem,
                                                                            r'''$.trip_id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'tripDate':
                                                                            serializeParam(
                                                                          functions
                                                                              .convertUTCforBackend(getJsonField(
                                                                            upcomingItem,
                                                                            r'''$.booking_date''',
                                                                          ).toString()),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  text: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'l9xre8j4' /* Live Tracking */,
                                                                  ),
                                                                  icon: const FaIcon(
                                                                    FontAwesomeIcons
                                                                        .locationArrow,
                                                                    size: 18.0,
                                                                  ),
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        40.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            28.0,
                                                                            0.0,
                                                                            28.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Rubik',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                    elevation:
                                                                        3.0,
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await showDialog(
                                                                        barrierColor:
                                                                            const Color(0x74272727),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: SizedBox(
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                child: InvoiceEmailWidget(
                                                                                  bookingId: getJsonField(
                                                                                    upcomingItem,
                                                                                    r'''$.booking_id''',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'auzpidk6' /* Invoice */,
                                                                    ),
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .file_download_outlined,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Rubik',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'gfrb5y7o' /* No Bookings */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                                Builder(
                                  builder: (context) {
                                    if (functions.listCheck(getJsonField(
                                      columnGetUserBookingsResponse.jsonBody,
                                      r'''$.pastBookings''',
                                      true,
                                    ))) {
                                      return Builder(
                                        builder: (context) {
                                          final history = getJsonField(
                                            columnGetUserBookingsResponse
                                                .jsonBody,
                                            r'''$.pastBookings''',
                                          ).toList();
                                          if (history.isEmpty) {
                                            return const NoBookingWidget(
                                              text: 'Bookings',
                                            );
                                          }
                                          return SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children:
                                                  List.generate(history.length,
                                                      (historyIndex) {
                                                final historyItem =
                                                    history[historyIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {},
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 8.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                                0.0, 2.0),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        12.0,
                                                                        0.0,
                                                                        12.0),
                                                                child: Text(
                                                                  functions
                                                                      .convertDateUTCtoReadable(
                                                                          getJsonField(
                                                                    historyItem,
                                                                    r'''$.booking_date''',
                                                                  ).toString()),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        15.0,
                                                                        16.0,
                                                                        15.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    getJsonField(
                                                                      historyItem,
                                                                      r'''$.driver_document.driverImage''',
                                                                    ).toString(),
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.25,
                                                                    height:
                                                                        MediaQuery.sizeOf(context).height *
                                                                            0.1,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.1,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          getJsonField(
                                                                            historyItem,
                                                                            r'''$.driver_name''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Rubik',
                                                                                color: Colors.black,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            historyItem,
                                                                            r'''$.bus_number''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Rubik',
                                                                                color: const Color(0xFF7B7B7B),
                                                                                fontSize: 12.0,
                                                                              ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            const Icon(
                                                                              Icons.star,
                                                                              color: Color(0xFFFFBA08),
                                                                              size: 12.0,
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'rdb9cuh1' /* 4.8 Ratings */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Rubik',
                                                                                      color: const Color(0xFFAEAEAE),
                                                                                      fontSize: 10.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.9,
                                                            height: 1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      SizedBox(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        100.0,
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    const Icon(
                                                                                      Icons.circle_outlined,
                                                                                      color: Color(0xFF2DA818),
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'eesv1w4z' /* PICKUP */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Rubik',
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    fontSize: 10.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              historyItem,
                                                                                              r'''$.bus_picklocation''',
                                                                                            ).toString().maybeHandleOverflow(
                                                                                                  maxChars: 15,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'sby5aykd' /* Journey started */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Rubik',
                                                                                            color: FlutterFlowTheme.of(context).tertiary,
                                                                                            fontSize: 10.0,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      functions.timeConvert(getJsonField(
                                                                                        historyItem,
                                                                                        r'''$.pickuptime''',
                                                                                      ).toString()),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.7,
                                                                                    height: 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.pin_drop_outlined,
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '44yv3rgq' /* DROP */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Rubik',
                                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                                    fontSize: 10.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              historyItem,
                                                                                              r'''$.bus_droplocation''',
                                                                                            ).toString().maybeHandleOverflow(
                                                                                                  maxChars: 15,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                        children: [
                                                                                          Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              '0m22vnvg' /* Journey Completed */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Rubik',
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  fontSize: 10.0,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            functions.timeConvert(getJsonField(
                                                                                              historyItem,
                                                                                              r'''$.droptime''',
                                                                                            ).toString()),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -0.94,
                                                                              -0.39),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                2.0,
                                                                            height:
                                                                                5.0,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFC5C5C5),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -0.94,
                                                                              -0.19),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                2.0,
                                                                            height:
                                                                                5.0,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFC5C5C5),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -0.94,
                                                                              0.01),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                2.0,
                                                                            height:
                                                                                5.0,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFC5C5C5),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
                                                                              -0.94,
                                                                              0.21),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                2.0,
                                                                            height:
                                                                                5.0,
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: Color(0xFFC5C5C5),
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
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        10.0,
                                                                        16.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      await showDialog(
                                                                        barrierColor:
                                                                            const Color(0x74272727),
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Dialog(
                                                                            elevation:
                                                                                0,
                                                                            insetPadding:
                                                                                EdgeInsets.zero,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: SizedBox(
                                                                                height: MediaQuery.sizeOf(context).height * 0.3,
                                                                                width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                child: InvoiceEmailWidget(
                                                                                  bookingId: getJsonField(
                                                                                    historyItem,
                                                                                    r'''$.booking_id''',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '5zpi58o5' /* Invoice */,
                                                                    ),
                                                                    icon: const Icon(
                                                                      Icons
                                                                          .file_download_outlined,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          40.0,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Rubik',
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'kd005gh8' /* No Bookings */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
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
            ),
          ),
        ),
      ),
    );
  }
}
