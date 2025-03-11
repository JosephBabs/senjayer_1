class ApiRoutes {
  static const String baseUrl = "https://api.senjayer.com/api";

  // Authentication
  static const String loginUrl = "$baseUrl/auth/login";
  static const String registerUrl = "$baseUrl/auth/register";
  static const String logoutUrl = "$baseUrl/auth/logout";

  // User
  static const String getUserProfile = "$baseUrl/user/profile";
  static const String updateUserProfile = "$baseUrl/user/update";

  // Products
  static const String getProducts = "$baseUrl/products";
  static const String getProductDetails = "$baseUrl/products/{id}";

  // Orders
  static const String createOrder = "$baseUrl/orders/create";
  static const String getOrderDetails = "$baseUrl/orders/{id}";
  static const String cancelOrder = "$baseUrl/orders/{id}/cancel";

  // Example API Routes from OpenAPI Spec
  static const String getCategories = "$baseUrl/categories";
  static const String getCategoryDetails = "$baseUrl/categories/{id}";
  static const String createCategory = "$baseUrl/categories/create";

  static const String getTransactions = "$baseUrl/transactions";
  static const String getTransactionDetails = "$baseUrl/transactions/{id}";
  static const String createTransaction = "$baseUrl/transactions/create";

  // eventes
  static const String getEventsDetails = "$baseUrl/v1/agent/liste-event";
  static const String getEvents = "$baseUrl/v1/events";
}
