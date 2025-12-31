import 'package:dio/dio.dart';
import 'package:hm_shop/contants/index.dart';

class DioRequest {
  final _dio = Dio();
  DioRequest() {
    _dio.options.baseUrl = GlobalConstants.BASE_URL;
    _dio.options.connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    // 连接超时
    _dio.options.sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    // 发送超时
    _dio.options.receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    // 响应超时
    _addInterceptor();
  }
  // 添加拦截器
  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (req, handler) {
          handler.next(req);
        },
        onResponse: (res, handler) {
          if (res.statusCode! >= 200 && res.statusCode! < 300) {
            handler.next(res);
            return;
          }
          handler.reject(DioException(requestOptions: res.requestOptions));
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  // 封装get 请求
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  // 将所有的data数据进行解构，拿到真正的数据 进一步处理返回结果结构函数
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      final Response<dynamic> res = await task;
      final data = res.data;

      if (data is Map<String, dynamic>) {
        if (data["code"] == GlobalConstants.SUCCESS_CODE) {
          // 放行
          return data["result"];
        }
        throw Exception(data["msg"] ?? "加载异常");
      }

      // 一些接口可能直接返回List/其他结构，直接透传
      return data;
    } catch (_) {
      rethrow;
    }
  }
}

final dioRequest = DioRequest();
