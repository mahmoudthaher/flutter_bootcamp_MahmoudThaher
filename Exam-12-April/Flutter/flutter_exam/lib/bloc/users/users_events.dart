abstract class UsersEvents {}

// Get All Users

class GetUsersEvent extends UsersEvents {}

class RemoveUserEvent extends UsersEvents {
  int index;
  RemoveUserEvent(this.index);
}

class IncreaseUserEvent extends UsersEvents {
  int index;
  IncreaseUserEvent(this.index);
}

class DecreaseUserEvent extends UsersEvents {
  int index;
  DecreaseUserEvent(this.index);
}

// Add new User
// Edit existing user;
// Destory user.
