import 'package:xlo_get/models/address.dart';

String getLocationString(Address address) {
  return '${address.place}${address.place != '' ? ',' : ''} ${address.district}${address.district != '' ? '\n' : ''}${address.city} - ${address.federativeUnit},\nCEP: ${address.postalCode}';
}
