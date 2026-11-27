// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StudyPlanItem {

 int get order; int get durationMinutes; String get title; String get description; bool get isBreak;
/// Create a copy of StudyPlanItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudyPlanItemCopyWith<StudyPlanItem> get copyWith => _$StudyPlanItemCopyWithImpl<StudyPlanItem>(this as StudyPlanItem, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudyPlanItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudyPlanItem&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.durationMinutes, _this.durationMinutes) || other.durationMinutes == _this.durationMinutes)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.isBreak, _this.isBreak) || other.isBreak == _this.isBreak));
}


@override
int get hashCode {
  final _this = this as StudyPlanItem;
  return Object.hash(runtimeType,_this.order,_this.durationMinutes,_this.title,_this.description,_this.isBreak);
}

@override
String toString() {
  final _this = this as StudyPlanItem;
  return 'StudyPlanItem(order: ${_this.order}, durationMinutes: ${_this.durationMinutes}, title: ${_this.title}, description: ${_this.description}, isBreak: ${_this.isBreak})';
}


}

/// @nodoc
abstract mixin class $StudyPlanItemCopyWith<$Res>  {
  factory $StudyPlanItemCopyWith(StudyPlanItem value, $Res Function(StudyPlanItem) _then) = _$StudyPlanItemCopyWithImpl;
@useResult
$Res call({
 int order, int durationMinutes, String title, String description, bool isBreak
});




}
/// @nodoc
class _$StudyPlanItemCopyWithImpl<$Res>
    implements $StudyPlanItemCopyWith<$Res> {
  _$StudyPlanItemCopyWithImpl(this._self, this._then);

  final StudyPlanItem _self;
  final $Res Function(StudyPlanItem) _then;

/// Create a copy of StudyPlanItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? durationMinutes = null,Object? title = null,Object? description = null,Object? isBreak = null,}) {
  return _then(StudyPlanItem(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isBreak: null == isBreak ? _self.isBreak : isBreak // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StudyPlanItem].
extension StudyPlanItemPatterns on StudyPlanItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudyPlanItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudyPlanItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudyPlanItem value)  $default,){
final _that = this;
switch (_that) {
case _StudyPlanItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudyPlanItem value)?  $default,){
final _that = this;
switch (_that) {
case _StudyPlanItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int order,  int durationMinutes,  String title,  String description,  bool isBreak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudyPlanItem() when $default != null:
return $default(_that.order,_that.durationMinutes,_that.title,_that.description,_that.isBreak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int order,  int durationMinutes,  String title,  String description,  bool isBreak)  $default,) {final _that = this;
switch (_that) {
case _StudyPlanItem():
return $default(_that.order,_that.durationMinutes,_that.title,_that.description,_that.isBreak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int order,  int durationMinutes,  String title,  String description,  bool isBreak)?  $default,) {final _that = this;
switch (_that) {
case _StudyPlanItem() when $default != null:
return $default(_that.order,_that.durationMinutes,_that.title,_that.description,_that.isBreak);case _:
  return null;

}
}

}

/// @nodoc


class _StudyPlanItem extends StudyPlanItem {
  const _StudyPlanItem({required this.order, required this.durationMinutes, required this.title, required this.description, this.isBreak = false}): super._();
  

@override final  int order;
@override final  int durationMinutes;
@override final  String title;
@override final  String description;
@override@JsonKey() final  bool isBreak;

/// Create a copy of StudyPlanItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudyPlanItemCopyWith<_StudyPlanItem> get copyWith => __$StudyPlanItemCopyWithImpl<_StudyPlanItem>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudyPlanItem&&(identical(other.order, order) || other.order == order)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isBreak, isBreak) || other.isBreak == isBreak));
}


@override
int get hashCode {
    return Object.hash(runtimeType,order,durationMinutes,title,description,isBreak);
}

@override
String toString() {
    return 'StudyPlanItem(order: $order, durationMinutes: $durationMinutes, title: $title, description: $description, isBreak: $isBreak)';
}


}

/// @nodoc
abstract mixin class _$StudyPlanItemCopyWith<$Res> implements $StudyPlanItemCopyWith<$Res> {
  factory _$StudyPlanItemCopyWith(_StudyPlanItem value, $Res Function(_StudyPlanItem) _then) = __$StudyPlanItemCopyWithImpl;
@override @useResult
$Res call({
 int order, int durationMinutes, String title, String description, bool isBreak
});




}
/// @nodoc
class __$StudyPlanItemCopyWithImpl<$Res>
    implements _$StudyPlanItemCopyWith<$Res> {
  __$StudyPlanItemCopyWithImpl(this._self, this._then);

  final _StudyPlanItem _self;
  final $Res Function(_StudyPlanItem) _then;

/// Create a copy of StudyPlanItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? durationMinutes = null,Object? title = null,Object? description = null,Object? isBreak = null,}) {
  return _then(_StudyPlanItem(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isBreak: null == isBreak ? _self.isBreak : isBreak // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$StudyPlan {

 String get id; String get topic; double get totalHours; String get goal; List<StudyPlanItem> get items; DateTime get createdAt;
/// Create a copy of StudyPlan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudyPlanCopyWith<StudyPlan> get copyWith => _$StudyPlanCopyWithImpl<StudyPlan>(this as StudyPlan, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as StudyPlan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudyPlan&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.totalHours, _this.totalHours) || other.totalHours == _this.totalHours)&&(identical(other.goal, _this.goal) || other.goal == _this.goal)&&const DeepCollectionEquality().equals(other.items, _this.items)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as StudyPlan;
  return Object.hash(runtimeType,_this.id,_this.topic,_this.totalHours,_this.goal,const DeepCollectionEquality().hash(_this.items),_this.createdAt);
}

@override
String toString() {
  final _this = this as StudyPlan;
  return 'StudyPlan(id: ${_this.id}, topic: ${_this.topic}, totalHours: ${_this.totalHours}, goal: ${_this.goal}, items: ${_this.items}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $StudyPlanCopyWith<$Res>  {
  factory $StudyPlanCopyWith(StudyPlan value, $Res Function(StudyPlan) _then) = _$StudyPlanCopyWithImpl;
@useResult
$Res call({
 String id, String topic, double totalHours, String goal, List<StudyPlanItem> items, DateTime createdAt
});




}
/// @nodoc
class _$StudyPlanCopyWithImpl<$Res>
    implements $StudyPlanCopyWith<$Res> {
  _$StudyPlanCopyWithImpl(this._self, this._then);

  final StudyPlan _self;
  final $Res Function(StudyPlan) _then;

/// Create a copy of StudyPlan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? topic = null,Object? totalHours = null,Object? goal = null,Object? items = null,Object? createdAt = null,}) {
  return _then(StudyPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<StudyPlanItem>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StudyPlan].
extension StudyPlanPatterns on StudyPlan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudyPlan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudyPlan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudyPlan value)  $default,){
final _that = this;
switch (_that) {
case _StudyPlan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudyPlan value)?  $default,){
final _that = this;
switch (_that) {
case _StudyPlan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String topic,  double totalHours,  String goal,  List<StudyPlanItem> items,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudyPlan() when $default != null:
return $default(_that.id,_that.topic,_that.totalHours,_that.goal,_that.items,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String topic,  double totalHours,  String goal,  List<StudyPlanItem> items,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StudyPlan():
return $default(_that.id,_that.topic,_that.totalHours,_that.goal,_that.items,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String topic,  double totalHours,  String goal,  List<StudyPlanItem> items,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StudyPlan() when $default != null:
return $default(_that.id,_that.topic,_that.totalHours,_that.goal,_that.items,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _StudyPlan implements StudyPlan {
  const _StudyPlan({required this.id, required this.topic, required this.totalHours, required this.goal, required  List<StudyPlanItem> items, required this.createdAt}): _items = items;
  

@override final  String id;
@override final  String topic;
@override final  double totalHours;
@override final  String goal;
 final  List<StudyPlanItem> _items;
@override List<StudyPlanItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  DateTime createdAt;

/// Create a copy of StudyPlan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudyPlanCopyWith<_StudyPlan> get copyWith => __$StudyPlanCopyWithImpl<_StudyPlan>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudyPlan&&(identical(other.id, id) || other.id == id)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.totalHours, totalHours) || other.totalHours == totalHours)&&(identical(other.goal, goal) || other.goal == goal)&&const DeepCollectionEquality().equals(other.items, _items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,topic,totalHours,goal,const DeepCollectionEquality().hash(_items),createdAt);
}

@override
String toString() {
    return 'StudyPlan(id: $id, topic: $topic, totalHours: $totalHours, goal: $goal, items: $items, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StudyPlanCopyWith<$Res> implements $StudyPlanCopyWith<$Res> {
  factory _$StudyPlanCopyWith(_StudyPlan value, $Res Function(_StudyPlan) _then) = __$StudyPlanCopyWithImpl;
@override @useResult
$Res call({
 String id, String topic, double totalHours, String goal, List<StudyPlanItem> items, DateTime createdAt
});




}
/// @nodoc
class __$StudyPlanCopyWithImpl<$Res>
    implements _$StudyPlanCopyWith<$Res> {
  __$StudyPlanCopyWithImpl(this._self, this._then);

  final _StudyPlan _self;
  final $Res Function(_StudyPlan) _then;

/// Create a copy of StudyPlan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? topic = null,Object? totalHours = null,Object? goal = null,Object? items = null,Object? createdAt = null,}) {
  return _then(_StudyPlan(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,totalHours: null == totalHours ? _self.totalHours : totalHours // ignore: cast_nullable_to_non_nullable
as double,goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<StudyPlanItem>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
