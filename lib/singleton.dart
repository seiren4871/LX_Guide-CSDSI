class StoreData {
  static final StoreData _appData = new StoreData._internal();

  String emailOrIdFromGuest;
  String studentIdOrName;

  factory StoreData() {
    return _appData;
  }  StoreData._internal();

}
final appData = StoreData();