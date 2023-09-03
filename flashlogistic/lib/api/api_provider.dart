import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flashlogistic/common/constants.dart';
import 'package:flashlogistic/config_app.dart';

class ApiProvider {
  dynamic _responseApi(Response response) {
    if (response.statusCode == 200) {
      ///success
      String data = response.data.toString();
      if (data.isEmpty) {
        throw DioException(
          type: DioExceptionType.unknown,
          error: const FormatException('No response from server'),
          requestOptions: RequestOptions(path: ''),
        );
      }
      String toReceive = data;
      print('full response: $toReceive');
      // var jsonObject = json.decode(toReceive);
      return toReceive;
    } else {
      ///fail
      throw Exception('Failed to Connect');
    }
  }

  Map<String, String> _exceptionHandling(Object e, bool isTransaction) {
    String errCode = '';
    String errMsg = '';
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionTimeout) {
        // Utility.printToConsole(e.type, ConfigApp.API_PRINT);
        errCode = (isTransaction) ? RC_TX_ADVICE_TIMEOUT : RC_GENERAL_EXCEPTION;
        // errMsg  = (isTransaction) ? ERR_MSG_TIMEOUT_TX : ERR_MSG_GENERIC + '(kode: TOc)';
      } else if (e.type == DioExceptionType.receiveTimeout) {
        // Utility.printToConsole(e.type, ConfigApp.API_PRINT);
        errCode =
        (isTransaction) ? RC_TX_ADVICE_TIMEOUT : RC_GENERAL_EXCEPTION;
        // errMsg = (isTransaction) ? ERR_MSG_TIMEOUT_TX : ERR_MSG_GENERIC + '(kode: TOr)';
      } else if (e.type == DioExceptionType.badResponse) {
        // Utility.printToConsole('ErrorResponse : ${e.response?.statusCode}', ConfigApp.API_PRINT);
        String errHttp = '(kode: RH${e.response?.statusCode})';
        errCode = RC_GENERAL_EXCEPTION;
        errMsg = '$ERR_MSG_GENERIC \n$errHttp';
      } else if (e.type == DioExceptionType.unknown) {
        if (e.error is SocketException) {
          var errorSocket = (e.error as SocketException);
          errCode = RC_GENERAL_EXCEPTION;
          errMsg = '$ERR_MSG_SOCKET (kode: SE${errorSocket.osError?.errorCode})';
        } else if (e.error is HandshakeException) {
          var errorHandshake = (e.error as HandshakeException);
          errCode = RC_GENERAL_EXCEPTION;
          errMsg = '$ERR_MSG_GENERIC (kode: HE:SSL${errorHandshake.osError?.errorCode})';
        } else if (e.error is FormatException) {
          errCode = RC_GENERAL_EXCEPTION;
          errMsg = '$ERR_MSG_GENERIC (kode: FE)';
        } else {
          errCode = RC_GENERAL_EXCEPTION;
          errMsg = '$ERR_MSG_GENERIC (kode: ODE)';
        }
      }
    } else if (e is FormatException) {
      errCode = RC_GENERAL_EXCEPTION;
      errMsg = '$ERR_MSG_GENERIC (kode: FE)';
    } else {
      errCode = RC_GENERAL_EXCEPTION;
      errMsg = '$ERR_MSG_GENERIC (kode: OE)';
    }
    return {'responseCode': errCode, 'responseMessage': errMsg};
  }

  Future<dynamic> callApi(String url, var body,
      {bool isTMCAuth = false,
      bool isTransaction = false,
      String? baseUrl,
      int? customTO}) async {
    if (baseUrl == null) {
      //TODO: URL TO Server
      baseUrl = ConfigApp.SERVER_LOCATION;
    }

    try {
      Dio dio = Dio();
      dio.options.connectTimeout = Duration(milliseconds: TIMEOUT_CONNECT);
      dio.options.receiveTimeout = Duration(milliseconds: TIMEOUT_CONNECT);

      ///Encryption
      String toSend = body;

      var dioOption = Options(
        contentType: "application/json",
      );
      Response response = await dio.post(
        baseUrl! + url,
        options: dioOption,
        data: toSend,
      );
      var respApi = _responseApi(response);
      return respApi;
    } catch (e) {
      var respError = _exceptionHandling(e, isTransaction);
      return respError;
    }
  }
}
