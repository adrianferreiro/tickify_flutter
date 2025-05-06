import 'dart:convert';

GeneralResponse generalResponseFromJson(String str) =>
    GeneralResponse.fromJson(json.decode(str));

String errorModelToJson(GeneralResponse data) => json.encode(data.toJson());

class GeneralResponse {
  final bool ok;
  final String message;

  GeneralResponse({required this.ok, required this.message});

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
      GeneralResponse(ok: json["ok"], message: json["message"]);

  Map<String, dynamic> toJson() => {"ok": ok, "message": message};
}
