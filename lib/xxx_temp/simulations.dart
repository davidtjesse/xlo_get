class Simulations {

  /*
  * simulate the delay of the conection of internet and return the
  * value of the parameter returnResult (true or false)
  * */

  Future<bool> simulateConnectionDelay(bool returnResult) async {
    await Future.delayed(Duration(seconds: 3));
    return returnResult;
  }
}
