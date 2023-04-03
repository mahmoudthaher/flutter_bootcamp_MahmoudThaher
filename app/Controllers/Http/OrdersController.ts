import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import {schema} from '@ioc:Adonis/Core/Validator'
import Order from 'App/Models/Order';
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
        var id = ctx.params.id;
        var result = await Order.query().preload('product').preload('status').preload('user').where('id',id);
        return result;
    }
    public async create(ctx: HttpContextContract) {

        const newSchema = schema.create({
            quantity: schema.number(),
            total_price: schema.number(),
            user_id: schema.number(),
            product_id: schema.number(),
            status_id: schema.number(),
        });

        const fields = await ctx.request.validate({ schema: newSchema });
        var order = new Order();
        order.quantity = fields.quantity;
        order.totalPrice = fields.total_price;
        order.userId = fields.user_id;
        order.productId = fields.product_id;
        order.statusId = fields.status_id;
        await order.save();
        return { message: "The order has been created!" };
        
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            id: schema.number(),
            quantity: schema.number(),
            total_price: schema.number(),
            user_id: schema.number(),
            product_id: schema.number(),
            status_id: schema.number(),
        });

        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var order = await Order.findOrFail(id);
        order.quantity = fields.quantity;
        order.totalPrice = fields.total_price;
        order.userId = fields.user_id;
        order.productId = fields.product_id;
        order.statusId = fields.status_id;
        await order.save();
        return { message: "The order has been updated!" };
    }
    public async destory(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var order = await Order.findOrFail(id);
        await order.delete();
        return { message: "The order has been deleted!" };
    }
}
