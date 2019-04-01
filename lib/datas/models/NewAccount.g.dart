// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewAccount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAccount _$NewAccountFromJson(Map<String, dynamic> json) {
  return NewAccount(json['name'] as String, json['email'] as String,
      json['mobile'] as String, json['password'] as String);
}

Map<String, dynamic> _$NewAccountToJson(NewAccount instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'mobile': instance.mobile
    };
