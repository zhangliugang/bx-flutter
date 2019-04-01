import 'package:json_annotation/json_annotation.dart';
import 'helper.dart' ;

part 'UserProfile.g.dart';

@JsonSerializable()
class UserProfile {
  UserProfile(this.name, this.email, this.mobile, this.avatar);

  final String name;
  final String email;
  final String mobile;

  @JsonKey(fromJson: uriFromString, toJson: urlToString)
  final Uri avatar;

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

}