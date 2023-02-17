import express, { Request, Response, Router } from "express";
import * as productService from "../services/products.service";
import { paramsProduct, Products } from "../types/product.type";
import {
  ProductDocument,
  Product,
  IProductType,
} from "../models/product.model";
import uploadProduct from "../middleware/product.upload";

const createProduct = async (req: Request, res: Response, next: Function) => {
  try {
    const path =
      req.file?.path != undefined ? req.file.path.replace(/\\/g, "/") : "";
    const product: IProductType = {
      product_name: req.body.product_name,
      product_description: req.body.product_description,
      product_image: path,
      product_short_description: req.body.product_short_description,
      product_price: req.body.product_price,
      product_sale_price: req.body.product_sale_price,
      product_SKU: req.body.product_SKU,
      product_type: req.body.product_type,
      stack_status: req.body.stack_status,
      category: req.body.category,
    };

    const savedProduct = await productService.createProduct(product, Function);
    return res.json({
      message: "Product successfully saved",
      product: savedProduct,
    });
  } catch (error) {
    return next(error);
  }
};

const getAllProducts = async (req: Request, res: Response, next: Function) => {
  try {
    const params: any = {
      product_name: req.query.product_name,
      category_id: req.query.category_id,
      pageSize: req.query.pageSize,
      page: req.query.page,
    };
    const products = await productService.getAllProducts(params);
    return res.json(products);
  } catch (error) {
    return next(error);
  }
};

const getProductById = async (req: Request, res: Response, next: Function) => {
  try {
    console.log(req.params.id);
    const product = await productService.getProductById(req.params.id);
    console.log(product);
    return res.json(product);
  } catch (error) {
    return next(error);
  }
};

const updateProductById = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const { id } = req.params;
    const { category_name, category_description } = req.body;
    const updatedCategory = await productService.updateProductById(
      id,
      category_name,
      category_description
    );
    return res.json({
      message: "Successfully updated",
      category: updatedCategory,
    });
  } catch (error) {
    return next(error);
  }
};

const deleteProductById = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const category = await productService.deleteProductById(req.params.id);
    console.log(category);
    if (category) {
      return res.json({ message: "product deleted", category });
    } else {
      return res.json({ message: "product not found" });
    }
  } catch (error) {
    return next(error);
  }
};

const product_router = (router: Router) => {
  router
    .route("/")
    .post(uploadProduct.single("image"), createProduct)
    .get(getAllProducts);
  router
    .route("/:id")
    .get(getProductById)
    .delete(deleteProductById)
    .put(updateProductById);
};

export default product_router;
