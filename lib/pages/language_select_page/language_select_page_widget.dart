import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'language_select_page_model.dart';
export 'language_select_page_model.dart';

class LanguageSelectPageWidget extends StatefulWidget {
  const LanguageSelectPageWidget({super.key});

  @override
  State<LanguageSelectPageWidget> createState() =>
      _LanguageSelectPageWidgetState();
}

class _LanguageSelectPageWidgetState extends State<LanguageSelectPageWidget> {
  late LanguageSelectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguageSelectPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '34bzweu3' /* Language Settings */,
            ),
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Rubik',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    '25cv1ldk' /* Select Language */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Rubik',
                        fontSize: 16.0,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FFLocalizations.of(context).languageCode == 'en'
                            ? FlutterFlowTheme.of(context).primaryBackground
                            : const Color(0xFFE6E6E6),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '8zrx6zgv' /* English */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            if (FFLocalizations.of(context).languageCode ==
                                'en')
                              Icon(
                                Icons.check,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FFLocalizations.of(context).languageCode == 'hi'
                            ? FlutterFlowTheme.of(context).primaryBackground
                            : const Color(0xFFE6E6E6),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '8hqcknj5' /* Hindi */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            if (FFLocalizations.of(context).languageCode ==
                                'hi')
                              Icon(
                                Icons.check,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
