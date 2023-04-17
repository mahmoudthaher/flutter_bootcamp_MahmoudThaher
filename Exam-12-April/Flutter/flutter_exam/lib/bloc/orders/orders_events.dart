abstract class OrderEvents {}

// Get All Users

class GetOrdersEvent extends OrderEvents {}

class RemoveOrdersEvent extends OrderEvents {
  int index;
  RemoveOrdersEvent(this.index);
}

// class IncreaseUserEvent extends OrderEvent {
//   int index;
//   IncreaseUserEvent(this.index);
// }
//
// class DecreaseUserEvent extends OrderEvent {
//   int index;
//   DecreaseUserEvent(this.index);
// }

// Add new User
// Edit existing user;
// Destory user.