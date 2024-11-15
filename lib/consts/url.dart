

class Url{
  
 
  static String Token_user = "";
  static String Token_prov="";
  // static int user_id = 0;
  static String saved_id_user="0";
   static String saved_id_prov="0";
  static String  saved_id_prov_reg="0";
   static int task_id = 0;
  static int id_user = 3;
  static int id_provider = 1000;
  static int id_product= 1; 
   static int idAddtion= 1; 
    static int idBouqet= 1; 
    static int show_id_provider = 1;
  static int Posts_id_provider = 1;
  static int totalprice = 0;
  static int order_id= 0;
  
  static String domain = 'http://192.168.43.57:8000';
  
  static const registeruserr = '/customer/register';
  static const login = '/customer/login';
  static const registerproviderr='/provider/register';
  static const logoutuser='/customer/logout';
  static const logoutprovider='/provider/logout';
  static const loginprovider='/provider/login';
 
  static const getprice='/customer/get-price/18';
 static const createorder='/customer/order';
  static const getcart='/customer/cart';
  }