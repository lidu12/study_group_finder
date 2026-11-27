// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudyGroup {

 String get id; String get name; String get courseCode; String get courseName; String get description; String get creatorName; int get memberCount; bool get isMember;
/// Create a copy of StudyGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudyGroupCopyWith<StudyGroup> get copyWith => _$StudyGroupCopyWithImpl<StudyGroup>(this as StudyGroup, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudyGroup;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudyGroup&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.courseCode, _this.courseCode) || other.courseCode == _this.courseCode)&&(identical(other.courseName, _this.courseName) || other.courseName == _this.courseName)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.creatorName, _this.creatorName) || other.creatorName == _this.creatorName)&&(identical(other.memberCount, _this.memberCount) || other.memberCount == _this.memberCount)&&(identical(other.isMember, _this.isMember) || other.isMember == _this.isMember));
}


@override
int get hashCode {
  final _this = this as StudyGroup;
  return Object.hash(runtimeType,_this.id,_this.name,_this.courseCode,_this.courseName,_this.description,_this.creatorName,_this.memberCount,_this.isMember);
}

@override
String toString() {
  final _this = this as StudyGroup;
  return 'StudyGroup(id: ${_this.id}, name: ${_this.name}, courseCode: ${_this.courseCode}, courseName: ${_this.courseName}, description: ${_this.description}, creatorName: ${_this.creatorName}, memberCount: ${_this.memberCount}, isMember: ${_this.isMember})';
}


}

/// @nodoc
abstract mixin class $StudyGroupCopyWith<$Res>  {
  factory $StudyGroupCopyWith(StudyGroup value, $Res Function(StudyGroup) _then) = _$StudyGroupCopyWithImpl;
@useResult
$Res call({
 String id, String name, String courseCode, String courseName, String description, String creatorName, int memberCount, bool isMember
});




}
/// @nodoc
class _$StudyGroupCopyWithImpl<$Res>
    implements $StudyGroupCopyWith<$Res> {
  _$StudyGroupCopyWithImpl(this._self, this._then);

  final StudyGroup _self;
  final $Res Function(StudyGroup) _then;

/// Create a copy of StudyGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? courseCode = null,Object? courseName = null,Object? description = null,Object? creatorName = null,Object? memberCount = null,Object? isMember = null,}) {
  return _then(StudyGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,courseCode: null == courseCode ? _self.courseCode : courseCode // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,creatorName: null == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,isMember: null == isMember ? _self.isMember : isMember // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StudyGroup].
extension StudyGroupPatterns on StudyGroup {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudyGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudyGroup() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudyGroup value)  $default,){
final _that = this;
switch (_that) {
case _StudyGroup():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudyGroup value)?  $default,){
final _that = this;
switch (_that) {
case _StudyGroup() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String courseCode,  String courseName,  String description,  String creatorName,  int memberCount,  bool isMember)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudyGroup() when $default != null:
return $default(_that.id,_that.name,_that.courseCode,_that.courseName,_that.description,_that.creatorName,_that.memberCount,_that.isMember);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String courseCode,  String courseName,  String description,  String creatorName,  int memberCount,  bool isMember)  $default,) {final _that = this;
switch (_that) {
case _StudyGroup():
return $default(_that.id,_that.name,_that.courseCode,_that.courseName,_that.description,_that.creatorName,_that.memberCount,_that.isMember);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String courseCode,  String courseName,  String description,  String creatorName,  int memberCount,  bool isMember)?  $default,) {final _that = this;
switch (_that) {
case _StudyGroup() when $default != null:
return $default(_that.id,_that.name,_that.courseCode,_that.courseName,_that.description,_that.creatorName,_that.memberCount,_that.isMember);case _:
  return null;

}
}

}

/// @nodoc


class _StudyGroup implements StudyGroup {
  const _StudyGroup({required this.id, required this.name, required this.courseCode, required this.courseName, required this.description, required this.creatorName, required this.memberCount, required this.isMember});
  

@override final  String id;
@override final  String name;
@override final  String courseCode;
@override final  String courseName;
@override final  String description;
@override final  String creatorName;
@override final  int memberCount;
@override final  bool isMember;

/// Create a copy of StudyGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudyGroupCopyWith<_StudyGroup> get copyWith => __$StudyGroupCopyWithImpl<_StudyGroup>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudyGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.courseCode, courseCode) || other.courseCode == courseCode)&&(identical(other.courseName, courseName) || other.courseName == courseName)&&(identical(other.description, description) || other.description == description)&&(identical(other.creatorName, creatorName) || other.creatorName == creatorName)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.isMember, isMember) || other.isMember == isMember));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,courseCode,courseName,description,creatorName,memberCount,isMember);
}

@override
String toString() {
    return 'StudyGroup(id: $id, name: $name, courseCode: $courseCode, courseName: $courseName, description: $description, creatorName: $creatorName, memberCount: $memberCount, isMember: $isMember)';
}


}

/// @nodoc
abstract mixin class _$StudyGroupCopyWith<$Res> implements $StudyGroupCopyWith<$Res> {
  factory _$StudyGroupCopyWith(_StudyGroup value, $Res Function(_StudyGroup) _then) = __$StudyGroupCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String courseCode, String courseName, String description, String creatorName, int memberCount, bool isMember
});




}
/// @nodoc
class __$StudyGroupCopyWithImpl<$Res>
    implements _$StudyGroupCopyWith<$Res> {
  __$StudyGroupCopyWithImpl(this._self, this._then);

  final _StudyGroup _self;
  final $Res Function(_StudyGroup) _then;

/// Create a copy of StudyGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? courseCode = null,Object? courseName = null,Object? description = null,Object? creatorName = null,Object? memberCount = null,Object? isMember = null,}) {
  return _then(_StudyGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,courseCode: null == courseCode ? _self.courseCode : courseCode // ignore: cast_nullable_to_non_nullable
as String,courseName: null == courseName ? _self.courseName : courseName // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,creatorName: null == creatorName ? _self.creatorName : creatorName // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,isMember: null == isMember ? _self.isMember : isMember // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
