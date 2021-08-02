// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelUser _$ModelUserFromJson(Map<String, dynamic> json) {
  return ModelUser(
    id: json['id'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
    initpwd: json['initpwd'] as String?,
    nickname: json['nickname'] as String?,
    headImgUrl: json['headImgUrl'] as String?,
    phone: json['phone'] as String?,
    sex: json['sex'] as int?,
    companyid: json['companyid'] as int?,
    enabled: json['enabled'] as bool?,
    lockTime: json['lockTime'],
    isMove: json['isMove'] as int?,
    type: json['type'] as String?,
    dept: json['dept'] as String?,
    deptName: json['deptName'] as String?,
    createTime: json['createTime'] as String?,
    updateTime: json['updateTime'] as String?,
    loginTime: json['loginTime'] as String?,
    roles: json['roles'],
    roleId: json['roleId'],
    oldPassword: json['oldPassword'],
    newPassword: json['newPassword'],
    rolecode: json['rolecode'],
    kz1: json['kz1'],
    kz2: json['kz2'],
    kz3: json['kz3'] as String?,
    addCount: json['addCount'] as int?,
    post: json['post'] as String?,
    temporaryCount: json['temporaryCount'] as int?,
    sysRoles: (json['sysRoles'] as List<dynamic>?)
        ?.map((e) => SysRoles.fromJson(e as Map<String, dynamic>))
        .toList(),
    permissions: (json['permissions'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    accountNonLocked: json['accountNonLocked'] as bool?,
    credentialsNonExpired: json['credentialsNonExpired'] as bool?,
    accountNonExpired: json['accountNonExpired'] as bool?,
  );
}

Map<String, dynamic> _$ModelUserToJson(ModelUser instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'initpwd': instance.initpwd,
      'nickname': instance.nickname,
      'headImgUrl': instance.headImgUrl,
      'phone': instance.phone,
      'sex': instance.sex,
      'companyid': instance.companyid,
      'enabled': instance.enabled,
      'lockTime': instance.lockTime,
      'isMove': instance.isMove,
      'type': instance.type,
      'dept': instance.dept,
      'deptName': instance.deptName,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'loginTime': instance.loginTime,
      'roles': instance.roles,
      'roleId': instance.roleId,
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
      'rolecode': instance.rolecode,
      'kz1': instance.kz1,
      'kz2': instance.kz2,
      'kz3': instance.kz3,
      'addCount': instance.addCount,
      'post': instance.post,
      'temporaryCount': instance.temporaryCount,
      'sysRoles': instance.sysRoles,
      'permissions': instance.permissions,
      'accountNonLocked': instance.accountNonLocked,
      'credentialsNonExpired': instance.credentialsNonExpired,
      'accountNonExpired': instance.accountNonExpired,
    };
