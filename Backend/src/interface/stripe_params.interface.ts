export interface CustomerParams {
  name: string;
  email: string;
}
export interface AddCardParams {
  card_Name: string;
  card_Number: string;
  card_ExpMonth: number;
  card_ExpYear: number;
  card_CVC: string;
  customer_id: string;
}
export interface PaymentIntentParams {
  receipt_email: string;
  amount: number;
  card_id: string;
  customer_id: string;
}
