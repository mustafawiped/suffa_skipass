class ApiEndpoints {
  static const String login = 'login/Authenticate?';
  static const String getProducts =
      'institutionWorkPointCommercialTransactions/KioskProductList?languageParam=';

  static const String payment = "GetPaymentOnMobile/getPaymentOnMobileAdd?";

  static const String myProducts = "GetPaymentOnMobile/GetMyServices?uID=2";

  static const String createQr = "GetPaymentOnMobile/QrCreate?services=";
}

 
 //Kullanici Adi

 //Kişi Adı : SuffaTech //Kişi Soyadı : Yazılım Birimi 
 //userID 2 


//SATIN ALDIGIM HİZMETLER
// api/GetPaymentOnMobile/GetMyServices?uID=2
// LİSTE HALİNDE DÖNÜYOR
//  public int GetPaymentOnMobileID { get; set; }
//  public int UserID { get; set; }
//  public int ProductID { get; set; }
//  public DateTime PaymentDate { get; set; }
//  public int GetPaymentOnMobileTypeID { get; set; }
//  public string GetPaymentOnMobileTypeInfo { get; set; }
//  public Guid TableUniqueValue { get; set; }
//  public bool GetPaymentOnMobileState { get; set; }


//ÖDEME ALMA VE HİZMETLERE YÜKLEME
//api/GetPaymentOnMobile/getPaymentOnMobileAdd?pID=1&uID=2
//true

//QROLUSTURMA
//api/GetPaymentOnMobile/QrCreate?services=TableUniqueValue
//2081b4d7-8283-479e-979b-782024b8be06.2.1.959839b1-091e-464b-a040-7d8f6c9055b3.9001c570-29a2-4b44-bade-c084fe4f431c.b52059a5-9c8f-41f3-8036-a872cdf8ef7f.36ea6f0e-8bcc-4380-a161-a8cb949e4564
 


 //Kioskda QR KOD OKUTULUNCA ISTEK YAPILACAK APİ 

 //http://localhost:5000/api/SuffaIT/SearchQR?hasCard={true/false}&qrValue={qrdeğeri}


// 9381eeaa-a02f-47e3-bed9-6021e3fad5bb.2.2870.7b7e517a-044f-481d-b58f-1cbaa986e99d.3fd93a7b-6338-4d7f-8650-a04cf306b6ee.ff088f64-083a-4ad0-ae31-e7973dd49111.df68be57-c015-4a40-9b65-affcad040e40