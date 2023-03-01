import { ProductDocument } from "../models/product.model";

export interface ICartItem {
  product: ProductDocument;
  qty: number;
}
