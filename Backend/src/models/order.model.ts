import mongoose, { Document, Schema } from "mongoose";

interface IProduct {
  product: Schema.Types.ObjectId;
  amount: number;
  qty: number;
}
interface IOrder {
  userId: string;
  grandTotal: number;
  orderStatus: string;
  transactionId: string;
  products: IProduct[];
}
interface IOrderDocument extends Document, IOrder {}

const orderSchema = new Schema(
  {
    userId: { type: String, required: true },
    products: [
      {
        product: {
          type: Schema.Types.ObjectId,
          ref: "Product",
          requires: true,
        },
        amount: { type: Number, required: true },
        qty: { type: Number, required: true },
      },
    ],
    grandT0tal: { type: Number, required: true },
    orderStatus: { type: String, required: true },
    transactionId: { type: String },
  },
  {
    timestamps: true,
  }
);
const orderModel = mongoose.model<IOrderDocument>("Order", orderSchema);

export { IOrderDocument, orderModel };
