import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionChecker {
  final InternetConnectionChecker interNet;
  ConnectionChecker(this.interNet);
  Future<bool> isConnected() async {
    return await interNet.hasConnection;
  }
}
