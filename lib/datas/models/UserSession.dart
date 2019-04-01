import 'package:json_annotation/json_annotation.dart';
import 'UserProfile.dart';
import 'RemoteUserSession.dart';

part 'UserSession.g.dart';

@JsonSerializable()
class UserSession {
  UserSession(this.profile, this.remoteUserSession);

  final UserProfile profile;
  final RemoteUserSession remoteUserSession;

  factory UserSession.fromJson(Map<String, dynamic> json) => _$UserSessionFromJson(json);
  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}