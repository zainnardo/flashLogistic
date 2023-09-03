library network_helper;

import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

// part 'http_override.dart';

class NetworkHelper {
  /// ByPassing SSL
  static byPassSSL(Dio dio, bool isSkip) {
    if (isSkip) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }
  }

  /// Check connection
  static Future<bool> checkConnection() async {
    var connectResult = await (Connectivity().checkConnectivity());
    if (connectResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
