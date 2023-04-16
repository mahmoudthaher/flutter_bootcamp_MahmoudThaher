import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Order from 'App/Models/Order';
import {schema,rules} from '@ioc:Adonis/Core/Validator'
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

    public async createOrder(ctx: HttpContextContract) {

        // const newSchema = schema.create({
        //     username: schema.string(),
        //     email: schema.string([
        //         rules.email(),
        //         rules.unique({
        //             table: 'users',
        //             column: 'email',
        //         })
        //     ]),
        //     password: schema.string(),
        // });
        // const fields = await ctx.request.all();
        // const token = await ctx.auth.authenticate();
        // var price=
        // var total=price*qty
        // var order = new Order();
        // order.userId = token.id;
        // console.log(order.userId)
        // // user.email = fields.email;
        // // user.password = fields.password;
        // // await user.save();
        
        // return  'result' ;
    }
}
