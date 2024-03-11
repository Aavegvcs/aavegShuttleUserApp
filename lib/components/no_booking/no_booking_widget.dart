import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'no_booking_model.dart';
export 'no_booking_model.dart';

class NoBookingWidget extends StatefulWidget {
  const NoBookingWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<NoBookingWidget> createState() => _NoBookingWidgetState();
}

class _NoBookingWidgetState extends State<NoBookingWidget> {
  late NoBookingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoBookingModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Align(
        alignment: const AlignmentDirectional(0.0, 0.0),
        child: Text(
          'No ${widget.text}',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Rubik',
                color: FlutterFlowTheme.of(context).tertiary,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
