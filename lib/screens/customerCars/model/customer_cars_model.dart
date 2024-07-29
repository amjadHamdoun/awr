

class CustomerCarsModel {
  List<CustomerCarsList>? customerCars;

  CustomerCarsModel({ this.customerCars});

  CustomerCarsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      customerCars = <CustomerCarsList>[];
      json['data'].forEach((v) {
        customerCars!.add( CustomerCarsList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (customerCars != null) {
      data['customerCars'] =
          customerCars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerCarsList {
  int? id;
  String? customerName;
  DateTime? dateTime;
  double? lat;
  double? long;
  String? locationName;
  String? remark;
  String? image;
  String? details;


  CustomerCarsList(
      { this.id,
        this.customerName,
        this.dateTime,
        this.lat,
        this.long,
        this.image,
        this.remark,
        this.details,
        this.locationName
      });

  CustomerCarsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customerName'];
    dateTime = json['dateTime'];
    lat = json['lat'];
    long = json['long'];
    image = json['image'];
    remark = json['remark'];
    details = json['details'];
    locationName = json['locationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateTime'] = dateTime;
    data['lat'] = lat;
    data['long'] = long;
    data['image'] = image;
    data['remark'] = remark;
    data['details'] = details;
    data['locationName'] = locationName;


    return data;
  }
}
