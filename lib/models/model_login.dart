import 'package:json_annotation/json_annotation.dart';
part 'model_login.g.dart';

@JsonSerializable()
class ModelLogin extends BaseModel {
  @JsonKey(name: 'access_token')
  final String? accessToken;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
  @JsonKey(name: 'expires_in')
  final int? expiresIn;
  @JsonKey(name: 'scope')
  final String? scope;

  ModelLogin({
    this.accessToken,
    this.tokenType,
    this.refreshToken,
    this.expiresIn,
    this.scope,
  });

  @override
  String toString() {
    return 'ModelLogin(accessToken: $accessToken, tokenType: $tokenType, refreshToken: $refreshToken, expiresIn: $expiresIn, scope: $scope)';
  }

  factory ModelLogin.fromJson(Map<String, dynamic> json) {
    return _$ModelLoginFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ModelLoginToJson(this);

  ModelLogin copyWith({
    String? accessToken,
    String? tokenType,
    String? refreshToken,
    int? expiresIn,
    String? scope,
  }) {
    return ModelLogin(
      accessToken: accessToken ?? this.accessToken,
      tokenType: tokenType ?? this.tokenType,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresIn: expiresIn ?? this.expiresIn,
      scope: scope ?? this.scope,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelLogin &&
        other.accessToken == accessToken &&
        other.tokenType == tokenType &&
        other.refreshToken == refreshToken &&
        other.expiresIn == expiresIn &&
        other.scope == scope;
  }

  @override
  int get hashCode =>
      accessToken.hashCode ^
      tokenType.hashCode ^
      refreshToken.hashCode ^
      expiresIn.hashCode ^
      scope.hashCode;
}

class BaseModel {
  BaseModel();
  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel();
  }
}
