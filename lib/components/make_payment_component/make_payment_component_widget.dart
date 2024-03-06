import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'make_payment_component_model.dart';
export 'make_payment_component_model.dart';

class MakePaymentComponentWidget extends StatefulWidget {
  const MakePaymentComponentWidget({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
  });

  final DateTime? selectedDate;
  final String? selectedTime;

  @override
  State<MakePaymentComponentWidget> createState() =>
      _MakePaymentComponentWidgetState();
}

class _MakePaymentComponentWidgetState
    extends State<MakePaymentComponentWidget> {
  late MakePaymentComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MakePaymentComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 351.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'o5xlznki' /* Make Payment */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Rubik',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'ev76yqz3' /* Selected pickup time & date */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Rubik',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                    ),
              ),
            ),
            Text(
              '${functions.timeConvert(widget.selectedTime!)} , ${dateTimeFormat(
                'yMMMd',
                widget.selectedDate,
                locale: FFLocalizations.of(context).languageCode,
              )}',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Rubik',
                    fontSize: 16.0,
                  ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'tyct8zs9' /* Price */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Rubik',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 12.0,
                            ),
                      ),
                      Text(
                        valueOrDefault<String>(
                          functions.seatPriceIncreaser(
                              _model.countControllerValue,
                              getJsonField(
                                FFAppState().tripTimingData,
                                r'''$.seatPrice''',
                              ).toString()),
                          '-',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'zkhl4651' /* Seats */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    fontSize: 12.0,
                                  ),
                        ),
                      ),
                      Container(
                        width: 132.0,
                        height: 32.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                          shape: BoxShape.rectangle,
                        ),
                        child: FlutterFlowCountController(
                          decrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.solidMinusSquare,
                            color: enabled
                                ? FlutterFlowTheme.of(context).tertiary
                                : FlutterFlowTheme.of(context).alternate,
                            size: 25.0,
                          ),
                          incrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.solidPlusSquare,
                            color: enabled
                                ? FlutterFlowTheme.of(context).tertiary
                                : FlutterFlowTheme.of(context).alternate,
                            size: 25.0,
                          ),
                          countBuilder: (count) => Text(
                            count.toString(),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 16.0,
                                ),
                          ),
                          count: _model.countControllerValue ??= 1,
                          updateCount: (count) => setState(
                              () => _model.countControllerValue = count),
                          stepSize: 1,
                          minimum: 1,
                          maximum: 3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                  setState(() {
                    FFAppState().isLoading = true;
                    FFAppState().seatsBooked = _model.countControllerValue!;
                    FFAppState().paymentAmount = functions.priceMultiply(
                        getJsonField(
                          FFAppState().tripTimingData,
                          r'''$.seatPrice''',
                        ).toString(),
                        FFAppState().seatsBooked);
                  });
                  await actions.razorpayPayment(
                    functions.getPrice(
                        _model.countControllerValue!,
                        getJsonField(
                          FFAppState().tripTimingData,
                          r'''$.seatPrice''',
                        ).toString()),
                  );
                },
                text: functions.priceForPayment(
                    _model.countControllerValue,
                    getJsonField(
                      FFAppState().tripTimingData,
                      r'''$.seatPrice''',
                    ).toString())!,
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).accent4,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).tertiary,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(70.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  if (getJsonField(
                    FFAppState().tripTimingData,
                    r'''$.hasPass''',
                  )) {
                    if (_model.countControllerValue! > 1) {
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Important!'),
                            content:
                                const Text('Only 1 seat can be booked with Pass'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: const Text('Okay'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.pop(context);
                      FFAppState().isLoading = true;
                      FFAppState().seatsBooked = 1;
                      FFAppState().paymentAmount = functions.priceMultiply(
                          getJsonField(
                            FFAppState().tripTimingData,
                            r'''$.seatPrice''',
                          ).toString(),
                          FFAppState().seatsBooked);
                      FFAppState().paymentStatus = 3;
                    }
                  } else {
                    context.pushNamed(
                      'buyPassPageBookingProcess',
                      queryParameters: {
                        'routeID': serializeParam(
                          getJsonField(
                            FFAppState().routeJsonObject,
                            r'''$.route_id''',
                          ).toString(),
                          ParamType.String,
                        ),
                      }.withoutNulls,
                    );
                  }
                },
                text: getJsonField(
                  FFAppState().tripTimingData,
                  r'''$.hasPass''',
                )
                    ? 'Pay Through Pass'
                    : 'BUY PASS',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).tertiary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Rubik',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).secondary,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(70.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
