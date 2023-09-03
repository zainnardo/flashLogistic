import 'package:flashlogistic/api/api_provider.dart';
import 'package:flashlogistic/model/delivery_model.dart';

class ApiRequest {
  ApiProvider _apiProvider = ApiProvider();

  Future<DeliveryModel> reqDeliveryData(
    String deliveryNumber,
  ) async {
    var body = {
      'deliveryNumber': deliveryNumber,
    };
    final response = await _apiProvider.callApi('ws_get_data_delivery', body);
    return DeliveryModel.fromJson(response);
  }
}
