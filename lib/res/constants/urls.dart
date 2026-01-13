class Urls {
  static const baseUrl = 'http://service.ozzo.eu.com/api/v1/';

  static const loginUrl = "${baseUrl}users/login";

  static const forgotPassword = "${baseUrl}users/forgotPassword/AL";

  static const verifyResetCode = "${baseUrl}users/verifyResetCode";

  static const getUser = '${baseUrl}users/user';
  static const getCompany = '${baseUrl}companies/';
  static const getUserNotification = '${baseUrl}users/notifications';

  static const getUserStates = '${baseUrl}companies/stats/';

// https://service.ozzo.eu/api/v1/transactions/?company_id=66100493fdc1abbdd7ffb720
  static const getTransactionUrl = "${baseUrl}transactions/";

  static const getAllVenues = "${baseUrl}points";
  static const updateVenueProfile = "${baseUrl}points";
  static const uploadVenueProfilePicture = "${baseUrl}upload/points/";
  static const getMenus = "${baseUrl}menus/";
  static const addItemCategory = "${baseUrl}menu_categories/";
  static const addItemSubCategory = "${baseUrl}menu_sub_categories/";
  static const getAllDishes = "${baseUrl}items/";
  static const uploadItemDishImage = "${baseUrl}upload/items/";
  static const getAllIngredients = "${baseUrl}ingredients/";
  static const venueStates = '${baseUrl}points/';

  static const getAllSubscriptions = "${baseUrl}companies/getAllSubscriptions/";

  static const getAllServiceAreasAndTable =
      '${baseUrl}service_areas/?point_id=';

  static const updateTableActiveStatus = "${baseUrl}tables/";
  static const postTable = "${baseUrl}tables/";
  static const patchTable = "${baseUrl}tables/";
  static const deleteQrCode = "${baseUrl}tables/";
  static const addQr = "${baseUrl}qr/table/";
  static const getAllQr = "${baseUrl}qr/";

  static const addServiceArea = "${baseUrl}service_areas/";

  static const getPaymentMethods = "${baseUrl}stripe/getPaymentMethods/";
  static const getPlans = "${baseUrl}upay/plans";

  static const changePaymentMethod = "${baseUrl}stripe/changePaymentMethod/";

  static const getCustomizers = "${baseUrl}customizers/";
  static const getSize = "${baseUrl}sizes/";
}
