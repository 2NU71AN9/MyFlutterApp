import 'package:json_annotation/json_annotation.dart';

part 'sys_roles.g.dart';

@JsonSerializable()
class SysRoles {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'createTime')
  final String? createTime;
  @JsonKey(name: 'updateTime')
  final String? updateTime;
  @JsonKey(name: 'userId')
  final dynamic userId;

  const SysRoles({
    this.id,
    this.code,
    this.name,
    this.createTime,
    this.updateTime,
    this.userId,
  });

  @override
  String toString() {
    return 'SysRoles(id: $id, code: $code, name: $name, createTime: $createTime, updateTime: $updateTime, userId: $userId)';
  }

  factory SysRoles.fromJson(Map<String, dynamic> json) {
    return _$SysRolesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SysRolesToJson(this);

  SysRoles copyWith({
    String? id,
    String? code,
    String? name,
    String? createTime,
    String? updateTime,
    dynamic userId,
  }) {
    return SysRoles(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      userId: userId ?? this.userId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SysRoles &&
        other.id == id &&
        other.code == code &&
        other.name == name &&
        other.createTime == createTime &&
        other.updateTime == updateTime &&
        other.userId == userId;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      code.hashCode ^
      name.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode ^
      userId.hashCode;
}
