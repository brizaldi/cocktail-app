/*
 * cocktail_app
 * network_status
 * Created by Bahri Rizaldi on 04/06/2020 6:37
 *
 */

import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkStatus {
  Future<bool> get isConnected;
}

class NetworkStatusImpl implements NetworkStatus {
  final DataConnectionChecker connectionChecker;

  NetworkStatusImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}