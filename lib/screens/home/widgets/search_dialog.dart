import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchDialog {
  final TextEditingController _controller = TextEditingController();

  void openSearchDialog(String currentSearch, Function callBack) {
    _controller.text = currentSearch;
     Get.dialog(Stack(
      children: <Widget>[
        Positioned(
          top: 2,
          left: 2,
          right: 2,
          child: Card(
            child: TextField(
              controller: _controller,
              textInputAction: TextInputAction.search,
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                prefixIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.grey[700],
                  onPressed: () {
                    Get.back();
                  },
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.close),
                  color: Colors.grey[700],
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
              onSubmitted: (text) {
                Get.back();
                callBack(text);
              },
            ),
          ),
        ),
      ],
    ));
  }
}
