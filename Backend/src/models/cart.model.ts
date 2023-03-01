import { Model, Schema, Document, Types, model } from "mongoose";

import { ICartItem } from "../interface/cart_params.interface";
interface ICart {
  userId: string;
  products: ICartItem[];
}

interface ICartDocument extends Document, ICart {
  cartId: string;
}

const cartSchema = new Schema<ICart>(
  {
    userId: { type: String, required: true },
    products: [
      {
        product: { type: Types.ObjectId, ref: "Product", required: true },
        qty: { type: Number, required: true, default: 1 },
      },
    ],
  },
  {
    toJSON: {
      transform: function (dec, ret) {
        ret.cartId = ret._id.toString();
        delete ret._id;
        delete ret.__id;
      },
    },

    timestamps: true,
  }
);

const CartModel: Model<ICartDocument> = model<ICartDocument>(
  "Cart",
  cartSchema
);

export { CartModel, ICart, ICartDocument, ICartItem };
