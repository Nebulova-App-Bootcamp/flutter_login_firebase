import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class UserModel {
  final String? uid;
  final String? name;
  final String? photoUrl;
  final String? email;

  UserModel({
    required this.uid,
    required this.name,
    required this.photoUrl,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
