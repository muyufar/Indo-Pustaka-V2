import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'cust_service_resp.g.dart';

CustomerServiceResponse customerServiceResponseFromJson(String str) =>
    CustomerServiceResponse.fromJson(json.decode(str));

String customerServiceResponseToJson(CustomerServiceResponse data) =>
    json.encode(data.toJson());

@JsonSerializable()
class CustomerServiceResponse {
  @JsonKey(name: 'nomor_telp')
  String? nomorTelpon;

  CustomerServiceResponse({this.nomorTelpon});

  factory CustomerServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerServiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerServiceResponseToJson(this);
}
