class DeliveryModel {
  String responseCode;
  String responseMessage;
  String? startTime;
  String? finishTime;
  String? plannedStartTime;
  String? deliveryNumber;
  List<Stop> stopList;

  DeliveryModel({
    required this.responseCode,
    required this.responseMessage,
    this.startTime,
    this.finishTime,
    this.plannedStartTime,
    this.deliveryNumber,
    required this.stopList,
  });

  factory DeliveryModel.fromJson(Map<String, dynamic> parsedJson) {
    var listStop = parsedJson['stopList'] as List?;
    List<Stop> listData = [];
    if (listStop != null) {
      listData = listStop.map((i) => Stop.fromJson(i)).toList();
    }
    return DeliveryModel(
        responseCode: parsedJson['responseCode'],
        responseMessage: parsedJson['responseMessage'],
        startTime: parsedJson['startTime'],
        finishTime: parsedJson['finishTime'],
        plannedStartTime: parsedJson['plannedStartTime'],
        deliveryNumber: parsedJson['deliveryNumber'],
        stopList: listData);
  }
}

class Stop {
  int? number;
  String? name;
  String? address;
  int? stopIndex;
  String? stopStartTime;
  String? stopEndTime;
  int? unloadingTime;
  List<Matrix> matrixList;

  Stop(
      {this.number,
      this.name,
      this.address,
      this.stopIndex,
      this.stopStartTime,
      this.stopEndTime,
      this.unloadingTime,
      required this.matrixList});
  factory Stop.fromJson(Map<String, dynamic> parsedJson) {
    var listMatrix = parsedJson['matrixList'] as List?;
    List<Matrix> listData = [];
    if (listMatrix != null) {
      listData = listMatrix.map((i) => Matrix.fromJson(i)).toList();
    }
    return Stop(
      matrixList: listData,
    );
  }
}

class Matrix {
  String? stop;
  int? length;
  int? duration;

  Matrix({this.stop, this.length, this.duration});
  factory Matrix.fromJson(Map<String, dynamic> parsedJson) {
    return Matrix(
      stop: parsedJson['stop'],
      length: parsedJson['length'],
      duration: parsedJson['duration'],
    );
  }
}
