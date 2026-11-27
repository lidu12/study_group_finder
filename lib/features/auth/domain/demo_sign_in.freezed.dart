// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'demo_sign_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DemoSignIn {

 String get email;
/// Create a copy of DemoSignIn
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DemoSignInCopyWith<DemoSignIn> get copyWith => _$DemoSignInCopyWithImpl<DemoSignIn>(this as DemoSignIn, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DemoSignIn;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DemoSignIn&&(identical(other.email, _this.email) || other.email == _this.email));
}


@override
int get hashCode {
  final _this = this as DemoSignIn;
  return Object.hash(runtimeType,_this.email);
}

@override
String toString() {
  final _this = this as DemoSignIn;
  return 'DemoSignIn(email: ${_this.email})';
}


}

/// @nodoc
abstract mixin class $DemoSignInCopyWith<$Res>  {
  factory $DemoSignInCopyWith(DemoSignIn value, $Res Function(DemoSignIn) _then) = _$DemoSignInCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$DemoSignInCopyWithImpl<$Res>
    implements $DemoSignInCopyWith<$Res> {
  _$DemoSignInCopyWithImpl(this._self, this._then);

  final DemoSignIn _self;
  final $Res Function(DemoSignIn) _then;

/// Create a copy of DemoSignIn
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(DemoSignIn(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DemoSignIn].
extension DemoSignInPatterns on DemoSignIn {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DemoSignIn value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DemoSignIn() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DemoSignIn value)  $default,){
final _that = this;
switch (_that) {
case _DemoSignIn():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DemoSignIn value)?  $default,){
final _that = this;
switch (_that) {
case _DemoSignIn() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DemoSignIn() when $default != null:
return $default(_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email)  $default,) {final _that = this;
switch (_that) {
case _DemoSignIn():
return $default(_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email)?  $default,) {final _that = this;
switch (_that) {
case _DemoSignIn() when $default != null:
return $default(_that.email);case _:
  return null;

}
}

}

/// @nodoc


class _DemoSignIn implements DemoSignIn {
  const _DemoSignIn({required this.email});
  

@override final  String email;

/// Create a copy of DemoSignIn
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DemoSignInCopyWith<_DemoSignIn> get copyWith => __$DemoSignInCopyWithImpl<_DemoSignIn>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DemoSignIn&&(identical(other.email, email) || other.email == email));
}


@override
int get hashCode {
    return Object.hash(runtimeType,email);
}

@override
String toString() {
    return 'DemoSignIn(email: $email)';
}


}

/// @nodoc
abstract mixin class _$DemoSignInCopyWith<$Res> implements $DemoSignInCopyWith<$Res> {
  factory _$DemoSignInCopyWith(_DemoSignIn value, $Res Function(_DemoSignIn) _then) = __$DemoSignInCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$DemoSignInCopyWithImpl<$Res>
    implements _$DemoSignInCopyWith<$Res> {
  __$DemoSignInCopyWithImpl(this._self, this._then);

  final _DemoSignIn _self;
  final $Res Function(_DemoSignIn) _then;

/// Create a copy of DemoSignIn
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_DemoSignIn(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
