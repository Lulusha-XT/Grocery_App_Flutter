import {
  Product,
  ProductDocument,
  IProductType,
} from "../models/product.model";
import MONGO_DB_CONFIG from "../config/app.config";
import { paramsProduct, Products } from "../types/product.type";
import path from "path";
import fs from "fs-extra";
import mongoose, { FilterQuery, ObjectId } from "mongoose";
import { IRelatedProduct } from "../models/related-products.model";

export const createProduct = async (
  product: IProductType,
  callback: Function
): Promise<ProductDocument> => {
  console.log(product);
  try {
    if (!product.product_name) {
      return callback({
        message: "Product Name required",
      });
    }

    if (!product.category) {
      return callback({
        message: "Category required",
      });
    }
    console.log(product);
    const newProduct: ProductDocument = new Product(product);
    const savedProduct = await newProduct.save();
    return savedProduct;
  } catch (error: any) {
    throw new Error(`Error creating product  ${error.message}`);
  }
};

export const getAllProducts = async (
  params: any
): Promise<ProductDocument[]> => {
  try {
    const product_name = params.product_name;
    const category_id = params.category_id;
    const product_ids = params.product_ids;
    let condition: FilterQuery<IProductType> = {};

    if (product_name) {
      condition.productName = {
        $regex: new RegExp(product_name, "i"),
      };
    }
    if (category_id) {
      condition.category = category_id;
    }
    if (product_ids) {
      condition._id = {
        $in: product_ids.split(","),
      };
    }
    console.log(params.sort);

    let perPage = Math.abs(params.pageSize) || MONGO_DB_CONFIG.PAGE_SIZE;
    let page = (Math.abs(params.page) || 1) - 1;

    const products: unknown | ProductDocument = await Product.find(condition)
      .select(
        " product_name product_description product_image product_short_description product_price product_sale_price product_SKU product_type stack_status category createdAt updatedAt "
      )
      .sort(params.sort)
      .populate({
        path: "category",
        select: "category_name category_description category_image",
        model: "Category",
      })
      .populate("relatedProduct", "relatedProduct")
      .limit(perPage)
      .skip(perPage * page);

    let productss = (Array.isArray(products) ? products : [products]).map(
      (p) => {
        if (p.relatedProduct.length > 0) {
          p.relatedProduct = p.relatedProduct.map(
            (x: { relatedProduct: any }) => x.relatedProduct
          );
        }
        return p;
      }
    );

    return productss;
  } catch (error: any) {
    throw new Error(`Error retriving products: ${error.message}`);
  }
};

export const updateProductById = async (
  id: string,
  product_name: string,
  product_description: string
): Promise<IProductType> => {
  try {
    const updatedProduct = await Product.findByIdAndUpdate(
      id,
      {
        product_name,
        product_description,
      },
      { new: true }
    ).lean();
    if (!updatedProduct) throw "Not Found Category With id" + id;
    else return updatedProduct;
  } catch (err: any) {
    throw new Error(`Error updating category with id ${id}: ${err.message}`);
  }
};

export async function getProductById(
  productId: string
): Promise<ProductDocument> {
  try {
    const product = await Product.findById(productId)
      .populate("category", "category_name category_description category_image")
      .populate("relatedProduct", "relatedProduct");
    if (!product) {
      throw new Error("Product is null");
    }
    product.relatedProduct =
      product.relatedProduct.map(
        (x: { relatedProduct: unknown }) =>
          x.relatedProduct as unknown as IRelatedProduct
      ) ?? [];

    return product;
  } catch (err) {
    throw new Error(`${err}`);
  }
}

// export const getProductById = async (
//   id: string
// ): Promise<ProductDocument[]> => {
//   try {
//     let product = await Product.findById(id).populate({
//       path: "category",
//       select: "category_name category_description category_image",
//     });

//     if (!product) throw new Error(`Not Found Category With id ${id}`);

//     let productss = (Array.isArray(product) ? product : [product]).map((p) => {
//       if (p.relatedProduct.length > 0) {
//         p.relatedProduct = p.relatedProduct.map(
//           (x: { relatedProduct: any }) => x.relatedProduct
//         );
//       }
//       return p;
//     });
//     console.log(product.relatedProduct);

//     return productss;
//   } catch (err: any) {
//     throw new Error(`Error retrieving category with id ${id}: ${err.message}`);
//   }
// };

export const deleteProductById = async (id: string): Promise<IProductType> => {
  try {
    const product = await Product.findByIdAndDelete(id).lean();
    if (product && product.product_image) {
      // console.log(path.resolve(product.product_image));
      const exist = await fs.pathExists(path.resolve(product.product_image));
      if (exist) await fs.unlink(path.resolve(product.product_image));
    }
    if (!product) throw "Not Found Category With id" + id;
    else return product;
  } catch (error: any) {
    throw new Error(`Error deleting category with id ${id}: ${error.message}`);
  }
};
