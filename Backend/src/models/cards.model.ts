import mongoose, { Model, Schema, Document } from "mongoose";

interface ICard {
  cardName: string;
  cardNumber: string;
  cardExpMonth: string;
  cardExpYear: string;
  cardCVC: string;
  customerId: string;
  cartId: string;
}
interface ICardDocument extends Document, ICard {}

const cardSchema = new Schema(
  {
    cardName: { type: String, required: false },
    cardNumber: { type: String, required: true, unique: true },
    cardExpMonth: { type: String, required: true },
    cardExpYear: { type: String, required: true },
    cardCVC: { type: String, required: true },
    customerId: { type: String, required: true },
    cartId: { type: String, required: true },
  },
  {
    timestamps: true,
  }
);

const cardModel = mongoose.model<ICardDocument>("CustomerCard", cardSchema);

export { ICard, ICardDocument, cardModel };
