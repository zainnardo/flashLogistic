import 'package:flashlogistic/api/api_request.dart';
import 'package:flashlogistic/provider/delivery_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> myProviders = [
ChangeNotifierProvider<DeliveryProvider>(
      create: (_) => DeliveryProvider(apiRequest: ApiRequest())),
];
