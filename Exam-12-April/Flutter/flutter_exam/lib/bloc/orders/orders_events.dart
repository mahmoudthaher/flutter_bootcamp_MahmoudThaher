abstract class OrderEvents {}

class GetOrdersEvent extends OrderEvents {}

class RemoveOrdersEvent extends OrderEvents {
  int index;
  RemoveOrdersEvent(this.index);
}
