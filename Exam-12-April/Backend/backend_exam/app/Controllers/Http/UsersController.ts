import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import {schema,rules} from '@ioc:Adonis/Core/Validator'
import Database from '@ioc:Adonis/Lucid/Database';
import User from 'App/Models/User';
export default class UsersController {
    public async getByAuth(ctx: HttpContextContract) {
        const token = await ctx.auth.authenticate();
        var id = token.id;
        var result = await User.findOrFail(id);
        return result;
    }
    public async login(ctx: HttpContextContract) {
        var object = ctx.request.all();
        var email = object.email;
        var password = object.password;
        var result = await ctx.auth.attempt(email, password);
        return result;
    }

    public async findId(ctx: HttpContextContract) {
        var email = ctx.params.email;
        var result = User.query().select('*').where("email",email);
        return result;
    }

    public async logout(ctx: HttpContextContract) {
        const token= await ctx.auth.authenticate();
        await ctx.auth.logout();
        return { message: "Logout" }
    }
    public async create(ctx: HttpContextContract) {

        const newSchema = schema.create({
            username: schema.string(),
            email: schema.string([
                rules.email(),
                rules.unique({
                    table: 'users',
                    column: 'email',
                })
            ]),
            password: schema.string(),
        });
        const fields = await ctx.request.validate({ schema: newSchema });
        var user = new User();
        user.username = fields.username;
        user.email = fields.email;
        user.password = fields.password;
        await user.save();
        var object = ctx.request.all();
        var result = await ctx.auth.attempt(object.email, object.password);
        return  result ;
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            id:schema.number(),
            username: schema.string(),
            email: schema.string(),
            password: schema.string(),
        });
        
        const fields = await ctx.request.validate({ schema: newSchema });
        let errorMessage = ''
        try {
            var id = fields.id;
            var user = await User.findOrFail(id);
            try {
                await User.query()
                    .where('email', fields.email)
                    .whereNot('id', id)
                    .firstOrFail()
                errorMessage += 'Email address is already in use. '
            } catch (error) { }
            if (errorMessage !== '') {
                return { error: errorMessage }
            }
            user.username = fields.username;
            user.email = fields.email;
            user.password = fields.password;
            await user.save();
            return { message: "The user has been updated!" };
        }
         catch (error) {
            return { error: 'User not found' }
        }
    }
}
