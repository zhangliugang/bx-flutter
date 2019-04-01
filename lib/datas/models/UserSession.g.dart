// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserSession.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSession _$UserSessionFromJson(Map<String, dynamic> json) {
  return UserSession(
      json['profile'] == null
          ? null
          : UserProfile.fromJson(json['profile'] as Map<String, dynamic>),
      json['remoteUserSession'] == null
          ? null
          : RemoteUserSession.fromJson(
              json['remoteUserSession'] as Map<String, dynamic>));
}

Map<String, dynamic> _$UserSessionToJson(UserSession instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'remoteUserSession': instance.remoteUserSession
    };
