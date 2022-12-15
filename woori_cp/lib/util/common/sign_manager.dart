class SignManager {
  Future<bool> signInKakao() async {
    final resp = Future.delayed(Duration(seconds: 3)).then((value) => true);

    return resp;
  }

  Future<bool> signInGoogle() async {
    final resp = Future.delayed(Duration(seconds: 3)).then((value) => false);

    return resp;
  }

  Future<bool> signInApple() async {
    final resp = Future.delayed(Duration(seconds: 3)).then((value) => false);

    return resp;
  }
}
