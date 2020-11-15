import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:roboui/models/robo_b_response.dart';

class RoboFrameServices {
  static const API = 'http://127.0.0.1:8010/';
  Future<APIResponse<IndexResponse>> getresponseindex() {
    return http.get(API + 'rb/index/?format=json').then((data) {
      final jsondata = json.decode(data.body);
      final resp = IndexResponse(ind: jsondata['ind']);
      return APIResponse<IndexResponse>(data: resp);
    });
  }
}
