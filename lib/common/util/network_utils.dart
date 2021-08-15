import 'dart:async';
import 'package:connectivity/connectivity.dart';

class NetworkUtils {
  final Connectivity _connectivity;

  NetworkUtils(this._connectivity);

  Stream<ConnectivityResult> get connectionUpdates =>
      _connectivity.onConnectivityChanged;

  Future<ConnectivityResult> getConnectivityResult() =>
      _connectivity.checkConnectivity();

  Future<bool> isConnected() async {
    var result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
