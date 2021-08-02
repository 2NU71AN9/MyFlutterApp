import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'sys_roles.dart';

part 'model_user.g.dart';

@JsonSerializable()
class ModelUser {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'username')
  final String? username;
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'initpwd')
  final String? initpwd;
  @JsonKey(name: 'nickname')
  final String? nickname;
  @JsonKey(name: 'headImgUrl')
  final String? headImgUrl;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'sex')
  final int? sex;
  @JsonKey(name: 'companyid')
  final int? companyid;
  @JsonKey(name: 'enabled')
  final bool? enabled;
  @JsonKey(name: 'lockTime')
  final dynamic lockTime;
  @JsonKey(name: 'isMove')
  final int? isMove;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'dept')
  final String? dept;
  @JsonKey(name: 'deptName')
  final String? deptName;
  @JsonKey(name: 'createTime')
  final String? createTime;
  @JsonKey(name: 'updateTime')
  final String? updateTime;
  @JsonKey(name: 'loginTime')
  final String? loginTime;
  @JsonKey(name: 'roles')
  final dynamic roles;
  @JsonKey(name: 'roleId')
  final dynamic roleId;
  @JsonKey(name: 'oldPassword')
  final dynamic oldPassword;
  @JsonKey(name: 'newPassword')
  final dynamic newPassword;
  @JsonKey(name: 'rolecode')
  final dynamic rolecode;
  @JsonKey(name: 'kz1')
  final dynamic kz1;
  @JsonKey(name: 'kz2')
  final dynamic kz2;
  @JsonKey(name: 'kz3')
  final String? kz3;
  @JsonKey(name: 'addCount')
  final int? addCount;
  @JsonKey(name: 'post')
  final String? post;
  @JsonKey(name: 'temporaryCount')
  final int? temporaryCount;
  @JsonKey(name: 'sysRoles')
  final List<SysRoles>? sysRoles;
  @JsonKey(name: 'permissions')
  final List<String>? permissions;
  @JsonKey(name: 'accountNonLocked')
  final bool? accountNonLocked;
  @JsonKey(name: 'credentialsNonExpired')
  final bool? credentialsNonExpired;
  @JsonKey(name: 'accountNonExpired')
  final bool? accountNonExpired;

  const ModelUser({
    this.id,
    this.username,
    this.password,
    this.initpwd,
    this.nickname,
    this.headImgUrl,
    this.phone,
    this.sex,
    this.companyid,
    this.enabled,
    this.lockTime,
    this.isMove,
    this.type,
    this.dept,
    this.deptName,
    this.createTime,
    this.updateTime,
    this.loginTime,
    this.roles,
    this.roleId,
    this.oldPassword,
    this.newPassword,
    this.rolecode,
    this.kz1,
    this.kz2,
    this.kz3,
    this.addCount,
    this.post,
    this.temporaryCount,
    this.sysRoles,
    this.permissions,
    this.accountNonLocked,
    this.credentialsNonExpired,
    this.accountNonExpired,
  });

  @override
  String toString() {
    return 'ModelUser(id: $id, username: $username, password: $password, initpwd: $initpwd, nickname: $nickname, headImgUrl: $headImgUrl, phone: $phone, sex: $sex, companyid: $companyid, enabled: $enabled, lockTime: $lockTime, isMove: $isMove, type: $type, dept: $dept, deptName: $deptName, createTime: $createTime, updateTime: $updateTime, loginTime: $loginTime, roles: $roles, roleId: $roleId, oldPassword: $oldPassword, newPassword: $newPassword, rolecode: $rolecode, kz1: $kz1, kz2: $kz2, kz3: $kz3, addCount: $addCount, post: $post, temporaryCount: $temporaryCount, sysRoles: $sysRoles, permissions: $permissions, accountNonLocked: $accountNonLocked, credentialsNonExpired: $credentialsNonExpired, accountNonExpired: $accountNonExpired)';
  }

  factory ModelUser.fromJson(Map<String, dynamic> json) {
    return _$ModelUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ModelUserToJson(this);

  ModelUser copyWith({
    String? id,
    String? username,
    String? password,
    String? initpwd,
    String? nickname,
    String? headImgUrl,
    String? phone,
    int? sex,
    int? companyid,
    bool? enabled,
    dynamic lockTime,
    int? isMove,
    String? type,
    String? dept,
    String? deptName,
    String? createTime,
    String? updateTime,
    String? loginTime,
    dynamic roles,
    dynamic roleId,
    dynamic oldPassword,
    dynamic newPassword,
    dynamic rolecode,
    dynamic kz1,
    dynamic kz2,
    String? kz3,
    int? addCount,
    String? post,
    int? temporaryCount,
    List<SysRoles>? sysRoles,
    List<String>? permissions,
    bool? accountNonLocked,
    bool? credentialsNonExpired,
    bool? accountNonExpired,
  }) {
    return ModelUser(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      initpwd: initpwd ?? this.initpwd,
      nickname: nickname ?? this.nickname,
      headImgUrl: headImgUrl ?? this.headImgUrl,
      phone: phone ?? this.phone,
      sex: sex ?? this.sex,
      companyid: companyid ?? this.companyid,
      enabled: enabled ?? this.enabled,
      lockTime: lockTime ?? this.lockTime,
      isMove: isMove ?? this.isMove,
      type: type ?? this.type,
      dept: dept ?? this.dept,
      deptName: deptName ?? this.deptName,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      loginTime: loginTime ?? this.loginTime,
      roles: roles ?? this.roles,
      roleId: roleId ?? this.roleId,
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
      rolecode: rolecode ?? this.rolecode,
      kz1: kz1 ?? this.kz1,
      kz2: kz2 ?? this.kz2,
      kz3: kz3 ?? this.kz3,
      addCount: addCount ?? this.addCount,
      post: post ?? this.post,
      temporaryCount: temporaryCount ?? this.temporaryCount,
      sysRoles: sysRoles ?? this.sysRoles,
      permissions: permissions ?? this.permissions,
      accountNonLocked: accountNonLocked ?? this.accountNonLocked,
      credentialsNonExpired:
          credentialsNonExpired ?? this.credentialsNonExpired,
      accountNonExpired: accountNonExpired ?? this.accountNonExpired,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ModelUser &&
        listEquals(other.sysRoles, sysRoles) &&
        listEquals(other.permissions, permissions) &&
        other.id == id &&
        other.username == username &&
        other.password == password &&
        other.initpwd == initpwd &&
        other.nickname == nickname &&
        other.headImgUrl == headImgUrl &&
        other.phone == phone &&
        other.sex == sex &&
        other.companyid == companyid &&
        other.enabled == enabled &&
        other.lockTime == lockTime &&
        other.isMove == isMove &&
        other.type == type &&
        other.dept == dept &&
        other.deptName == deptName &&
        other.createTime == createTime &&
        other.updateTime == updateTime &&
        other.loginTime == loginTime &&
        other.roles == roles &&
        other.roleId == roleId &&
        other.oldPassword == oldPassword &&
        other.newPassword == newPassword &&
        other.rolecode == rolecode &&
        other.kz1 == kz1 &&
        other.kz2 == kz2 &&
        other.kz3 == kz3 &&
        other.addCount == addCount &&
        other.post == post &&
        other.temporaryCount == temporaryCount &&
        other.accountNonLocked == accountNonLocked &&
        other.credentialsNonExpired == credentialsNonExpired &&
        other.accountNonExpired == accountNonExpired;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      password.hashCode ^
      initpwd.hashCode ^
      nickname.hashCode ^
      headImgUrl.hashCode ^
      phone.hashCode ^
      sex.hashCode ^
      companyid.hashCode ^
      enabled.hashCode ^
      lockTime.hashCode ^
      isMove.hashCode ^
      type.hashCode ^
      dept.hashCode ^
      deptName.hashCode ^
      createTime.hashCode ^
      updateTime.hashCode ^
      loginTime.hashCode ^
      roles.hashCode ^
      roleId.hashCode ^
      oldPassword.hashCode ^
      newPassword.hashCode ^
      rolecode.hashCode ^
      kz1.hashCode ^
      kz2.hashCode ^
      kz3.hashCode ^
      addCount.hashCode ^
      post.hashCode ^
      temporaryCount.hashCode ^
      sysRoles.hashCode ^
      permissions.hashCode ^
      accountNonLocked.hashCode ^
      credentialsNonExpired.hashCode ^
      accountNonExpired.hashCode;
}
