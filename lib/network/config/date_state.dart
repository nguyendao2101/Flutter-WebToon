// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataState<T> {
  T data;
  DataState({
    required this.data,
  });
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({required super.data});
}

class DataFailed<T> extends DataState<T> {
  DataFailed({required super.data});
}
