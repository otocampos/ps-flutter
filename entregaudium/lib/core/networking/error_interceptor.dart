import 'package:dio/dio.dart';
import 'package:entregaudium/core/models/Failure.dart';
import 'package:entregaudium/core/widgets/custom_toast.dart';
import 'package:entregaudium/core/widgets/custom_toast_msg_impl.dart';
import 'package:get_it/get_it.dart';

import 'error_handler.dart';

class ErrorInterceptor extends Interceptor {
final _toastMessage =GetIt.instance<CustomToastMessageImpl>();
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      Failure failhttp = ErrorHandler.handle(err).failure;
      print('Erro HTTP ${failhttp.message}');
      _toastMessage.showCustomFailureToast(failhttp);
    } else {
      Failure failNetwork = DataSource.NO_INTERNET_CONNECTION.getFailure();
      _toastMessage.showCustomFailureToast(failNetwork);
      print('Erro de rede: ${failNetwork.message}');
    }

    handler.next(err);
  }
}