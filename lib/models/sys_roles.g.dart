// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_roles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysRoles _$SysRolesFromJson(Map<String, dynamic> json) {
  return SysRoles(
    id: json['id'] as String?,
    code: json['code'] as String?,
    name: json['name'] as String?,
    createTime: json['createTime'] as String?,
    updateTime: json['updateTime'] as String?,
    userId: json['userId'],
  );
}

Map<String, dynamic> _$SysRolesToJson(SysRoles instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'userId': instance.userId,
    };
