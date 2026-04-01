import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  //! get method
  Future<dynamic> getApiData({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        'there was a problem with status code ${response.statusCode}',
      );
    }
  }

  //! post method
  Future<dynamic> postApiData({
    required String url,
    dynamic bodyOfPost,
    String? token,
  }) async {
    // 1. تأمين: لو الـبودى  فاضي وإحنا محتاجينه، نطلع ايرور  واضح
    if (bodyOfPost == null) {
      throw Exception('البيانات (body) مطلوبة، مينفعش تبعت طلب فاضي!');
    }

    Map<String, String> mapHeaders = {};

    // 2. تظبيط الـ Headers عشان السيرفر يفهم نوع البيانات
    // أغلب الـ APIs بتحتاج تعرف إنك باعت JSON
    mapHeaders.addAll({'Content-Type': 'application/json'});

    if (token != null) {
      mapHeaders.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(bodyOfPost),
        headers: mapHeaders,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        // لو السيرفر رد بكود غلط (زي 400 أو 500)
        throw Exception(
          'حصلت مشكلة في السيرفر، الكود: ${response.statusCode} والرد: ${response.body}',
        );
      }
    } catch (e) {
      // لو مفيش نت أو الـ URL غلط خالص
      throw Exception('فشل الاتصال بالإنترنت: $e');
    }
  }

  //! put method
  Future<dynamic> putApiData({
    required String url,
    dynamic bodyOfPost,
    String? token,
  }) async {
    // 1. تأمين: لو الـبودى  فاضي وإحنا محتاجينه، نطلع ايرور  واضح
    if (bodyOfPost == null) {
      throw Exception('البيانات (body) مطلوبة، مينفعش تعدل طلب فاضي!');
    }

    Map<String, String> mapHeaders = {};

    // 2. تظبيط الـ Headers عشان السيرفر يفهم نوع البيانات
    // أغلب الـ APIs بتحتاج تعرف إنك باعت JSON
    mapHeaders.addAll({'Content-Type': 'application/json'});

    if (token != null) {
      mapHeaders.addAll({'Authorization': 'Bearer $token'});
    }

    try {
      http.Response response = await http.put(
        Uri.parse(url),
        body: jsonEncode(bodyOfPost),
        headers: mapHeaders,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        // لو السيرفر رد بكود غلط (زي 400 أو 500)
        throw Exception(
          'حصلت مشكلة في السيرفر، الكود: ${response.statusCode} والرد: ${response.body}',
        );
      }
    } catch (e) {
      // لو مفيش نت أو الـ URL غلط خالص
      throw Exception('فشل الاتصال بالإنترنت: $e');
    }
  }

  //! delete method
  Future<dynamic> deleteApiData({required String url, String? token}) async {
    Map<String, String> mapHeaders = {};

    if (token != null) {
      mapHeaders.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.delete(
      Uri.parse(url),
      headers: mapHeaders,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // ساعات السيرفر بيرجع الحاجة اللي اتسحت
    } else {
      throw Exception('فشل الحذف، الكود: ${response.statusCode}');
    }
  }
}
