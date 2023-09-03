import 'package:dio/dio.dart';
import 'package:flashlogistic/api/api_request.dart';
import 'package:flashlogistic/common/navigation.dart';
import 'package:flashlogistic/common/router.dart';
import 'package:flashlogistic/common/states.dart';
import 'package:flashlogistic/model/delivery_model.dart';
import 'package:flashlogistic/ui/features/data_delivery_page.dart';
import 'package:flashlogistic/util/network_helper.dart';
import 'package:flashlogistic/widgets/dialogs.dart';
import 'package:flutter/material.dart';

class DeliveryProvider extends ChangeNotifier {
  final ApiRequest apiRequest;

  DeliveryProvider({required this.apiRequest});

  DeliveryModel? _respDeliv;
  String? _errMessage;
  ResultState? _state;

  DeliveryModel? get respDelive => _respDeliv;
  String? get errMessage => _errMessage;
  ResultState? get state => _state;

  Future<dynamic> getDataDelivery(String deliveryNumber) async {
    try {
    _state = ResultState.Loading;
    notifyListeners();
    final isConnected = await NetworkHelper.checkConnection();
    if (isConnected) {
      final response = await apiRequest.reqDeliveryData(deliveryNumber);
      if (response.responseCode != "99") {
        _respDeliv = response;
        switch (response.responseCode) {
          case '200':
            _state = ResultState.HasData;
            _respDeliv = response;
            Navigation.pushNoData(deliveryRoute);
            notifyListeners();
            break;
          default:
            _state = ResultState.NoData;
            notifyListeners();
            Dialogs.warning(ctx, response.responseMessage);
            break;
        }
        return _respDeliv;
      } else {
         _state = ResultState.Error;
          notifyListeners();
          Dialogs.warning(ctx, response.responseMessage);
          return _errMessage = response.responseMessage;
      }
    } else {
       _errMessage = 'Internet not available';
       _state = ResultState.Error;
        notifyListeners();
        return _errMessage;
      }
    } catch (e) {
       _state = ResultState.Error;
      notifyListeners();
      _errMessage = 'Error -> $e';
      Dialogs.warning(ctx, _errMessage!);
      return _errMessage;
    }
  }
}
