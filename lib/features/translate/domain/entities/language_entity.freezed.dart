// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'language_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LanguageEntity {

 String get id; String get english; String get vietnamese; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of LanguageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageEntityCopyWith<LanguageEntity> get copyWith => _$LanguageEntityCopyWithImpl<LanguageEntity>(this as LanguageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.english, english) || other.english == english)&&(identical(other.vietnamese, vietnamese) || other.vietnamese == vietnamese)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,english,vietnamese,createdAt,updatedAt);

@override
String toString() {
  return 'LanguageEntity(id: $id, english: $english, vietnamese: $vietnamese, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $LanguageEntityCopyWith<$Res>  {
  factory $LanguageEntityCopyWith(LanguageEntity value, $Res Function(LanguageEntity) _then) = _$LanguageEntityCopyWithImpl;
@useResult
$Res call({
 String id, String english, String vietnamese, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$LanguageEntityCopyWithImpl<$Res>
    implements $LanguageEntityCopyWith<$Res> {
  _$LanguageEntityCopyWithImpl(this._self, this._then);

  final LanguageEntity _self;
  final $Res Function(LanguageEntity) _then;

/// Create a copy of LanguageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? english = null,Object? vietnamese = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,english: null == english ? _self.english : english // ignore: cast_nullable_to_non_nullable
as String,vietnamese: null == vietnamese ? _self.vietnamese : vietnamese // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LanguageEntity].
extension LanguageEntityPatterns on LanguageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LanguageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LanguageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LanguageEntity value)  $default,){
final _that = this;
switch (_that) {
case _LanguageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LanguageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LanguageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String english,  String vietnamese,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LanguageEntity() when $default != null:
return $default(_that.id,_that.english,_that.vietnamese,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String english,  String vietnamese,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LanguageEntity():
return $default(_that.id,_that.english,_that.vietnamese,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String english,  String vietnamese,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LanguageEntity() when $default != null:
return $default(_that.id,_that.english,_that.vietnamese,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _LanguageEntity extends LanguageEntity {
  const _LanguageEntity({required this.id, required this.english, required this.vietnamese, this.createdAt, this.updatedAt}): super._();
  

@override final  String id;
@override final  String english;
@override final  String vietnamese;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of LanguageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LanguageEntityCopyWith<_LanguageEntity> get copyWith => __$LanguageEntityCopyWithImpl<_LanguageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LanguageEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.english, english) || other.english == english)&&(identical(other.vietnamese, vietnamese) || other.vietnamese == vietnamese)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,english,vietnamese,createdAt,updatedAt);

@override
String toString() {
  return 'LanguageEntity(id: $id, english: $english, vietnamese: $vietnamese, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LanguageEntityCopyWith<$Res> implements $LanguageEntityCopyWith<$Res> {
  factory _$LanguageEntityCopyWith(_LanguageEntity value, $Res Function(_LanguageEntity) _then) = __$LanguageEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String english, String vietnamese, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$LanguageEntityCopyWithImpl<$Res>
    implements _$LanguageEntityCopyWith<$Res> {
  __$LanguageEntityCopyWithImpl(this._self, this._then);

  final _LanguageEntity _self;
  final $Res Function(_LanguageEntity) _then;

/// Create a copy of LanguageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? english = null,Object? vietnamese = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_LanguageEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,english: null == english ? _self.english : english // ignore: cast_nullable_to_non_nullable
as String,vietnamese: null == vietnamese ? _self.vietnamese : vietnamese // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
