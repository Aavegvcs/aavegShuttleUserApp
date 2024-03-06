// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:razorpay_flutter/razorpay_flutter.dart';

void handlePaymentErrorResponse(PaymentFailureResponse response) {
  /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
  FFAppState().update(() {
    FFAppState().paymentStatus = 2;
  });
  debugPrint(
      "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
}

void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
  /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
  FFAppState().update(() {
    FFAppState().paymentStatus = 1;
    FFAppState().paymentID = "${response.paymentId}";
  });
  debugPrint("Payment ID: ${response.paymentId}");
}

void handleExternalWalletSelected(ExternalWalletResponse response) {
  debugPrint("${response.walletName}");
}

Future razorpayPayment(int? amount) async {
  // Add your function code here!
  int useAmount = amount! * 100;
  Razorpay razorpay = Razorpay();
  var options = {
    'key': 'rzp_test_Ymyq5LXpYAetuR',
    'amount': useAmount,
    'name': 'Aaveg Shuttle',
    // 'description': 'Fine T-Shirt',
    'retry': {'enabled': true, 'max_count': 1},
    'send_sms_hash': true,
    "captured": true,
    'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
    'external': {
      'wallets': ['paytm']
    },
    'modal': {
      'confirm_close': true,
    }
  };

  try {
    razorpay.open(options);

    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  } catch (e) {
    debugPrint('Error: ' + e.toString());
  }
}
