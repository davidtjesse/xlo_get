import 'package:dio/dio.dart';
import 'package:xlo_get/models/address.dart';

Future<Map<String, dynamic>> getAddressFromAPI(String postalCode) async {
  Map<String, dynamic> result = {};

  final String endpoint =
      'http://viacep.com.br/ws/${postalCode.replaceAll('.', '').replaceAll('_', '')}/json';

  try {
    Response response = await Dio().get<Map>(endpoint);

    if (response.data.containsKey('erro')) {
      result['msg'] = 'CEP Inválido';
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
    result['msg'] = 'Falha de conexão com o VIA CEP';
    return result;
  }
}
