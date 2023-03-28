import I18n from '@ioc:Adonis/Addons/I18n';
import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import {schema,rules} from '@ioc:Adonis/Core/Validator'
import Product from 'App/Models/Product';
export default class ProductsController {
    public async getAll(ctx: HttpContextContract) {
        const token = await ctx.auth.authenticate();
        var name = ctx.request.input("name");
        var categoryId = ctx.request.input("category_id");
        var discountId = ctx.request.input("discount_id");
        var query = Product.query().preload('category').preload('discount');
        const page = ctx.request.input('page', 1)
        const limit = 10
        if (name) {
            return query.where("name", name).paginate(page, limit);
        }
        if (categoryId) {
            return query.where("category_id", categoryId).paginate(page, limit);
        }
        if (discountId) {
            return query.where("discount_id", discountId).paginate(page, limit);
        }
        else
            return await query.paginate(page, limit);
    }
    public async getById(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var result = await Product.query().preload('category').preload('discount').where('id',id);
        return result;
    }
    public async create(ctx: HttpContextContract) {

        const newSchema = schema.create({
            name: schema.string([
                rules.unique({
                    table: 'products',
                    column: 'name',
                })
            ]),
            description: schema.string(),
            price: schema.number(),
            quantity_in_stock: schema.number(),
            image: schema.string(),
            category_id: schema.number(),
        });

        const fields = await ctx.request.validate({ schema: newSchema,
            messages:{
                'name.required':I18n.locale('ar').formatMessage('products.nameIsRequired'),
                'name.unique':I18n.locale('ar').formatMessage('products.name.unique'),
                'description.required':I18n.locale('ar').formatMessage('products.descriptionIsRequired'),
                'price.required':I18n.locale('ar').formatMessage('products.priceIsRequired'),
                'price.number':I18n.locale('ar').formatMessage('products.price.number'),
                'quantity_in_stock.required':I18n.locale('ar').formatMessage('products.quantityInStockIsRequired'),
                'quantity_in_stock.number':I18n.locale('ar').formatMessage('products.quantityInStock.number'),
                'image.required':I18n.locale('ar').formatMessage('products.imageIsRequired'),
                'category_id.required':I18n.locale('ar').formatMessage('products.categoryIdIsRequired'),
            } });
        const fields2 = ctx.request.all();
        var product = new Product();
        product.name = fields.name;
        product.description = fields.description;
        product.price = fields.price;
        product.quantityInStock = fields.quantity_in_stock;
        product.image = fields.image;
        product.categoryId = fields.category_id;
        product.discountId = fields2.discount_id;
        await product.save();
        return { message: "The product has been created!" };
        
    }
    public async update(ctx: HttpContextContract) {
        const newSchema = schema.create({
            id: schema.number(),
            name: schema.string(),
            description: schema.string(),
            price: schema.number(),
            quantity_in_stock: schema.number(),
            image: schema.string(),
            category_id: schema.number(),
            discount_id: schema.number(),
        });

        const fields = await ctx.request.validate({ schema: newSchema })
        var id = fields.id;
        var product = await Product.findOrFail(id);
        product.name = fields.name;
        product.description = fields.description;
        product.price = fields.price;
        product.quantityInStock = fields.quantity_in_stock;
        product.image = fields.image;
        product.categoryId = fields.category_id;
        product.discountId = fields.discount_id;
        await product.save();
        return { message: "The product has been updated!" };
    }
    public async destory(ctx: HttpContextContract) {
        var id = ctx.params.id;
        var product = await Product.findOrFail(id);
        await product.delete();
        return { message: "The product has been deleted!" };
    }
}
