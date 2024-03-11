import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'search_page_pickup_model.dart';
export 'search_page_pickup_model.dart';

class SearchPagePickupWidget extends StatefulWidget {
  const SearchPagePickupWidget({
    super.key,
    bool? currentTrueOrFalse,
    bool? setLocation,
  })  : currentTrueOrFalse = currentTrueOrFalse ?? true,
        setLocation = setLocation ?? false;

  final bool currentTrueOrFalse;
  final bool setLocation;

  @override
  State<SearchPagePickupWidget> createState() => _SearchPagePickupWidgetState();
}

class _SearchPagePickupWidgetState extends State<SearchPagePickupWidget> {
  late SearchPagePickupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPagePickupModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.pickupLocationController?.clear();
        _model.dropLocationController?.clear();
      });
    });

    _model.pickupLocationController ??=
        TextEditingController(text: FFAppState().pickupLocation);
    _model.pickupLocationFocusNode ??= FocusNode();
    _model.pickupLocationFocusNode!.addListener(
      () async {
        setState(() {
          FFAppState().pickupFlag = true;
          FFAppState().dropFlag = false;
        });
      },
    );
    _model.dropLocationController ??=
        TextEditingController(text: FFAppState().dropLocation);
    _model.dropLocationFocusNode ??= FocusNode();
    _model.dropLocationFocusNode!.addListener(
      () async {
        setState(() {
          FFAppState().pickupFlag = false;
          FFAppState().dropFlag = true;
        });
      },
    );
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
        appBar: AppBar(
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
              context.pushNamed('HomePage');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '6j6jbg02' /* Search Routes */,
            ),
            style: FlutterFlowTheme.of(context).titleSmall,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 3.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.1,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.09, -0.53),
                                      child: Icon(
                                        Icons.circle,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 12.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.06, 0.23),
                                      child: Container(
                                        width: 1.0,
                                        height: 25.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-0.08, 0.86),
                                      child: Icon(
                                        Icons.square,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: TextFormField(
                                controller: _model.pickupLocationController,
                                focusNode: _model.pickupLocationFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.pickupLocationController',
                                  const Duration(milliseconds: 2000),
                                  () async {
                                    setState(() {
                                      FFAppState().pickupFlag = true;
                                    });
                                  },
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        fontSize: 12.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'ur39hc93' /* Pick Up Location */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        fontSize: 12.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  suffixIcon: _model.pickupLocationController!
                                          .text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            _model.pickupLocationController
                                                ?.clear();
                                            setState(() {
                                              FFAppState().pickupFlag = true;
                                            });
                                            setState(() {});
                                          },
                                          child: const Icon(
                                            Icons.clear,
                                            size: 14.0,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                minLines: 1,
                                validator: _model
                                    .pickupLocationControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: TextFormField(
                                  controller: _model.dropLocationController,
                                  focusNode: _model.dropLocationFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.dropLocationController',
                                    const Duration(milliseconds: 2000),
                                    () async {
                                      FFAppState().update(() {
                                        FFAppState().dropFlag = true;
                                      });
                                    },
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          fontSize: 12.0,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      '0nov9b7j' /* Drop Location */,
                                    ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          fontSize: 12.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    suffixIcon: _model.dropLocationController!
                                            .text.isNotEmpty
                                        ? InkWell(
                                            onTap: () async {
                                              _model.dropLocationController
                                                  ?.clear();
                                              FFAppState().update(() {
                                                FFAppState().dropFlag = true;
                                              });
                                              setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.clear,
                                              size: 14.0,
                                            ),
                                          )
                                        : null,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Rubik',
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                  maxLength: 32,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  validator: _model
                                      .dropLocationControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.8,
                  child: Stack(
                    children: [
                      if (FFAppState().pickupFlag)
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    currentUserLocationValue =
                                        await getCurrentUserLocation(
                                            defaultLocation: const LatLng(0.0, 0.0));
                                    _model.apiResult1seCopy =
                                        await LatLongLocationCall.call(
                                      lat: functions
                                          .getLatLong(
                                              currentUserLocationValue!, true)
                                          .toString(),
                                      lng: functions
                                          .getLatLong(
                                              currentUserLocationValue!, false)
                                          .toString(),
                                    );
                                    if ((_model.apiResult1seCopy?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.pickupLocationController?.text =
                                            getJsonField(
                                          (_model.apiResult1seCopy?.jsonBody ??
                                              ''),
                                          r'''$.results[0].formatted_address''',
                                        ).toString();
                                      });
                                      setState(() {
                                        FFAppState().pickupPlaceID =
                                            getJsonField(
                                          (_model.apiResult1seCopy?.jsonBody ??
                                              ''),
                                          r'''$.results[0].place_id''',
                                        ).toString();
                                      });
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  child: Icon(
                                                    Icons.location_on_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xugm0xah' /* Current Location */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 0.5,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                FutureBuilder<ApiCallResponse>(
                                  future: LocationApiCall.call(
                                    searchText:
                                        _model.pickupLocationController.text,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: LinearProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      );
                                    }
                                    final listViewLocationApiResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final locationNames1 =
                                            LocationApiCall.locationPrediction(
                                                  listViewLocationApiResponse
                                                      .jsonBody,
                                                )?.toList() ??
                                                [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: locationNames1.length,
                                          itemBuilder:
                                              (context, locationNames1Index) {
                                            final locationNames1Item =
                                                locationNames1[
                                                    locationNames1Index];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState().pickupLocation =
                                                      getJsonField(
                                                    locationNames1Item,
                                                    r'''$.structured_formatting.main_text''',
                                                  ).toString();
                                                  FFAppState().pickupFlag =
                                                      false;
                                                  FFAppState().pickupPlaceID =
                                                      getJsonField(
                                                    locationNames1Item,
                                                    r'''$.place_id''',
                                                  ).toString();
                                                });
                                                setState(() {
                                                  _model
                                                      .pickupLocationController
                                                      ?.text = getJsonField(
                                                    locationNames1Item,
                                                    r'''$.structured_formatting.main_text''',
                                                  ).toString();
                                                });
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
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
                                                                  15.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .location_on_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
                                                              ),
                                                            ),
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
                                                                Text(
                                                                  getJsonField(
                                                                    locationNames1Item,
                                                                    r'''$.structured_formatting.main_text''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    locationNames1Item,
                                                                    r'''$.structured_formatting.secondary_text''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 0.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().pickupFlag = false;
                                      FFAppState().setLocation = true;
                                    });

                                    context.pushNamed(
                                      'setLocationOnMap',
                                      queryParameters: {
                                        'pickupOrDrop': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  child: Icon(
                                                    Icons.push_pin_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '6nuahxzn' /* Set Location on Map */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 0.5,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
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
                      if (FFAppState().dropFlag == true)
                        Container(
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<ApiCallResponse>(
                                  future: LocationApiCall.call(
                                    searchText:
                                        _model.dropLocationController.text,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: LinearProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                      );
                                    }
                                    final listViewLocationApiResponse =
                                        snapshot.data!;
                                    return Builder(
                                      builder: (context) {
                                        final locationNames2 =
                                            LocationApiCall.locationPrediction(
                                                  listViewLocationApiResponse
                                                      .jsonBody,
                                                )?.toList() ??
                                                [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: locationNames2.length,
                                          itemBuilder:
                                              (context, locationNames2Index) {
                                            final locationNames2Item =
                                                locationNames2[
                                                    locationNames2Index];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState().dropFlag = false;
                                                });
                                                setState(() {
                                                  _model.dropLocationController
                                                      ?.text = getJsonField(
                                                    locationNames2Item,
                                                    r'''$.structured_formatting.main_text''',
                                                  ).toString();
                                                });
                                                setState(() {
                                                  FFAppState().dropLocation =
                                                      getJsonField(
                                                    locationNames2Item,
                                                    r'''$.structured_formatting.main_text''',
                                                  ).toString();
                                                  FFAppState().dropPlaceID =
                                                      getJsonField(
                                                    locationNames2Item,
                                                    r'''$.place_id''',
                                                  ).toString();
                                                });

                                                context.pushNamed(
                                                    'searchRoutesPage');
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
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
                                                                  15.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 30.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .location_on_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 20.0,
                                                              ),
                                                            ),
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
                                                                Text(
                                                                  getJsonField(
                                                                    locationNames2Item,
                                                                    r'''$.structured_formatting.main_text''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Rubik',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  getJsonField(
                                                                    locationNames2Item,
                                                                    r'''$.structured_formatting.secondary_text''',
                                                                  )
                                                                      .toString()
                                                                      .maybeHandleOverflow(
                                                                        maxChars:
                                                                            30,
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 0.5,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().dropFlag = false;
                                    });

                                    context.pushNamed(
                                      'setLocationOnMap',
                                      queryParameters: {
                                        'pickupOrDrop': serializeParam(
                                          false,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  child: Icon(
                                                    Icons.push_pin_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'xx0ctoz9' /* Set Location on Map */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 10.0, 0.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 0.5,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
