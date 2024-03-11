import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'edit_profile_profile_model.dart';
export 'edit_profile_profile_model.dart';

class EditProfileProfileWidget extends StatefulWidget {
  const EditProfileProfileWidget({
    super.key,
    required this.profileData,
  });

  final dynamic profileData;

  @override
  State<EditProfileProfileWidget> createState() =>
      _EditProfileProfileWidgetState();
}

class _EditProfileProfileWidgetState extends State<EditProfileProfileWidget>
    with TickerProviderStateMixin {
  late EditProfileProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 720.ms,
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
          delay: 720.ms,
          duration: 600.ms,
          begin: const Offset(0.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 720.ms,
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
    _model = createModel(context, () => EditProfileProfileModel());

    _model.yourNameController ??= TextEditingController();
    _model.yourNameFocusNode ??= FocusNode();

    _model.homeAddressController ??= TextEditingController();
    _model.homeAddressFocusNode ??= FocusNode();
    _model.homeAddressFocusNode!.addListener(
      () async {
        setState(() {
          _model.office = false;
        });
      },
    );
    _model.officeAddressController ??= TextEditingController();
    _model.officeAddressFocusNode ??= FocusNode();
    _model.officeAddressFocusNode!.addListener(
      () async {
        setState(() {
          _model.home = false;
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          automaticallyImplyLeading: false,
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.chevron_left,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '2y8mwa7l' /* Edit Profile */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Rubik',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0.0,
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 220.0,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 170.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tertiary,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).tertiary,
                          width: 0.0,
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation1']!),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.01),
                      child: Container(
                        width: 135.0,
                        height: 135.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 5.0,
                          ),
                        ),
                        child: Hero(
                          tag: 'profiilePic',
                          transitionOnUserGestures: true,
                          child: Container(
                            width: 110.0,
                            height: 110.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/253159783_3150167901880195_6676648472471890997_n.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.38, 0.52),
                      child: Container(
                        width: 26.0,
                        height: 26.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF312A62),
                            width: 2.0,
                          ),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Color(0xFF312A62),
                          size: 16.0,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation3']!),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '8bry9gug' /* Name */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 16.0),
                        child: TextFormField(
                          controller: _model.yourNameController,
                          focusNode: _model.yourNameFocusNode,
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: getJsonField(
                              widget.profileData,
                              r'''$.userInformation.user_name''',
                            ).toString(),
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00E0E3E7),
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
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 24.0),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.yourNameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 10.0, 20.0, 10.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'dplthkbd' /* Residential Address */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: TextFormField(
                          controller: _model.homeAddressController,
                          focusNode: _model.homeAddressFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.homeAddressController',
                            const Duration(milliseconds: 2000),
                            () async {
                              setState(() {
                                _model.home = true;
                                _model.office = false;
                              });
                            },
                          ),
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle:
                                FlutterFlowTheme.of(context).labelMedium,
                            hintText: getJsonField(
                              widget.profileData,
                              r'''$.userInformation.home_location_addressline1''',
                            ).toString(),
                            hintStyle: FlutterFlowTheme.of(context).labelMedium,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0x00E0E3E7),
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
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 24.0, 0.0, 24.0),
                            suffixIcon: const Icon(
                              Icons.location_on_outlined,
                              color: Color(0xFF757575),
                              size: 22.0,
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.homeAddressControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      if (_model.home)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: MediaQuery.sizeOf(context).height * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: FutureBuilder<ApiCallResponse>(
                            future: LocationApiCall.call(
                              searchText: _model.homeAddressController.text,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitCircle(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              final listViewLocationApiResponse =
                                  snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final homeAddressChildren =
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
                                    itemCount: homeAddressChildren.length,
                                    itemBuilder:
                                        (context, homeAddressChildrenIndex) {
                                      final homeAddressChildrenItem =
                                          homeAddressChildren[
                                              homeAddressChildrenIndex];
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.homeAddressController
                                                  ?.text = getJsonField(
                                                homeAddressChildrenItem,
                                                r'''$.description''',
                                              ).toString();
                                            });
                                            setState(() {
                                              _model.home = false;
                                            });
                                          },
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.location_pin,
                                                        color:
                                                            Color(0xFF929292),
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            homeAddressChildrenItem,
                                                            r'''$.description''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Rubik',
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
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
                        ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 10.0, 20.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'ln3hqb6b' /* Office Address */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: TextFormField(
                            controller: _model.officeAddressController,
                            focusNode: _model.officeAddressFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.officeAddressController',
                              const Duration(milliseconds: 2000),
                              () async {
                                setState(() {
                                  _model.home = false;
                                  _model.office = true;
                                });
                              },
                            ),
                            textCapitalization: TextCapitalization.words,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintText: getJsonField(
                                widget.profileData,
                                r'''$.userInformation.office_location_addressline1''',
                              ).toString(),
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0x00E0E3E7),
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
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                              suffixIcon: const Icon(
                                Icons.location_on_outlined,
                                color: Color(0xFF757575),
                                size: 22.0,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.officeAddressControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        if (_model.office)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: FutureBuilder<ApiCallResponse>(
                              future: LocationApiCall.call(
                                searchText: _model.officeAddressController.text,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                final listViewLocationApiResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final homeAddressChildren =
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
                                      itemCount: homeAddressChildren.length,
                                      itemBuilder:
                                          (context, homeAddressChildrenIndex) {
                                        final homeAddressChildrenItem =
                                            homeAddressChildren[
                                                homeAddressChildrenIndex];
                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                _model.officeAddressController
                                                    ?.text = getJsonField(
                                                  homeAddressChildrenItem,
                                                  r'''$.description''',
                                                ).toString();
                                              });
                                              setState(() {
                                                _model.office = false;
                                              });
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 5.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons.location_pin,
                                                          color:
                                                              Color(0xFF929292),
                                                          size: 16.0,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            getJsonField(
                                                              homeAddressChildrenItem,
                                                              r'''$.description''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent4,
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
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.05),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      var shouldSetState = false;
                      if ((_model.yourNameController.text == '') &&
                          (_model.homeAddressController.text == '') &&
                          (_model.officeAddressController.text == '')) {
                        if (shouldSetState) setState(() {});
                        return;
                      }

                      _model.apiResultb9u =
                          await BaseChangeAPIsGroup.editUserCall.call(
                        userid: 3,
                        username: _model.yourNameController.text != ''
                            ? _model.yourNameController.text
                            : getJsonField(
                                widget.profileData,
                                r'''$.userInformation.user_name''',
                              ).toString(),
                        useremail: getJsonField(
                          widget.profileData,
                          r'''$.userInformation.email''',
                        ).toString(),
                        userhomeaddressline1:
                            _model.homeAddressController.text != ''
                                ? _model.homeAddressController.text
                                : getJsonField(
                                    widget.profileData,
                                    r'''$.userInformation.home_location_addressline1''',
                                  ).toString(),
                        userofficeaddressline1:
                            _model.officeAddressController.text != ''
                                ? _model.officeAddressController.text
                                : getJsonField(
                                    widget.profileData,
                                    r'''$.userInformation.office_location_addressline1''',
                                  ).toString(),
                      );
                      shouldSetState = true;
                      if ((_model.apiResultb9u?.succeeded ?? true)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'User Updated',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor: const Color(0xFF15DF47),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error in user updated',
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

                      if (shouldSetState) setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      '64gnjmub' /* Save Changes */,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).tertiary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Rubik',
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                      elevation: 2.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
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
