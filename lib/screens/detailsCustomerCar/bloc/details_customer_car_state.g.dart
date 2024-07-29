// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_customer_car_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DetailsCustomerCarState extends DetailsCustomerCarState {
  @override
  final bool tripIsOpened;
  @override
  final int tripId;

  factory _$DetailsCustomerCarState(
          [void Function(DetailsCustomerCarStateBuilder)? updates]) =>
      (new DetailsCustomerCarStateBuilder()..update(updates))._build();

  _$DetailsCustomerCarState._(
      {required this.tripIsOpened, required this.tripId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        tripIsOpened, r'DetailsCustomerCarState', 'tripIsOpened');
    BuiltValueNullFieldError.checkNotNull(
        tripId, r'DetailsCustomerCarState', 'tripId');
  }

  @override
  DetailsCustomerCarState rebuild(
          void Function(DetailsCustomerCarStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailsCustomerCarStateBuilder toBuilder() =>
      new DetailsCustomerCarStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailsCustomerCarState &&
        tripIsOpened == other.tripIsOpened &&
        tripId == other.tripId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, tripIsOpened.hashCode);
    _$hash = $jc(_$hash, tripId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DetailsCustomerCarState')
          ..add('tripIsOpened', tripIsOpened)
          ..add('tripId', tripId))
        .toString();
  }
}

class DetailsCustomerCarStateBuilder
    implements
        Builder<DetailsCustomerCarState, DetailsCustomerCarStateBuilder> {
  _$DetailsCustomerCarState? _$v;

  bool? _tripIsOpened;
  bool? get tripIsOpened => _$this._tripIsOpened;
  set tripIsOpened(bool? tripIsOpened) => _$this._tripIsOpened = tripIsOpened;

  int? _tripId;
  int? get tripId => _$this._tripId;
  set tripId(int? tripId) => _$this._tripId = tripId;

  DetailsCustomerCarStateBuilder();

  DetailsCustomerCarStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tripIsOpened = $v.tripIsOpened;
      _tripId = $v.tripId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DetailsCustomerCarState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DetailsCustomerCarState;
  }

  @override
  void update(void Function(DetailsCustomerCarStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DetailsCustomerCarState build() => _build();

  _$DetailsCustomerCarState _build() {
    final _$result = _$v ??
        new _$DetailsCustomerCarState._(
            tripIsOpened: BuiltValueNullFieldError.checkNotNull(
                tripIsOpened, r'DetailsCustomerCarState', 'tripIsOpened'),
            tripId: BuiltValueNullFieldError.checkNotNull(
                tripId, r'DetailsCustomerCarState', 'tripId'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
