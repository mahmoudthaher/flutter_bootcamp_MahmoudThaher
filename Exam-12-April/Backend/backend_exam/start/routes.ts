import Route from '@ioc:Adonis/Core/Route'
Route.group(() => {
  Route.group(() => {
    Route.get("", "UsersController.getByAuth");
    Route.post("/login", "UsersController.login");
    Route.post("/logout", "UsersController.logout");
    Route.post("/", "UsersController.create");
    Route.put("/", "UsersController.update");
  }).prefix("/Users");
  Route.group(() => {
    Route.get("", "ProductsController.getAll");
  }).prefix("/Products");
    Route.group(() => {
      Route.get("/:id", "OrdersController.getOrderById");
      Route.get("", "OrdersController.getAllOrdersByAuth");
      Route.post("/", "OrdersController.createOrder");
    }).prefix("/Orders");
}).prefix("api")
