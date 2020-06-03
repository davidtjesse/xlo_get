/* chamada a partir do home/widgets/top_bar.dart */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xlo_get/models/filter.dart';
import 'package:xlo_get/screens/filter/widgets/animated_button.dart';
import 'package:xlo_get/screens/filter/widgets/order_by_field.dart';
import 'package:xlo_get/screens/filter/widgets/price_range_field.dart';
import 'package:xlo_get/screens/filter/widgets/section_title.dart';
import 'package:xlo_get/screens/filter/widgets/vendor_type_field.dart';
import 'package:xlo_get/xxx_temp/stopped_at.dart';

class FilterScreenStl extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Filter _filter = Filter(
        /*
      maxPrice: 100,
      minPrice: 25,
      vendorType: VENDOR_TYPE_PARTICULAR,
      orderBy: OrderBy.PRICE
      */
        );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Filtrar Busca com Get'),
      ),
      body: Stack(
        children: <Widget>[
          Form(
            key: _formKey,
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                const SectionTitle(title: 'Ordenar por'),
                OrderByField(
                  initialValue: _filter.orderBy,
                  onSaved: (v) {
                    //    _filter.orderBy = v;
                  },
                ),
                const SectionTitle(title: 'Preço(R\$)'),
                PriceRangeField(filter: _filter),
                const SectionTitle(title: 'Tipo de anunciante'),
                VendorTypeField(
                  initialValue: _filter.vendorType,
                  onSaved: (v) {
                    _filter.vendorType = v;
                  },
                ),

                /*Sizebox para aumentar o espaço ocupado na tela - REMOVER*/
                const SizedBox(height: 100),
              ],
            ),
          ),
          AnimatedButton(
            scrollController: _scrollController,
            onTap: () {
              /* salva o estado do _formKey */
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }

              if (_filter.minPrice > _filter.maxPrice) {
                Get.snackbar(
                  'Erro',
                  'Faixa de preço inválida',
                  colorText: Colors.white,
                  backgroundColor: Colors.pink,
                );
                return;
              }
              StoppedAt().notImplementedMsg();
              // Salvar e buscar anuncios
            },
          ),
        ],
      ),
    );
  }
}
