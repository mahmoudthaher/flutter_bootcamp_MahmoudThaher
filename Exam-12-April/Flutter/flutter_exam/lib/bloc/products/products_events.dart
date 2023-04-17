abstract class ProductEvents {}

// Get All Users

class GetProductsEvent extends ProductEvents {}

class RemoveProductEvent extends ProductEvents {
  int index;
  RemoveProductEvent(this.index);
}

// class IncreaseUserEvent extends ProductEvents {
//   int index;
//   IncreaseUserEvent(this.index);
// }
//
// class DecreaseUserEvent extends ProductEvents {
//   int index;
//   DecreaseUserEvent(this.index);
// }

// Add new User
// Edit existing user;
// Destory user.