import 'package:dio/dio.dart';
import 'package:xlo_get/models/address.dart';

enum cepApiErrCode { ERR_INVALID_CEP, ERR_CONNECTION_FAIL }

Future<Map<String, dynamic>> getAddressFromAPI(String postalCode) async {
  Map<String, dynamic> result = {};

  final String endpoint =
      'http://viacep.com.br/ws/${postalCode.replaceAll('.', '').replaceAll('_', '')}/json';

  try {
    Response response = await Dio().get<Map>(endpoint);

    if (response.data.containsKey('erro')) {
      result['err'] = cepApiErrCode.ERR_INVALID_CEP;
      return result;
    }

    final Address address = Address(
      place: response.data['logradouro'],
      district: response.data['bairro'],
      city: response.data['localidade'],
      postalCode: response.data['cep'],
      federativeUnit: response.data['uf'],
    );

    result['address'] = address;
    return result;
  } on DioError catch (_) {
    result['err'] = cepApiErrCode.ERR_CONNECTION_FAIL;
    return result;
  }
}
