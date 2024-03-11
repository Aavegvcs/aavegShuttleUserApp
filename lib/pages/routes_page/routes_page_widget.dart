import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'routes_page_model.dart';
export 'routes_page_model.dart';

class RoutesPageWidget extends StatefulWidget {
  const RoutesPageWidget({super.key});

  @override
  State<RoutesPageWidget> createState() => _RoutesPageWidgetState();
}

class _RoutesPageWidgetState extends State<RoutesPageWidget> {
  late RoutesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RoutesPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: BaseChangeAPIsGroup.getAllRoutesCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final routesPageGetAllRoutesResponse = snapshot.data!;
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
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                automaticallyImplyLeading: false,
                title: Text(
                  FFLocalizations.of(context).getText(
                    '2np8rqgt' /* Routes */,
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                actions: const [],
                centerTitle: false,
                elevation: 4.0,
              ),
              body: SafeArea(
                top: true,
                child: Builder(
                  builder: (context) {
                    final routes = getJsonField(
                      routesPageGetAllRoutesResponse.jsonBody,
                      r'''$.result''',
                    ).toList();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(routes.length, (routesIndex) {
                          final routesItem = routes[routesIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 28.0, 16.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(2.0, 2.0),
                                    spreadRadius: 4.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    13.0, 18.0, 13.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ROUTE NO. ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 100.0,
                                              child: Stack(
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .circle_outlined,
                                                            color: Color(
                                                                0xFF2DA818),
                                                            size: 20.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '6u4bizw4' /* PICKUP */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Rubik',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  functions
                                                                      .splitString(
                                                                          getJsonField(
                                                                            routesItem,
                                                                            r'''$.route_name''',
                                                                          ).toString(),
                                                                          true)
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            25,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.7,
                                                              height: 1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .pin_drop_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 20.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          2.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'xobwd9la' /* DROP */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Rubik',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          fontSize:
                                                                              10.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  functions
                                                                      .splitString(
                                                                          getJsonField(
                                                                            routesItem,
                                                                            r'''$.route_name''',
                                                                          ).toString(),
                                                                          false)
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            25,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.94, -0.39),
                                                    child: Container(
                                                      width: 2.0,
                                                      height: 5.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xFFC5C5C5),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.94, -0.19),
                                                    child: Container(
                                                      width: 2.0,
                                                      height: 5.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xFFC5C5C5),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.94, 0.01),
                                                    child: Container(
                                                      width: 2.0,
                                                      height: 5.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xFFC5C5C5),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.94, 0.21),
                                                    child: Container(
                                                      width: 2.0,
                                                      height: 5.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xFFC5C5C5),
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'EntireRoutePage',
                                                queryParameters: {
                                                  'routeID': serializeParam(
                                                    getJsonField(
                                                      routesItem,
                                                      r'''$.route_id''',
                                                    ),
                                                    ParamType.int,
                                                  ),
                                                  'pickUp': serializeParam(
                                                    functions.splitString(
                                                        getJsonField(
                                                          routesItem,
                                                          r'''$.route_name''',
                                                        ).toString(),
                                                        true),
                                                    ParamType.String,
                                                  ),
                                                  'drop': serializeParam(
                                                    functions.splitString(
                                                        getJsonField(
                                                          routesItem,
                                                          r'''$.route_name''',
                                                        ).toString(),
                                                        false),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 1.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.05,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '9t4i2ufd' /* Explore Entire Route */,
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
                                                                    .primaryBackground,
                                                                fontSize: 12.0,
                                                              ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.map_outlined,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
