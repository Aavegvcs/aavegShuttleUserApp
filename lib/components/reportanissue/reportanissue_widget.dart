import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'reportanissue_model.dart';
export 'reportanissue_model.dart';

class ReportanissueWidget extends StatefulWidget {
  const ReportanissueWidget({super.key});

  @override
  State<ReportanissueWidget> createState() => _ReportanissueWidgetState();
}

class _ReportanissueWidgetState extends State<ReportanissueWidget> {
  late ReportanissueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportanissueModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'mux7pph9' /* Report Issue with current ride */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: const CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: CheckboxListTile(
                          value: _model.checkboxListTileValue1 ??= false,
                          onChanged: (newValue) async {
                            setState(() =>
                                _model.checkboxListTileValue1 = newValue!);
                          },
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'okv6m99x' /* Shuttle arrived late */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).tertiary,
                          checkColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: const CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: CheckboxListTile(
                          value: _model.checkboxListTileValue2 ??= false,
                          onChanged: (newValue) async {
                            setState(() =>
                                _model.checkboxListTileValue2 = newValue!);
                          },
                          title: Text(
                            FFLocalizations.of(context).getText(
                              't0jzdnr3' /* Chaos inside the shuttle */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).tertiary,
                          checkColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: const CheckboxThemeData(
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        child: CheckboxListTile(
                          value: _model.checkboxListTileValue3 ??= false,
                          onChanged: (newValue) async {
                            setState(() =>
                                _model.checkboxListTileValue3 = newValue!);
                          },
                          title: Text(
                            FFLocalizations.of(context).getText(
                              'rh3utaws' /* Other issue */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Rubik',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          tileColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          activeColor: FlutterFlowTheme.of(context).tertiary,
                          checkColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          dense: false,
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                      ),
                    ),
                    if (_model.checkboxListTileValue3 ?? true)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            22.0, 10.0, 22.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            readOnly: _model.checkboxListTileValue3 == false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'olate0i4' /* Describe your issue here... */,
                              ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            maxLines: 5,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.checkboxListTileValue1! ||
                              _model.checkboxListTileValue2! ||
                              _model.checkboxListTileValue3!) {
                            _model.apiResult6y6 = await BaseChangeAPIsGroup
                                .supportMessageCall
                                .call(
                              userID: '1',
                              message: () {
                                if (_model.checkboxListTileValue1! &&
                                    _model.checkboxListTileValue2! &&
                                    _model.checkboxListTileValue3!) {
                                  return '${_model.checkboxListTileValue1?.toString()},${_model.checkboxListTileValue2?.toString()},${_model.textController.text}';
                                } else if (_model.checkboxListTileValue1! &&
                                    _model.checkboxListTileValue2! &&
                                    !_model.checkboxListTileValue3!) {
                                  return '${_model.checkboxListTileValue1?.toString()},${_model.checkboxListTileValue2?.toString()}';
                                } else if (_model.checkboxListTileValue1! &&
                                    !_model.checkboxListTileValue2! &&
                                    !_model.checkboxListTileValue3!) {
                                  return _model.checkboxListTileValue1
                                      ?.toString();
                                } else if (!_model.checkboxListTileValue1! &&
                                    _model.checkboxListTileValue2! &&
                                    !_model.checkboxListTileValue3!) {
                                  return _model.checkboxListTileValue2
                                      ?.toString();
                                } else {
                                  return _model.textController.text;
                                }
                              }(),
                            );
                            if ((_model.apiResult6y6?.succeeded ?? true)) {
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'There was an Error',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
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
                                  'Enter some value',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor: const Color(0xFFDD2828),
                              ),
                            );
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'krtu21x3' /* Report Issue */,
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
