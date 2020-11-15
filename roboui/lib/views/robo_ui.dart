import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:roboui/models/robo_b_response.dart';
import 'package:http/http.dart' as http;

class RoboHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ROBO FRAME HOME'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => GetResponse()));
        },
        child: Icon(Icons.gesture),
      ),
      body: Container(),
    );
  }
}

class GetResponse extends StatefulWidget {
  @override
  _GetResponseState createState() => _GetResponseState();
}

class _GetResponseState extends State<GetResponse> {
  RoboFramServices get service => GetIt.I<RoboFramServices>();
  APIResponse<IndexResponse> _indexdata;
  bool _isloading = false;

  @override
  void initState() {
    _fetchindex();
    super.initState();
  }

  _fetchindex() async {
    // print("Test");
    // setState(() {
    //   _isloading = true;
    // });
    _indexdata = APIResponse(
        data: IndexResponse(ind: 'mew')); // await service.getresponseindex();

    // setState(() {
    //   _isloading = false;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ROBO FRAME Index response'),
        ),
        body: _isloading
            ? CircularProgressIndicator()
            : Container(
                child: Text(
                  _indexdata.data.ind,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.topCenter,
              ));
  }
}

class RoboFramServices {
  Future<APIResponse<IndexResponse>> getresponseindex() {
    print("in response");
    return http.get('http://127.0.0.1:8010/rb/').then((data) {
      final jsondata = json.decode(data.body);
      final resp = IndexResponse(ind: jsondata['ind']);
      return APIResponse<IndexResponse>(data: resp);
    });
  }
}
