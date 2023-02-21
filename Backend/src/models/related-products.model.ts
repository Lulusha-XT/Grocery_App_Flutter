import mongoose, { Model, Schema } from "mongoose";

interface IRelatedProduct {
  product: string;
  relatedProduct: string;
}

interface RelatedProductDocument extends IRelatedProduct, Document {}

const relatedProductScema = new Schema(
  {
    product: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Product",
    },

    relatedProduct: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Product",
    },
  },
  {
    toJSON: {
      transform: (ret, doc) => {
        delete ret._id;
        delete ret.__v;
      },
    },
    timestamps: true,
  }
);

const RelatedProduct: Model<RelatedProductDocument> =
  mongoose.model<RelatedProductDocument>("RelatedProduct", relatedProductScema);

export { IRelatedProduct, RelatedProductDocument, RelatedProduct };
