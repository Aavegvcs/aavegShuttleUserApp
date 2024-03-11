import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'login_new_model.dart';
export 'login_new_model.dart';

class LoginNewWidget extends StatefulWidget {
  const LoginNewWidget({super.key});

  @override
  State<LoginNewWidget> createState() => _LoginNewWidgetState();
}

class _LoginNewWidgetState extends State<LoginNewWidget> {
  late LoginNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isUserLogged) {
        context.goNamed('HomePage');
      }
    });

    _model.mobileNumberController ??= TextEditingController();
    _model.mobileNumberFocusNode ??= FocusNode();
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
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: const AlignmentDirectional(0.0, 1.0),
                image: Image.asset(
                  'assets/images/Background_Complete.png',
                ).image,
              ),
            ),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/enter_number_1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'kyxruran' /* Enter your Phone Number */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    fontSize: 20.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'rt6uohiz' /* We will send you a confirmatio... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    color: const Color(0xFF939393),
                                    fontSize: 12.0,
                                  ),
                            ),
                          ),
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 60.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 3.0, 10.0, 3.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '7ub0s8jk' /* +91 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Rubik',
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 3.0, 0.0, 3.0),
                                          child: SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            child: TextFormField(
                                              controller:
                                                  _model.mobileNumberController,
                                              focusNode:
                                                  _model.mobileNumberFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.mobileNumberController',
                                                const Duration(milliseconds: 2000),
                                                () async {
                                                  setState(() {
                                                    _model.mobNumber = _model
                                                        .mobileNumberController
                                                        .text;
                                                  });
                                                },
                                              ),
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                alignLabelWithHint: false,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'tj0i2kaq' /* Enter your phone number */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          fontSize: 12.0,
                                                        ),
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Rubik',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              textAlign: TextAlign.start,
                                              maxLength: 10,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              keyboardType:
                                                  TextInputType.number,
                                              validator: _model
                                                  .mobileNumberControllerValidator
                                                  .asValidator(context),
                                              inputFormatters: [
                                                _model.mobileNumberMask
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 2.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF7B7B7B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (functions.mobileNumberLengthCheck(
                                    _model.mobileNumberController.text)) {
                                  context.pushNamed('HomePage');
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Invalid Mobile Number',
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
                              },
                              text: FFLocalizations.of(context).getText(
                                'ycth4gej' /* Proceed */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 3.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: RichText(
                              textScaler: MediaQuery.of(context).textScaler,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'p6l4btv3' /* By logging in you’re agreeing ... */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  TextSpan(
                                    text: FFLocalizations.of(context).getText(
                                      'u1xgv7oz' /* terms & conditions */,
                                    ),
                                    style: TextStyle(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 12.0,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                ],
                                style: FlutterFlowTheme.of(context).bodyMedium,
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
          ),
        ),
      ),
    );
  }
}
