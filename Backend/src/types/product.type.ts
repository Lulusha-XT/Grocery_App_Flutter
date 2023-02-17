import mongoose from "mongoose";

export interface Products {
  product_name: string;
  product_description: string;
  product_image: string | undefined;
  product_short_description: string;
  product_price: number;
  product_sale_price: number;
  product_SKU: string;
  product_type: string;
  stack_status: string;
  category_id?: mongoose.Schema.Types.ObjectId;
}

export interface paramsProduct {
  product_name: string;
  pageSize: number;
  page: number;
  category_id?: mongoose.Schema.Types.ObjectId;
}
