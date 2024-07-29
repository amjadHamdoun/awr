
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../screens/customerCars/model/customer_cars_model.dart';

class AppConstants{

  static const String login = "api/login";
  static const String customersCars = "api/customers";
  static const String socketSendLocationEvent= "send_location";



}


class StyleConstants{

  static const double fontSize = 16.0;
  static const double iconSize = 24.0;

}

class TestConstants{
  static  CustomerCarsModel customerCarsModel=CustomerCarsModel(
    customerCars: [
      CustomerCarsList(id:0,image: 'assets/images/nissan_patrol.jpg',dateTime: DateTime.now(),lat:25.276987,long: 55.296249 ,remark: 'Dubai ,Nissan Car',customerName: 'John',details: '',locationName: 'Dubai , Deira'),
      CustomerCarsList(id:1,image: 'assets/images/nissan_patrol.jpg',dateTime: DateTime.now(),lat:25.357119,long: 55.391068 ,remark: 'Sharjah ,Nissan Car',customerName: 'Reymond',details: '',locationName: 'Sharjah , Rola'),
      CustomerCarsList(id:2,image: 'assets/images/nissan_patrol.jpg',dateTime: DateTime.now(),lat:25.41111,long: 55.43504 ,remark: 'Ajman ,Nissan Car',customerName: 'Ilias',locationName: 'Ajman , Ind'),

    ]
  );

}


