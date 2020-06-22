import 'package:flutter/material.dart';
import 'package:xlo_get/controllers/base_screen_page_controller.dart';
import 'package:xlo_get/screens/account/account_screen.dart';
import 'package:xlo_get/screens/create/create_screen.dart';
import 'package:xlo_get/screens/home/home_screen.dart';
import 'package:xlo_get/xxx_temp/tempory_empty_pages.dart';

class BaseScreenDataStorage {
  /*Armazena valores para a BaseScreen*/
  int _currentPage = 0;
}

class BaseScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    int _currentPage = BaseScreenDataStorage()._currentPage;
    void setPage(int page) {
      if (_currentPage != page) {
        _pageController.animateToPage(page,
            duration: Duration(seconds: 1), curve: Curves.ease);
        _currentPage = page;
      }
    }

    int getPage() {
      return _currentPage;
    }

    var baseScreenPageController = BaseScreenPageController();
    baseScreenPageController.setPage = setPage;
    baseScreenPageController.getPage = getPage;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(),
          CreateScreen(),
          TemporaryPage(3),
          TemporaryPage(4),
          AccountScreen(),
        ],
      ),
    );
  }
}
