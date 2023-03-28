import I18n from '@ioc:Adonis/Addons/I18n';
import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import City from 'App/Models/City';
export default class CitiesController {
    public async getAll(ctx: HttpContextContract) {
        const token = await ctx.auth.authenticate();
        var city = ctx.request.input("city");
        var query = City.query();
        const page = ctx.request.input('page', 1)
        const limit = 10
        if (city) {
            return query.where("city", city).paginate(page, limit);
        }
        else
            return query.paginate(page, limit);
        
    }
    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await City.findOrFail(id);
        return result;
    }
    public async create(ctx: HttpContextContract) {
        const newSchema = schema.create({
            city: schema.string([
                rules.unique({
                    table: 'cities',
                    column: 'City',
                })
            ]),
        });
        const fields = await ctx.request.validate({ schema: newSchema,
            messages:{
                'city.required':I18n.locale('ar').formatMessage('cities.cityIsRequired'),
                'city.unique':I18n.locale('ar').formatMessage('cities.city.unique')
            } });
        var city = new City();
        city.city = fields.city;
        await city.save();
        return { message: "The city has been created!" };
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            id: schema.number(),
            city: schema.string([
                rules.unique({
                    table: 'cities',
                    column: 'City',
                })
            ]),
        });
        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var city = await City.findOrFail(id);
        city.city = fields.city;
        await city.save();
        return { message: "The city has been updated!" };
    }
    public async destory(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var city = await City.findOrFail(id);
        await city.delete();
        return { message: "The city has been deleted!" };
    }
}
