class ApiResponse {
  dynamic message;
  dynamic data;
  dynamic otp;
  dynamic error;
  ApiResponse({
    this.message,
    this.data,
    this.otp,
    this.error,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      error: json["error"],
      message: json["message"],
      data: json["data"],
      otp: json["otp"],
    );
  }

  Map<String, dynamic> apiBaseResponseToJson(ApiResponse instance) {
    return <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
  }
}
