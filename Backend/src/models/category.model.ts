import mongoose, { model, Schema, Document, Model } from "mongoose";
import { ProductDocument } from "./product.model";

interface ICategoryType {
  category_name: string;
  category_description: string;
  category_image: string;
}

interface CategoryDocument extends Document, ICategoryType {}

const categorySchema = new Schema(
  {
    category_name: { type: String },
    category_description: { type: String },
    category_image: { type: String },
  },
  {
    toJSON: {
      transform: (doc, ret) => {
        ret.category_id = ret._id.toString();
        delete ret._id;
        delete ret.__v;
      },
    },
  }
);

const Category: Model<CategoryDocument> = mongoose.model<CategoryDocument>(
  "Category",
  categorySchema
);

export { Category, CategoryDocument, ICategoryType };
