import I18n from '@ioc:Adonis/Addons/I18n';
import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import Category from 'App/Models/Category';
export default class CategoriesController {
    public async getAll(ctx: HttpContextContract) {
        var category = ctx.request.input("category");
        var query = Category.query();
        const page = ctx.request.input('page', 1)
        const limit = 10
        if (category) {
            return query.where("category", category).paginate(page, limit);
        }
        else
            return query.whereNot("id",9).paginate(page, limit);
    }
    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await Category.findOrFail(id);
        return result;
    }
    public async create(ctx: HttpContextContract) {
        const newSchema = schema.create({
            category: schema.string([
                rules.unique({
                    table: 'categories',
                    column: 'category',
                })
            ]),
        });
        const fields = await ctx.request.validate({
            schema: newSchema,
            messages: {
                'category.required': I18n.locale('ar').formatMessage('categories.categoryIsRequired'),
                'category.unique': I18n.locale('ar').formatMessage('categories.category.unique')
            }
        });
        var category = new Category();
        category.category = fields.category;
        await category.save();
        return { message: "The category has been created!" };

    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            id: schema.number(),
            category: schema.string(),
        });
        const fields = await ctx.request.validate({
            schema: newSchema,
            messages: {
                'category.required': I18n.locale('ar').formatMessage('categories.categoryIsRequired'),
            }
        })
        try {
            var id = fields.id;
            var category = await Category.findOrFail(id);
            try {
                await Category.query()
                    .where('category', fields.category)
                    .whereNot('id', fields.id)
                    .firstOrFail()
                return { message: 'category is already in use. ' };
            } catch (error) { }
            category.category = fields.category;
            await category.save();
            return { message: "The category has been updated!" };
        } catch (error) {
            return { error: 'Category not found' }
        }
    }
    public async destory(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var category = await Category.findOrFail(id);
        await category.delete();
        return { message: "The category has been deleted!" };
    }
}
