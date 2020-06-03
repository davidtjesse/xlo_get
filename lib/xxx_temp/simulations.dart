class Simulations {

  /*
  * simulate de delay of the conexão of internet and return the
  * value of the parameter returnResult (true or false)
  * */

  Future<bool> simulateConnectionDelay(bool returnResult) async {
    await Future.delayed(Duration(seconds: 3));
    return returnResult;
  }
}
