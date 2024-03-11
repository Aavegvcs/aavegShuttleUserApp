import '/components/reportanissue/reportanissue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'emergency_s_o_s_model.dart';
export 'emergency_s_o_s_model.dart';

class EmergencySOSWidget extends StatefulWidget {
  const EmergencySOSWidget({super.key});

  @override
  State<EmergencySOSWidget> createState() => _EmergencySOSWidgetState();
}

class _EmergencySOSWidgetState extends State<EmergencySOSWidget> {
  late EmergencySOSModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmergencySOSModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400.0,
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 400.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5.0,
                    color: Color(0x3B1D2429),
                    offset: Offset(0.0, -3.0),
                  )
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 18.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '9vd48534' /* Emergency SOS */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Rubik',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await launchUrl(Uri(
                          scheme: 'tel',
                          path: '9999999999',
                        ));
                      },
                      text: FFLocalizations.of(context).getText(
                        '5xlu8iuj' /* Contact Support */,
                      ),
                      icon: const Icon(
                        Icons.call,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                                  fontFamily: 'Rubik',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(22.5),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 30.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await launchUrl(Uri(
                            scheme: 'tel',
                            path: '9999999999',
                          ));
                        },
                        text: FFLocalizations.of(context).getText(
                          'b70dbho9' /* Women Support */,
                        ),
                        icon: const Icon(
                          Icons.call_sharp,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFE9F2F9),
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: 'Rubik',
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(22.5),
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).accent4,
                    ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'sjaz3tzy' /* Report issue with current ride */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 16.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: const Color(0x71000000),
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: const ReportanissueWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: FFLocalizations.of(context).getText(
                          'apgwds3k' /* Report Issue */,
                        ),
                        icon: const Icon(
                          Icons.info_outline,
                          size: 15.0,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).tertiary,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                          elevation: 2.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).tertiary,
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(22.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.05, -0.97),
            child: Container(
              width: 103.0,
              height: 5.0,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(5.0),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
            ),
          ),
        ],
      ),
    );
  }
}
