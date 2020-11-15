class IndexResponse {
  String ind;
  IndexResponse({this.ind});
}

class APIResponse<T> {
  T data;
  bool error;
  String errormsg;
  APIResponse({this.data, this.error = false, this.errormsg = 'No Error'});
}
