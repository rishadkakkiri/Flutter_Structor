class ApiResponce<T> {
  T data;
  bool error;
  int statusCode;
  String errorMessage;
  ApiResponce(
      {this.data,
      this.error = false,
      this.errorMessage,
      this.statusCode = 200});
}
