/*Singleton para garantir garantir única instância das funções de
* controle da página de base */

class BaseScreenPageController {
  static BaseScreenPageController _instance;

  factory BaseScreenPageController({Function setPage, Function getPage}) {
    _instance ??=
        BaseScreenPageController._internalConstructor(setPage, getPage);
    return _instance;
  }
  BaseScreenPageController._internalConstructor(this.setPage, this.getPage);
  Function setPage;
  Function getPage;
}
