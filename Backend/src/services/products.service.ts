import {
  Product,
  ProductDocument,
  IProductType,
} from "../models/product.model";
import MONGO_DB_CONFIG from "../config/app.config";
import { paramsProduct, Products } from "../types/product.type";
import path from "path";
import fs from "fs-extra";
import { FilterQuery } from "mongoose";

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
  params: paramsProduct
): Promise<ProductDocument[]> => {
  try {
    const product_name = params.product_name;
    const category_id = params.category_id;
    let condition: FilterQuery<IProductType> = {};
    if (product_name) {
      condition["product_name"] = {
        $regex: new RegExp(product_name),
        $option: "i",
      };
    }
    if (category_id) {
      condition["category_id"] = category_id;
    }

    let perPage = Math.abs(params.pageSize) || MONGO_DB_CONFIG.PAGE_SIZE;
    let page = (Math.abs(params.page) || 1) - 1;

    const products = await Product.find(condition)
      .populate({
        path: "category",
        select: "category_name category_description category_image",
        model: "Category",
      })
      .limit(perPage)
      .skip(perPage * page);

    return products;
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

export const getProductById = async (id: string): Promise<IProductType> => {
  try {
    const product = await Product.findById(id).lean();
    if (!product) throw "Not Found Category With id" + id;
    else return product;
  } catch (err: any) {
    throw new Error(`Error retrieving category with id ${id}: ${err.message}`);
  }
};

export const deleteProductById = async (id: string): Promise<IProductType> => {
  try {
    const product = await Product.findByIdAndDelete(id).lean();
    if (product && product.product_image) {
      // console.log(path.resolve(product.product_image));
      const exist = await fs.pathExists(path.resolve(product.product_image));
      if (exist) await fs.unlink(path.resolve(product.product_image));
    }
    if (!product) throw "Not Found CategoryWith id" + id;
    else return product;
  } catch (error: any) {
    throw new Error(`Error deleting category with id ${id}: ${error.message}`);
  }
};
