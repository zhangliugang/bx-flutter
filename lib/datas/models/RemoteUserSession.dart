import 'package:json_annotation/json_annotation.dart';

part 'RemoteUserSession.g.dart';

@JsonSerializable()
class RemoteUserSession {
  RemoteUserSession(this.token);

  String token;

  factory RemoteUserSession.fromJson(Map<String, dynamic> json) => _$RemoteUserSessionFromJson(json);
  Map<String, dynamic> toJson() => _$RemoteUserSessionToJson(this);
}