import mongoose, { Model, Schema, Document } from "mongoose";

interface IProductType {
  product_name: string;
  product_description: string;
  product_image: string;
  product_short_description: string;

  product_price: number;
  product_sale_price: number;

  product_SKU: string;
  product_type: string;
  stack_status: string;
  category: mongoose.Schema.Types.ObjectId;
}

interface ProductDocument extends Document, IProductType {}

const productScheam = new Schema(
  {
    product_name: { type: String },
    product_description: { type: String },
    product_image: { type: String },
    product_short_description: { type: String },
    product_price: { type: Number },
    product_sale_price: { type: Number, default: 0 },

    product_SKU: { type: String },
    product_type: { type: String, default: "Simple" },
    stack_status: { type: String, default: "IN" },

    category: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Category",
    },
  },
  {
    toJSON: {
      transform: function (doc, ret) {
        ret.product_id = ret._id.toString();
        delete ret._id;
        delete ret.__v;
      },
    },
  }
);

const Product: Model<ProductDocument> = mongoose.model<ProductDocument>(
  "Product",
  productScheam
);
export { Product, ProductDocument, IProductType };

// export default model<IProduct>("Product", productScheam);
