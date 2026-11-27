// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudySession {

 String get id; String get courseCode; String get topic; String get date; String get startTime; String get endTime; String get meetingPlace; String get organizerName; List<String> get memberNames; bool get isJoined; double? get latitude; double? get longitude; int? get maxParticipants;
/// Create a copy of StudySession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudySessionCopyWith<StudySession> get copyWith => _$StudySessionCopyWithImpl<StudySession>(this as StudySession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudySession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudySession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.courseCode, _this.courseCode) || other.courseCode == _this.courseCode)&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime)&&(identical(other.meetingPlace, _this.meetingPlace) || other.meetingPlace == _this.meetingPlace)&&(identical(other.organizerName, _this.organizerName) || other.organizerName == _this.organizerName)&&const DeepCollectionEquality().equals(other.memberNames, _this.memberNames)&&(identical(other.isJoined, _this.isJoined) || other.isJoined == _this.isJoined)&&(identical(other.latitude, _this.latitude) || other.latitude == _this.latitude)&&(identical(other.longitude, _this.longitude) || other.longitude == _this.longitude)&&(identical(other.maxParticipants, _this.maxParticipants) || other.maxParticipants == _this.maxParticipants));
}


@override
int get hashCode {
  final _this = this as StudySession;
  return Object.hash(runtimeType,_this.id,_this.courseCode,_this.topic,_this.date,_this.startTime,_this.endTime,_this.meetingPlace,_this.organizerName,const DeepCollectionEquality().hash(_this.memberNames),_this.isJoined,_this.latitude,_this.longitude,_this.maxParticipants);
}

@override
String toString() {
  final _this = this as StudySession;
  return 'StudySession(id: ${_this.id}, courseCode: ${_this.courseCode}, topic: ${_this.topic}, date: ${_this.date}, startTime: ${_this.startTime}, endTime: ${_this.endTime}, meetingPlace: ${_this.meetingPlace}, organizerName: ${_this.organizerName}, memberNames: ${_this.memberNames}, isJoined: ${_this.isJoined}, latitude: ${_this.latitude}, longitude: ${_this.longitude}, maxParticipants: ${_this.maxParticipants})';
}


}

