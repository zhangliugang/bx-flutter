// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return UserProfile(
      json['name'] as String,
      json['email'] as String,
      json['mobile'] as String,
      json['avatar'] == null ? null : uriFromString(json['avatar'] as String));
}

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mobile': instance.mobile,
      'avatar': instance.avatar == null ? null : urlToString(instance.avatar)
    };
