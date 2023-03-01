export interface CreateCustomerResult {
  stripeCustomerID: string;
  cardId?: string;
  paymentIntentId?: string;
  client_secret?: string;
  orderId?: string;
}
export interface UpdateOrderParams {
  orderId: string;
  status: "success" | "failed";
  transactionId: string;
}

export interface OrderModel {
  orderStatus: string;
  transactionId: string;
}
