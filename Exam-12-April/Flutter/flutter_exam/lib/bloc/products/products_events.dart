abstract class ProductEvents {}

// Get All Users

class GetProductsEvent extends ProductEvents {}

class RemoveProductEvent extends ProductEvents {
  int index;
  RemoveProductEvent(this.index);
}

class IncreaseProductEvent extends ProductEvents {
  int index;
  IncreaseProductEvent(this.index);
}

class DecreaseProductEvent extends ProductEvents {
  int index;
  DecreaseProductEvent(this.index);
}

// Add new User
// Edit existing user;
// Destory user.