enum ApiCollectionEnum {
  userCollection(ApiCollectionConstanst.USER_COLLECTION),
  carrierOrdersCollection(ApiCollectionConstanst.CARRIER_ORDERS_COLLECTION),
  senderOrdersCollection(ApiCollectionConstanst.SENDER_ORDERS_COLLECTION),
  adsImagesCollection(ApiCollectionConstanst.ADS_IMAGES_COLLECTION);

  final String collectionName;
  const ApiCollectionEnum(this.collectionName);
}

class ApiCollectionConstanst {
  static const USER_COLLECTION = "Users";
  static const SENDER_ORDERS_COLLECTION = "SenderOrders";
  static const CARRIER_ORDERS_COLLECTION = "CarrierOrders";
  static const ADS_IMAGES_COLLECTION = "AdsImages";
}
