// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({
    super.key,
    this.width,
    this.height,
    required this.jsonObject,
  });

  final double? width;
  final double? height;
  final List<dynamic> jsonObject;

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

// class Stop {
//   List<dynamic> onBoardingArr;
//   List<dynamic> offBoardingArr;
//   int onBoardingNumber;
//   int offBoardingNumber;
//   String stopName;
//   int stopStatus;
//   dynamic stopID;
//   String stopLat;
//   String stopLong;
//   int seats;
//   int distanceMeter;
//   String eta;
//   String checkForEta;
//   String stopReachTime;
//   String id;

//   Stop({
//     required this.onBoardingArr,
//     required this.offBoardingArr,
//     required this.onBoardingNumber,
//     required this.offBoardingNumber,
//     required this.stopName,
//     required this.stopStatus,
//     required this.stopID,
//     required this.stopLat,
//     required this.stopLong,
//     required this.seats,
//     required this.distanceMeter,
//     required this.eta,
//     required this.checkForEta,
//     required this.stopReachTime,
//     required this.id,
//   });

//   factory Stop.fromJson(Map<String, dynamic> json) {
//     return Stop(
//       onBoardingArr: json['onBoardingArr'],
//       offBoardingArr: json['offBoardingArr'],
//       onBoardingNumber: json['onBoardingNumber'],
//       offBoardingNumber: json['offBoardingNumber'],
//       stopName: json['stopName'],
//       stopStatus: json['stopStatus'],
//       stopID: json['stopID'],
//       stopLat: json['stopLat'],
//       stopLong: json['stopLong'],
//       seats: json['seats'],
//       distanceMeter: json['distanceMeter'],
//       eta: json['eta'],
//       checkForEta: json['checkForEta'],
//       stopReachTime: json['stopReachTime'],
//       id: json['_id'],
//     );
//   }
// }

class _DraggableWidgetState extends State<DraggableWidget> {
  List cars = [
    {'id': 0, 'name': 'Select a Ride', 'price': 0.0},
    {'id': 1, 'name': 'UberGo', 'price': 230.0},
    {'id': 2, 'name': 'Go Sedan', 'price': 300.0},
    {'id': 3, 'name': 'UberXL', 'price': 500.0},
    {'id': 4, 'name': 'UberAuto', 'price': 140.0},
  ];

  // List<Stop> stops = [];

  // int selectedCarId = 1;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 1,
      snapSizes: [0.5, 1],
      snap: true,
      builder: (BuildContext context, scrollSheetController) {
        return Container(
          width: 100,
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: ClampingScrollPhysics(),
            controller: scrollSheetController,
            itemCount: widget.jsonObject.length,
            itemBuilder: (BuildContext context, int index) {
              final stops = widget.jsonObject[index];
              // debugPrint(stops.toString());
              // if (index == 0) {
              //   return Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Column(
              //       children: [
              //         SizedBox(
              //           width: 50,
              //           child: Divider(
              //             thickness: 5,
              //           ),
              //         ),
              //       ],
              //     ),
              //   );
              // }
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            child: Divider(
                              thickness: 5,
                            ),
                          ),
                        ],
                      ),
                    if (index == 0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text('Bus Stops',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    )),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/busImage.png',
                                fit: BoxFit.cover,
                                width: 60,
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (index == 0)
                      Divider(
                        thickness: 1,
                      ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      child: Stack(
                        children: [
                          if (stops['stopStatus'] == 1)
                            Align(
                              alignment: AlignmentDirectional(-0.86, -0.19),
                              child: Icon(
                                Icons.circle_outlined,
                                color: Color(0xff2da818),
                                size: 24,
                              ),
                            ),
                          if (stops['stopStatus'] == 0)
                            Align(
                              alignment: AlignmentDirectional(-0.86, -0.19),
                              child: Icon(
                                Icons.location_on_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(-0.51, -0.12),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(60, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            stops['stopName']
                                                .toString()
                                                .maybeHandleOverflow(
                                                  maxChars: 25,
                                                  replacement: '…',
                                                ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Rubik',
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0.0, right: 15.00),
                                          child: Text(() {
                                            if (stops['stopStatus'] == 1) {
                                              String timeString =
                                                  stops['stopReachTime'];
                                              DateFormat inputFormat =
                                                  DateFormat("HH:mm:ss");
                                              DateFormat outputFormat =
                                                  DateFormat("h:mm a");

                                              // Parse the time string
                                              DateTime time =
                                                  inputFormat.parse(timeString);

                                              // Format the time in 12-hour format with AM/PM
                                              String formattedTime =
                                                  outputFormat.format(time);
                                              return "Reached at " +
                                                  formattedTime;
                                            }

                                            String timeString = stops['eta'];
                                            DateFormat inputFormat =
                                                DateFormat("HH:mm:ss");
                                            DateFormat outputFormat =
                                                DateFormat("h:mm a");

                                            // Parse the time string
                                            DateTime time =
                                                inputFormat.parse(timeString);

                                            // Format the time in 12-hour format with AM/PM
                                            String formattedTime =
                                                outputFormat.format(time);

                                            return "ETA is " + formattedTime;
                                          }(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        fontSize: 13.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (index != 0)
                            Align(
                              alignment: AlignmentDirectional(-0.81, -2.39),
                              child: Container(
                                width: 2,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (stops['stopStatus'] == 1) {
                                      return Color(0xff2da818);
                                    } else if (stops['distanceMeter'] >= 1) {
                                      return Color(0xff2da818);
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .secondaryText;
                                    }
                                  }(),
                                ),
                              ),
                            ),
                          if (index != 0)
                            Align(
                              alignment: AlignmentDirectional(-0.81, -1.37),
                              child: Container(
                                width: 2,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (stops['stopStatus'] == 1) {
                                      return Color(0xff2da818);
                                    } else if (stops['distanceMeter'] == 2) {
                                      return Color(0xff2da818);
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .secondaryText;
                                    }
                                  }(),
                                ),
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
