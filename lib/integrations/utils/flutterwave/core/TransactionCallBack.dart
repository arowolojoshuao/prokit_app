abstract class TransactionCallBack {
  onTransactionSuccess(String id, String txRef);

  onTransactionError();

  onCancelled();
}
