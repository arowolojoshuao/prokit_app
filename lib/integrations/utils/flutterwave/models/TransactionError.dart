class TransactionError implements Exception {
  String message;

  TransactionError(this.message);

  @override
  String toString() => this.message;
}
