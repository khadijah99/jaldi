class ErrorResponse {
  Response? response;

  ErrorResponse({this.response});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  String? message;
  String? result;
  int? statusCode;

  Response({this.message, this.result, this.statusCode});

  Response.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    result = json['result'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['result'] = result;
    data['status_code'] = statusCode;
    return data;
  }
}
