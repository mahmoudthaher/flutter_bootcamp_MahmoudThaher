import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Order from 'App/Models/Order';

export default class OrdersController {
    public async getAllOrdersByAuth(ctx: HttpContextContract) {
        const token = await ctx.auth.authenticate();
        var id = token.id;
        var result =await Order.query().where('user_id',id);
        return result;
    }
    public async getOrderById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await Order.findOrFail(id);
        return result;
    }
}
