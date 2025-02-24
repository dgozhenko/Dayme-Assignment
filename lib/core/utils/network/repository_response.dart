class RepositoryResponse<DATA, ERROR extends Exception> {
  DATA? data;
  ERROR? error;

  RepositoryResponse._({required this.data, this.error});

  factory RepositoryResponse.success({DATA? data}) {
    return RepositoryResponse._(data: data);
  }

  factory RepositoryResponse.error({required ERROR error}) {
    return RepositoryResponse._(data: null as DATA, error: error);
  }

  factory RepositoryResponse.unknownError() {
    return RepositoryResponse._(
        data: null as DATA, error: Exception(['Unknown error.']) as ERROR);
  }
}