/// @nodoc
abstract mixin class $StudySessionCopyWith<$Res>  {
  factory $StudySessionCopyWith(StudySession value, $Res Function(StudySession) _then) = _$StudySessionCopyWithImpl;
@useResult
$Res call({
 String id, String courseCode, String topic, String date, String startTime, String endTime, String meetingPlace, String organizerName, List<String> memberNames, bool isJoined, double? latitude, double? longitude, int? maxParticipants
});




}
/// @nodoc
class _$StudySessionCopyWithImpl<$Res>
    implements $StudySessionCopyWith<$Res> {
  _$StudySessionCopyWithImpl(this._self, this._then);

  final StudySession _self;
  final $Res Function(StudySession) _then;

/// Create a copy of StudySession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseCode = null,Object? topic = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? meetingPlace = null,Object? organizerName = null,Object? memberNames = null,Object? isJoined = null,Object? latitude = freezed,Object? longitude = freezed,Object? maxParticipants = freezed,}) {
  return _then(StudySession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseCode: null == courseCode ? _self.courseCode : courseCode // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,meetingPlace: null == meetingPlace ? _self.meetingPlace : meetingPlace // ignore: cast_nullable_to_non_nullable
as String,organizerName: null == organizerName ? _self.organizerName : organizerName // ignore: cast_nullable_to_non_nullable
as String,memberNames: null == memberNames ? _self.memberNames : memberNames // ignore: cast_nullable_to_non_nullable
as List<String>,isJoined: null == isJoined ? _self.isJoined : isJoined // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,maxParticipants: freezed == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [StudySession].
extension StudySessionPatterns on StudySession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudySession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudySession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudySession value)  $default,){
final _that = this;
switch (_that) {
case _StudySession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudySession value)?  $default,){
final _that = this;
switch (_that) {
case _StudySession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String courseCode,  String topic,  String date,  String startTime,  String endTime,  String meetingPlace,  String organizerName,  List<String> memberNames,  bool isJoined,  double? latitude,  double? longitude,  int? maxParticipants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudySession() when $default != null:
return $default(_that.id,_that.courseCode,_that.topic,_that.date,_that.startTime,_that.endTime,_that.meetingPlace,_that.organizerName,_that.memberNames,_that.isJoined,_that.latitude,_that.longitude,_that.maxParticipants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String courseCode,  String topic,  String date,  String startTime,  String endTime,  String meetingPlace,  String organizerName,  List<String> memberNames,  bool isJoined,  double? latitude,  double? longitude,  int? maxParticipants)  $default,) {final _that = this;
switch (_that) {
case _StudySession():
return $default(_that.id,_that.courseCode,_that.topic,_that.date,_that.startTime,_that.endTime,_that.meetingPlace,_that.organizerName,_that.memberNames,_that.isJoined,_that.latitude,_that.longitude,_that.maxParticipants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String courseCode,  String topic,  String date,  String startTime,  String endTime,  String meetingPlace,  String organizerName,  List<String> memberNames,  bool isJoined,  double? latitude,  double? longitude,  int? maxParticipants)?  $default,) {final _that = this;
switch (_that) {
case _StudySession() when $default != null:
return $default(_that.id,_that.courseCode,_that.topic,_that.date,_that.startTime,_that.endTime,_that.meetingPlace,_that.organizerName,_that.memberNames,_that.isJoined,_that.latitude,_that.longitude,_that.maxParticipants);case _:
  return null;

}
}

}

/// @nodoc


class _StudySession implements StudySession {
  const _StudySession({required this.id, required this.courseCode, required this.topic, required this.date, required this.startTime, required this.endTime, required this.meetingPlace, required this.organizerName, required  List<String> memberNames, required this.isJoined, this.latitude, this.longitude, this.maxParticipants}): _memberNames = memberNames;
  

@override final  String id;
@override final  String courseCode;
@override final  String topic;
@override final  String date;
@override final  String startTime;
@override final  String endTime;
@override final  String meetingPlace;
@override final  String organizerName;
 final  List<String> _memberNames;
@override List<String> get memberNames {
  if (_memberNames is EqualUnmodifiableListView) return _memberNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_memberNames);
}

@override final  bool isJoined;
@override final  double? latitude;
@override final  double? longitude;
@override final  int? maxParticipants;

/// Create a copy of StudySession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudySessionCopyWith<_StudySession> get copyWith => __$StudySessionCopyWithImpl<_StudySession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudySession&&(identical(other.id, id) || other.id == id)&&(identical(other.courseCode, courseCode) || other.courseCode == courseCode)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.meetingPlace, meetingPlace) || other.meetingPlace == meetingPlace)&&(identical(other.organizerName, organizerName) || other.organizerName == organizerName)&&const DeepCollectionEquality().equals(other.memberNames, _memberNames)&&(identical(other.isJoined, isJoined) || other.isJoined == isJoined)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,courseCode,topic,date,startTime,endTime,meetingPlace,organizerName,const DeepCollectionEquality().hash(_memberNames),isJoined,latitude,longitude,maxParticipants);
}

@override
String toString() {
    return 'StudySession(id: $id, courseCode: $courseCode, topic: $topic, date: $date, startTime: $startTime, endTime: $endTime, meetingPlace: $meetingPlace, organizerName: $organizerName, memberNames: $memberNames, isJoined: $isJoined, latitude: $latitude, longitude: $longitude, maxParticipants: $maxParticipants)';
}


}

/// @nodoc
abstract mixin class _$StudySessionCopyWith<$Res> implements $StudySessionCopyWith<$Res> {
  factory _$StudySessionCopyWith(_StudySession value, $Res Function(_StudySession) _then) = __$StudySessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String courseCode, String topic, String date, String startTime, String endTime, String meetingPlace, String organizerName, List<String> memberNames, bool isJoined, double? latitude, double? longitude, int? maxParticipants
});




}
/// @nodoc
class __$StudySessionCopyWithImpl<$Res>
    implements _$StudySessionCopyWith<$Res> {
  __$StudySessionCopyWithImpl(this._self, this._then);

  final _StudySession _self;
  final $Res Function(_StudySession) _then;

/// Create a copy of StudySession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseCode = null,Object? topic = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? meetingPlace = null,Object? organizerName = null,Object? memberNames = null,Object? isJoined = null,Object? latitude = freezed,Object? longitude = freezed,Object? maxParticipants = freezed,}) {
  return _then(_StudySession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseCode: null == courseCode ? _self.courseCode : courseCode // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,meetingPlace: null == meetingPlace ? _self.meetingPlace : meetingPlace // ignore: cast_nullable_to_non_nullable
as String,organizerName: null == organizerName ? _self.organizerName : organizerName // ignore: cast_nullable_to_non_nullable
as String,memberNames: null == memberNames ? _self._memberNames : memberNames // ignore: cast_nullable_to_non_nullable
as List<String>,isJoined: null == isJoined ? _self.isJoined : isJoined // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,maxParticipants: freezed == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
