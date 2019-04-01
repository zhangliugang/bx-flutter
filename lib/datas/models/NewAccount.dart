import 'package:json_annotation/json_annotation.dart';

part 'NewAccount.g.dart';

@JsonSerializable()
class NewAccount {

  NewAccount(this.name, this.email, this.mobile, this.password);

  String name;
  String email;
  String password;
  String mobile;

  factory NewAccount.fromJson(Map<String, dynamic> json) => _$NewAccountFromJson(json);
  Map<String, dynamic> toJson() => _$NewAccountToJson(this);
}