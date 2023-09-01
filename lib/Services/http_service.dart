import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:exercise_assignment/Constants/constants.dart';
import 'package:exercise_assignment/Constants/Utils/app_urls.dart';
import 'package:exercise_assignment/Constants/Utils/utils.dart';
import 'package:exercise_assignment/Values/values.dart';


class HttpService {
  late Dio _dio;

  HttpService(){
    init();
  }

// http get request
  Future getRequest(String url) async{
    // _dio.options.headers['content-Type'] = 'application/json';
    //currently sating static becuase it wan't be changed
    Map<String,dynamic> rapidKey = {
      "X-RapidAPI-Key":"907c40328fmsh6a90376a4292aefp1f8b38jsnaf18d86a3c57",
      "X-RapidAPI-Host":"exercisedb.p.rapidapi.com",
    };
    _dio.options.headers.addAll(rapidKey);
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("url " + url);
      response = await _dio.get(url).catchError((e) => throw Exception(e));
      Debug.setLog("response.get ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http post request
  Future postRequest(String url,{rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("url ${url}");
      Debug.setLog("rowData ${rowData}");
      response = await _dio.post(url,data: rowData).catchError((e) => throw Exception(e));
      Debug.setLog("response.post ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }
// http post request
  Future uploadMediaRequest(String imagePath) async{
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(imagePath,),
    });

    _dio.options.headers['content-Type'] ="multipart/form-data";
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      // response = await _dio.post(AppUrls.upload_media_url,data: data);
      // Debug.setLog("response.uploadMedia ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    // return response;
  }
// http post request
  Future patchRequest(String url,{rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("rowData.patch ${jsonEncode(rowData)}" );
      Debug.setLog("url " + url);
      response = await _dio.patch(url,data: rowData);
      Debug.setLog("response.patch ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http post request
  Future putRequest(String url,{rowData = const {}}) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("rowData.put ${jsonEncode(rowData)}" );
      Debug.setLog("url " + url);
      response = await _dio.put(url,data: rowData);
      Debug.setLog("response.put ${response.data}");
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http delete request
  Future deleteRequest(String url) async{
    _dio.options.headers['content-Type'] = 'application/json';
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}" );
      Debug.setLog("url " + url);
      response = await _dio.delete(url);
      Debug.setLog(response.toString());
    } catch (e) {
      Debug.setErrorLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        handler.next(options);
      },
      onResponse: (e, handler) {
        handler.next(e);
      },
      onError: (e, handler) async {
        Debug.setErrorLog("statusCode ${e.response?.statusCode.toString()}");
        Debug.setErrorLog("error ${e.response?.data.toString()}");
        switch (e.response?.statusCode) {
          case 400: //Bad Request
            String msg = e.response?.data['message'];
            Utils.showWarningToast(value: msg.isNotEmpty ? msg : MyString.somethingWrong);
            break;
          case 401: //UnAuthorized User

          case 404: // Not Found
            String msg = e.response?.data['message'];
            Utils.showWarningToast(value: msg.isNotEmpty ? msg :  MyString.somethingWrong);
            break;
          case 500: //Internal Server Error
            String msg = e.response?.data['message'];
            Utils.showWarningToast(value: msg.isNotEmpty ? msg :  MyString.somethingWrong);
            break;
          case 501: //Internal Server Error
            String msg = e.response?.data['message'];
            Utils.showWarningToast(value: msg.isNotEmpty ? msg :  MyString.somethingWrong);
            break;

          default:
            Utils.showWarningToast(value: MyString.somethingWrong);
            break;
        }
        handler.next(e);
      },
    ));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: AppUrls.baseUrl,
        followRedirects: false,
        connectTimeout: const Duration(seconds: 120), // 120 seconds
        receiveTimeout: const Duration(seconds: 120),
    ));
    initializeInterceptors();
  }
}