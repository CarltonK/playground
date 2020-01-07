import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget _buildLoader(BuildContext context) {
  return Center(
    child: SpinKitWave(
      color: Colors.white,
      size: 180.0,
      duration: Duration(seconds: 2),
    ),
  );
}
