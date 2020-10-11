import 'package:app_zipcode/app/model/address_model.dart';
import 'package:dio/dio.dart';

class AddressRepository {
  Future<List<AddressModel>> searchAddress() async {
    var dio = Dio();
    try {
      Response response = await dio
          .get('https://viacep.com.br/ws/SP/S%C3%A3o%20Paulo/Paulista/json/');
      return response.data
          .map<AddressModel>((address) => AddressModel.fromMap(address))
          .toList();
    } catch (error) {}
  }
}
