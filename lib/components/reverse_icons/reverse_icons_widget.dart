import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'reverse_icons_model.dart';
export 'reverse_icons_model.dart';

class ReverseIconsWidget extends StatefulWidget {
  const ReverseIconsWidget({super.key});

  @override
  State<ReverseIconsWidget> createState() => _ReverseIconsWidgetState();
}

class _ReverseIconsWidgetState extends State<ReverseIconsWidget> {
  late ReverseIconsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReverseIconsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30.0,
      height: 30.0,
      child: Stack(
        children: [
          Icon(
            Icons.arrow_upward_sharp,
            color: Colors.white,
            size: 24.0,
          ),
          Align(
            alignment: AlignmentDirectional(2.61, 0.0),
            child: Icon(
              Icons.arrow_downward,
              color: Colors.white,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
