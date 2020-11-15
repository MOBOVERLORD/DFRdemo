import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:roboui/models/robo_b_response.dart';
import 'package:roboui/services/get_request.dart';

class RoboHome extends StatefulWidget {
  @override
  _RoboHomeState createState() => _RoboHomeState();
}

class _RoboHomeState extends State<RoboHome> {
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
  RoboFrameServices get service => GetIt.I<RoboFrameServices>();
  APIResponse<IndexResponse> _indexdata;
  bool _isloading = false;

  @override
  void initState() {
    _fetchindex();
    super.initState();
  }

  _fetchindex() async {
    setState(() {
      _isloading = true;
    });
    _indexdata = await service.getresponseindex();
    setState(() {
      _isloading = false;
    });
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
