// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final int page;
  @override
  final bool isTripOpened;
  @override
  final double? lat;
  @override
  final double? long;
  @override
  final CustomerCarsList? currentTrip;
  @override
  final String error;
  @override
  final String message;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates))._build();

  _$HomeState._(
      {required this.page,
      required this.isTripOpened,
      this.lat,
      this.long,
      this.currentTrip,
      required this.error,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(page, r'HomeState', 'page');
    BuiltValueNullFieldError.checkNotNull(
        isTripOpened, r'HomeState', 'isTripOpened');
    BuiltValueNullFieldError.checkNotNull(error, r'HomeState', 'error');
    BuiltValueNullFieldError.checkNotNull(message, r'HomeState', 'message');
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        page == other.page &&
        isTripOpened == other.isTripOpened &&
        lat == other.lat &&
        long == other.long &&
        currentTrip == other.currentTrip &&
        error == other.error &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, isTripOpened.hashCode);
    _$hash = $jc(_$hash, lat.hashCode);
    _$hash = $jc(_$hash, long.hashCode);
    _$hash = $jc(_$hash, currentTrip.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'HomeState')
          ..add('page', page)
          ..add('isTripOpened', isTripOpened)
          ..add('lat', lat)
          ..add('long', long)
          ..add('currentTrip', currentTrip)
          ..add('error', error)
          ..add('message', message))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  bool? _isTripOpened;
  bool? get isTripOpened => _$this._isTripOpened;
  set isTripOpened(bool? isTripOpened) => _$this._isTripOpened = isTripOpened;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _long;
  double? get long => _$this._long;
  set long(double? long) => _$this._long = long;

  CustomerCarsList? _currentTrip;
  CustomerCarsList? get currentTrip => _$this._currentTrip;
  set currentTrip(CustomerCarsList? currentTrip) =>
      _$this._currentTrip = currentTrip;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _isTripOpened = $v.isTripOpened;
      _lat = $v.lat;
      _long = $v.long;
      _currentTrip = $v.currentTrip;
      _error = $v.error;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  HomeState build() => _build();

  _$HomeState _build() {
    final _$result = _$v ??
        new _$HomeState._(
            page: BuiltValueNullFieldError.checkNotNull(
                page, r'HomeState', 'page'),
            isTripOpened: BuiltValueNullFieldError.checkNotNull(
                isTripOpened, r'HomeState', 'isTripOpened'),
            lat: lat,
            long: long,
            currentTrip: currentTrip,
            error: BuiltValueNullFieldError.checkNotNull(
                error, r'HomeState', 'error'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'HomeState', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
