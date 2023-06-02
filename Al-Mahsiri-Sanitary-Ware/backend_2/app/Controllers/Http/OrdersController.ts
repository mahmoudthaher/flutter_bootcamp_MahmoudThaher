import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import {schema} from '@ioc:Adonis/Core/Validator'
import auth from 'Config/auth';
import Order from 'App/Models/Order';
import OrderAddress from 'App/Models/OrderAddress';
import OrderProduct from 'App/Models/OrderProduct';
export default class OrdersController {
    public async getAll(ctx: HttpContextContract) {
        const token = await ctx.auth.authenticate();
        var userId = ctx.request.input("user_id");
        var productId = ctx.request.input("product_id");
        var statusId = ctx.request.input("status_id");
        var query = Order.query().preload('user').preload('product').preload('status');
        const page = ctx.request.input('page', 1)
        const limit = 10
        if (userId) {
            return query.where("user_id", userId).paginate(page, limit);
        }
        if (productId) {
            return query.where("product_id", productId).paginate(page, limit);
        }
        if (statusId) {
            return query.where("status_id", statusId).paginate(page, limit);
        }
        else
            return await query.paginate(page, limit);
    }
    public async getById(ctx: HttpContextContract) {
        var userId = ctx.params.userId;
        var result = await Order.query().preload('status').preload('user').where('user_id',userId).orderBy('id',"desc");
        return result;
    }
    
    public async create({ request, response, auth }: HttpContextContract) {

        try {

            var authObject = await auth.authenticate();
            var data = request.all();

            var order = new Order();
            order.userId = authObject.id;
            order.taxAmount = data.tax_amount;
            order.subTotal = data.sub_total;
            order.total = data.total;
            order.paymentMethodId = data.payment_method_id;
            order.statusId=1;
            var newOrder = await order.save();

            var address = new OrderAddress();
            address.country = data.address.country;
            address.city = data.address.city;
            address.area = data.address.area;
            address.street = data.address.street;
            address.buildingNo = data.address.building_no;
            address.longitude = data.address.longitude;
            address.latitude = data.address.latitude;
            address.orderId = newOrder.id;
            await address.save();


            var orderProducts: OrderProduct[] = data.products.map((product) => {
                var orderProduct = new OrderProduct();
                orderProduct.orderId = newOrder.id;
                orderProduct.productId = product.product_id;
                orderProduct.qty = product.qty;
                orderProduct.price = product.price;
                return orderProduct;
            });

            await OrderProduct.createMany(orderProducts);
            return newOrder.toJSON();
        } catch (ex) {
            console.log(ex);
            return response.badRequest({ message: ex });
        }
        
    }
    public async update(ctx: HttpContextContract) {
        // const newSchema = schema.create({
        //     id: schema.number(),
        //     quantity: schema.number(),
        //     total_price: schema.number(),
        //     user_id: schema.number(),
        //     product_id: schema.number(),
        //     status_id: schema.number(),
        // });

        // const fields = await ctx.request.validate({ schema: newSchema })
        // var id = fields.id;
        // var order = await Order.findOrFail(id);
        // order.quantity = fields.quantity;
        // order.totalPrice = fields.total_price;
        // order.userId = fields.user_id;
        // order.productId = fields.product_id;
        // order.statusId = fields.status_id;
        // await order.save();
        // return { message: "The order has been updated!" };
    }
    public async destory(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var order = await Order.findOrFail(id);
        await order.delete();
        return { message: "The order has been deleted!" };
    }
}
