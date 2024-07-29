// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_cars_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CustomerCarsState extends CustomerCarsState {
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool showMap;
  @override
  final bool showCustomerDetails;
  @override
  final String? error;
  @override
  final CustomerCarsModel? customerCarsModel;
  @override
  final CustomerCarsModel? searchCustomerCarsModel;
  @override
  final Map<MarkerId, Marker> markers;
  @override
  final CustomerCarsList? customerDetails;

  factory _$CustomerCarsState(
          [void Function(CustomerCarsStateBuilder)? updates]) =>
      (new CustomerCarsStateBuilder()..update(updates))._build();

  _$CustomerCarsState._(
      {required this.isLoading,
      required this.isSuccess,
      required this.showMap,
      required this.showCustomerDetails,
      this.error,
      this.customerCarsModel,
      this.searchCustomerCarsModel,
      required this.markers,
      this.customerDetails})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'CustomerCarsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isSuccess, r'CustomerCarsState', 'isSuccess');
    BuiltValueNullFieldError.checkNotNull(
        showMap, r'CustomerCarsState', 'showMap');
    BuiltValueNullFieldError.checkNotNull(
        showCustomerDetails, r'CustomerCarsState', 'showCustomerDetails');
    BuiltValueNullFieldError.checkNotNull(
        markers, r'CustomerCarsState', 'markers');
  }

  @override
  CustomerCarsState rebuild(void Function(CustomerCarsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerCarsStateBuilder toBuilder() =>
      new CustomerCarsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerCarsState &&
        isLoading == other.isLoading &&
        isSuccess == other.isSuccess &&
        showMap == other.showMap &&
        showCustomerDetails == other.showCustomerDetails &&
        error == other.error &&
        customerCarsModel == other.customerCarsModel &&
        searchCustomerCarsModel == other.searchCustomerCarsModel &&
        markers == other.markers &&
        customerDetails == other.customerDetails;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isSuccess.hashCode);
    _$hash = $jc(_$hash, showMap.hashCode);
    _$hash = $jc(_$hash, showCustomerDetails.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, customerCarsModel.hashCode);
    _$hash = $jc(_$hash, searchCustomerCarsModel.hashCode);
    _$hash = $jc(_$hash, markers.hashCode);
    _$hash = $jc(_$hash, customerDetails.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CustomerCarsState')
          ..add('isLoading', isLoading)
          ..add('isSuccess', isSuccess)
          ..add('showMap', showMap)
          ..add('showCustomerDetails', showCustomerDetails)
          ..add('error', error)
          ..add('customerCarsModel', customerCarsModel)
          ..add('searchCustomerCarsModel', searchCustomerCarsModel)
          ..add('markers', markers)
          ..add('customerDetails', customerDetails))
        .toString();
  }
}

class CustomerCarsStateBuilder
    implements Builder<CustomerCarsState, CustomerCarsStateBuilder> {
  _$CustomerCarsState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _showMap;
  bool? get showMap => _$this._showMap;
  set showMap(bool? showMap) => _$this._showMap = showMap;

  bool? _showCustomerDetails;
  bool? get showCustomerDetails => _$this._showCustomerDetails;
  set showCustomerDetails(bool? showCustomerDetails) =>
      _$this._showCustomerDetails = showCustomerDetails;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  CustomerCarsModel? _customerCarsModel;
  CustomerCarsModel? get customerCarsModel => _$this._customerCarsModel;
  set customerCarsModel(CustomerCarsModel? customerCarsModel) =>
      _$this._customerCarsModel = customerCarsModel;

  CustomerCarsModel? _searchCustomerCarsModel;
  CustomerCarsModel? get searchCustomerCarsModel =>
      _$this._searchCustomerCarsModel;
  set searchCustomerCarsModel(CustomerCarsModel? searchCustomerCarsModel) =>
      _$this._searchCustomerCarsModel = searchCustomerCarsModel;

  Map<MarkerId, Marker>? _markers;
  Map<MarkerId, Marker>? get markers => _$this._markers;
  set markers(Map<MarkerId, Marker>? markers) => _$this._markers = markers;

  CustomerCarsList? _customerDetails;
  CustomerCarsList? get customerDetails => _$this._customerDetails;
  set customerDetails(CustomerCarsList? customerDetails) =>
      _$this._customerDetails = customerDetails;

  CustomerCarsStateBuilder();

  CustomerCarsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _isSuccess = $v.isSuccess;
      _showMap = $v.showMap;
      _showCustomerDetails = $v.showCustomerDetails;
      _error = $v.error;
      _customerCarsModel = $v.customerCarsModel;
      _searchCustomerCarsModel = $v.searchCustomerCarsModel;
      _markers = $v.markers;
      _customerDetails = $v.customerDetails;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerCarsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CustomerCarsState;
  }

  @override
  void update(void Function(CustomerCarsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CustomerCarsState build() => _build();

  _$CustomerCarsState _build() {
    final _$result = _$v ??
        new _$CustomerCarsState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'CustomerCarsState', 'isLoading'),
            isSuccess: BuiltValueNullFieldError.checkNotNull(
                isSuccess, r'CustomerCarsState', 'isSuccess'),
            showMap: BuiltValueNullFieldError.checkNotNull(
                showMap, r'CustomerCarsState', 'showMap'),
            showCustomerDetails: BuiltValueNullFieldError.checkNotNull(
                showCustomerDetails,
                r'CustomerCarsState',
                'showCustomerDetails'),
            error: error,
            customerCarsModel: customerCarsModel,
            searchCustomerCarsModel: searchCustomerCarsModel,
            markers: BuiltValueNullFieldError.checkNotNull(
                markers, r'CustomerCarsState', 'markers'),
            customerDetails: customerDetails);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
