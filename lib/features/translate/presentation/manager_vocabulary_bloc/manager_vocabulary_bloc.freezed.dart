// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_vocabulary_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ManagerVocabularyEvent {

 String get en; String get vi;
/// Create a copy of ManagerVocabularyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerVocabularyEventCopyWith<ManagerVocabularyEvent> get copyWith => _$ManagerVocabularyEventCopyWithImpl<ManagerVocabularyEvent>(this as ManagerVocabularyEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerVocabularyEvent&&(identical(other.en, en) || other.en == en)&&(identical(other.vi, vi) || other.vi == vi));
}


@override
int get hashCode => Object.hash(runtimeType,en,vi);

@override
String toString() {
  return 'ManagerVocabularyEvent(en: $en, vi: $vi)';
}


}

/// @nodoc
abstract mixin class $ManagerVocabularyEventCopyWith<$Res>  {
  factory $ManagerVocabularyEventCopyWith(ManagerVocabularyEvent value, $Res Function(ManagerVocabularyEvent) _then) = _$ManagerVocabularyEventCopyWithImpl;
@useResult
$Res call({
 String en, String vi
});




}
/// @nodoc
class _$ManagerVocabularyEventCopyWithImpl<$Res>
    implements $ManagerVocabularyEventCopyWith<$Res> {
  _$ManagerVocabularyEventCopyWithImpl(this._self, this._then);

  final ManagerVocabularyEvent _self;
  final $Res Function(ManagerVocabularyEvent) _then;

/// Create a copy of ManagerVocabularyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? en = null,Object? vi = null,}) {
  return _then(_self.copyWith(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,vi: null == vi ? _self.vi : vi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagerVocabularyEvent].
extension ManagerVocabularyEventPatterns on ManagerVocabularyEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AddVocabulary value)?  addVocabulary,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddVocabulary() when addVocabulary != null:
return addVocabulary(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AddVocabulary value)  addVocabulary,}){
final _that = this;
switch (_that) {
case _AddVocabulary():
return addVocabulary(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AddVocabulary value)?  addVocabulary,}){
final _that = this;
switch (_that) {
case _AddVocabulary() when addVocabulary != null:
return addVocabulary(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String en,  String vi)?  addVocabulary,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddVocabulary() when addVocabulary != null:
return addVocabulary(_that.en,_that.vi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String en,  String vi)  addVocabulary,}) {final _that = this;
switch (_that) {
case _AddVocabulary():
return addVocabulary(_that.en,_that.vi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String en,  String vi)?  addVocabulary,}) {final _that = this;
switch (_that) {
case _AddVocabulary() when addVocabulary != null:
return addVocabulary(_that.en,_that.vi);case _:
  return null;

}
}

}

/// @nodoc


class _AddVocabulary extends ManagerVocabularyEvent {
  const _AddVocabulary({required this.en, required this.vi}): super._();
  

@override final  String en;
@override final  String vi;

/// Create a copy of ManagerVocabularyEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddVocabularyCopyWith<_AddVocabulary> get copyWith => __$AddVocabularyCopyWithImpl<_AddVocabulary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddVocabulary&&(identical(other.en, en) || other.en == en)&&(identical(other.vi, vi) || other.vi == vi));
}


@override
int get hashCode => Object.hash(runtimeType,en,vi);

@override
String toString() {
  return 'ManagerVocabularyEvent.addVocabulary(en: $en, vi: $vi)';
}


}

/// @nodoc
abstract mixin class _$AddVocabularyCopyWith<$Res> implements $ManagerVocabularyEventCopyWith<$Res> {
  factory _$AddVocabularyCopyWith(_AddVocabulary value, $Res Function(_AddVocabulary) _then) = __$AddVocabularyCopyWithImpl;
@override @useResult
$Res call({
 String en, String vi
});




}
/// @nodoc
class __$AddVocabularyCopyWithImpl<$Res>
    implements _$AddVocabularyCopyWith<$Res> {
  __$AddVocabularyCopyWithImpl(this._self, this._then);

  final _AddVocabulary _self;
  final $Res Function(_AddVocabulary) _then;

/// Create a copy of ManagerVocabularyEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? en = null,Object? vi = null,}) {
  return _then(_AddVocabulary(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,vi: null == vi ? _self.vi : vi // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ManagerVocabularyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerVocabularyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManagerVocabularyState()';
}


}

/// @nodoc
class $ManagerVocabularyStateCopyWith<$Res>  {
$ManagerVocabularyStateCopyWith(ManagerVocabularyState _, $Res Function(ManagerVocabularyState) __);
}


/// Adds pattern-matching-related methods to [ManagerVocabularyState].
extension ManagerVocabularyStatePatterns on ManagerVocabularyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Adding value)?  adding,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Adding() when adding != null:
return adding(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Adding value)  adding,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Adding():
return adding(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Adding value)?  adding,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Adding() when adding != null:
return adding(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  adding,TResult Function( LanguageEntity language)?  success,TResult Function( String message)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Adding() when adding != null:
return adding();case _Success() when success != null:
return success(_that.language);case _Failure() when failure != null:
return failure(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  adding,required TResult Function( LanguageEntity language)  success,required TResult Function( String message)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Adding():
return adding();case _Success():
return success(_that.language);case _Failure():
return failure(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  adding,TResult? Function( LanguageEntity language)?  success,TResult? Function( String message)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Adding() when adding != null:
return adding();case _Success() when success != null:
return success(_that.language);case _Failure() when failure != null:
return failure(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends ManagerVocabularyState {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManagerVocabularyState.initial()';
}


}




/// @nodoc


class _Adding extends ManagerVocabularyState {
  const _Adding(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Adding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ManagerVocabularyState.adding()';
}


}




/// @nodoc


class _Success extends ManagerVocabularyState {
  const _Success(this.language): super._();
  

 final  LanguageEntity language;

/// Create a copy of ManagerVocabularyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.language, language) || other.language == language));
}


@override
int get hashCode => Object.hash(runtimeType,language);

@override
String toString() {
  return 'ManagerVocabularyState.success(language: $language)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $ManagerVocabularyStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 LanguageEntity language
});


$LanguageEntityCopyWith<$Res> get language;

}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of ManagerVocabularyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? language = null,}) {
  return _then(_Success(
null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as LanguageEntity,
  ));
}

/// Create a copy of ManagerVocabularyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LanguageEntityCopyWith<$Res> get language {
  
  return $LanguageEntityCopyWith<$Res>(_self.language, (value) {
    return _then(_self.copyWith(language: value));
  });
}
}

/// @nodoc


class _Failure extends ManagerVocabularyState {
  const _Failure(this.message): super._();
  

 final  String message;

/// Create a copy of ManagerVocabularyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ManagerVocabularyState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $ManagerVocabularyStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of ManagerVocabularyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
