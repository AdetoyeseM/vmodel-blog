
// ignore_for_file: library_private_types_in_public_api

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class NetworkSensitiveWidget extends StatefulWidget {
  final Widget child;

  const NetworkSensitiveWidget({Key? key, required this.child}) : super(key: key);

  @override
  _NetworkSensitiveWidgetState createState() => _NetworkSensitiveWidgetState();
}

class _NetworkSensitiveWidgetState extends State<NetworkSensitiveWidget> {
  bool _isConnected = true; 

  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        _isConnected = result != ConnectivityResult.none;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isConnected ? widget.child : _buildNoConnectionWidget();
  }

  Widget _buildNoConnectionWidget() {
    return const Scaffold(
      body: Center(
        child: Text('No Internet Connection!'),
      ),
    );
  }
}
