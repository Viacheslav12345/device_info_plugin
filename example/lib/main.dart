import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_info_plugin/device_info_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _brand = 'Unknown';
  String _model = 'Unknown';
  String _id = 'Unknown';
  String _fingerprint = 'Unknown';

  Map<String, String> deviceData = {};

  final _deviceInfoPlugin = DeviceInfoPlugin();

  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  Future<void> getDeviceInfo() async {
    String platformVersion;
    String brand;
    String model;
    String id;
    String fingerprint;
    try {
      platformVersion = await _deviceInfoPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try {
      brand = await _deviceInfoPlugin.getBrand() ?? 'Unknown brand';
    } on PlatformException {
      brand = 'Failed to get brand of device.';
    }

    try {
      model = await _deviceInfoPlugin.getModel() ?? 'Unknown model';
    } on PlatformException {
      model = 'Failed to get model of device.';
    }

    try {
      id = await _deviceInfoPlugin.getId() ?? 'Unknown memory';
    } on PlatformException {
      id = 'Failed to get memory of device.';
    }

    try {
      fingerprint =
          await _deviceInfoPlugin.getFingerprint() ?? 'Unknown fingerprint';
    } on PlatformException {
      fingerprint = 'Failed to get fingerprint of device.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _brand = brand;
      _model = model;
      _id = id;
      _fingerprint = fingerprint;
      deviceData.addAll({
        'Model:': _model,
        'Manufacturer:': _brand,
        'Version OS:': _platformVersion,
        'ID': _id,
        'Fingerprint': _fingerprint,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Device Info"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: ListView(
            children: deviceData.keys.map(
              (String e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Text(e,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        width: 55,
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${deviceData[e]}',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
