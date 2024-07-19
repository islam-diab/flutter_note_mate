class ResultApi<T> {
  final T value;
  final bool isError;

  ResultApi({required this.value, required this.isError});
}
