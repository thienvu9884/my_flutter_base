// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'languages_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LanguagesEvent {

 String get category;
/// Create a copy of LanguagesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguagesEventCopyWith<LanguagesEvent> get copyWith => _$LanguagesEventCopyWithImpl<LanguagesEvent>(this as LanguagesEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguagesEvent&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'LanguagesEvent(category: $category)';
}


}

/// @nodoc
abstract mixin class $LanguagesEventCopyWith<$Res>  {
  factory $LanguagesEventCopyWith(LanguagesEvent value, $Res Function(LanguagesEvent) _then) = _$LanguagesEventCopyWithImpl;
@useResult
$Res call({
 String category
});




}
/// @nodoc
class _$LanguagesEventCopyWithImpl<$Res>
    implements $LanguagesEventCopyWith<$Res> {
  _$LanguagesEventCopyWithImpl(this._self, this._then);

  final LanguagesEvent _self;
  final $Res Function(LanguagesEvent) _then;

/// Create a copy of LanguagesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LanguagesEvent].
extension LanguagesEventPatterns on LanguagesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetLanguagesEvent value)?  getLanguages,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetLanguagesEvent() when getLanguages != null:
return getLanguages(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetLanguagesEvent value)  getLanguages,}){
final _that = this;
switch (_that) {
case _GetLanguagesEvent():
return getLanguages(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetLanguagesEvent value)?  getLanguages,}){
final _that = this;
switch (_that) {
case _GetLanguagesEvent() when getLanguages != null:
return getLanguages(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String category)?  getLanguages,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetLanguagesEvent() when getLanguages != null:
return getLanguages(_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String category)  getLanguages,}) {final _that = this;
switch (_that) {
case _GetLanguagesEvent():
return getLanguages(_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String category)?  getLanguages,}) {final _that = this;
switch (_that) {
case _GetLanguagesEvent() when getLanguages != null:
return getLanguages(_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _GetLanguagesEvent extends LanguagesEvent {
  const _GetLanguagesEvent({required this.category}): super._();
  

@override final  String category;

/// Create a copy of LanguagesEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetLanguagesEventCopyWith<_GetLanguagesEvent> get copyWith => __$GetLanguagesEventCopyWithImpl<_GetLanguagesEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetLanguagesEvent&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,category);

@override
String toString() {
  return 'LanguagesEvent.getLanguages(category: $category)';
}


}

/// @nodoc
abstract mixin class _$GetLanguagesEventCopyWith<$Res> implements $LanguagesEventCopyWith<$Res> {
  factory _$GetLanguagesEventCopyWith(_GetLanguagesEvent value, $Res Function(_GetLanguagesEvent) _then) = __$GetLanguagesEventCopyWithImpl;
@override @useResult
$Res call({
 String category
});




}
/// @nodoc
class __$GetLanguagesEventCopyWithImpl<$Res>
    implements _$GetLanguagesEventCopyWith<$Res> {
  __$GetLanguagesEventCopyWithImpl(this._self, this._then);

  final _GetLanguagesEvent _self;
  final $Res Function(_GetLanguagesEvent) _then;

/// Create a copy of LanguagesEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,}) {
  return _then(_GetLanguagesEvent(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
