// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelLogin _$ModelLoginFromJson(Map<String, dynamic> json) {
  return ModelLogin(
    accessToken: json['access_token'] as String?,
    tokenType: json['token_type'] as String?,
    refreshToken: json['refresh_token'] as String?,
    expiresIn: json['expires_in'] as int?,
    scope: json['scope'] as String?,
  );
}

Map<String, dynamic> _$ModelLoginToJson(ModelLogin instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'scope': instance.scope,
    };
