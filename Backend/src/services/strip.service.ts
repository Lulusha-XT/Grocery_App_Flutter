import Stripe from "stripe";
import {
  CustomerParams,
  AddCardParams,
  PaymentIntentParams,
} from "../interface/stripe_params.interface";

const stripe_key = process.env.STRIPE_KEY!;

const stripeClient = new Stripe(stripe_key, {
  apiVersion: "2022-11-15",
  typescript: true,
});

export const createCustomer = async (
  params: CustomerParams
): Promise<Stripe.Customer> => {
  try {
    console.log(params);
    const customer = await stripeClient.customers.create({
      name: params.name,
      email: params.email,
    });
    return customer;
  } catch (err) {
    throw new Error(`${err}`);
  }
};

export const addCard = async (
  params: AddCardParams,
  customerId: string
): Promise<string> => {
  try {
    // console.log(params);
    const cardToken = await stripeClient.tokens.create({
      card: {
        number: params.card_Number,
        exp_month: params.card_ExpMonth,
        exp_year: params.card_ExpYear,
        cvc: params.card_CVC,
        name: params.card_Name,
      },
    } as unknown as Stripe.TokenCreateParams); // specify type of argument

    console.log(cardToken);

    const card = await stripeClient.customers.createSource(customerId, {
      source: `${cardToken.id}`,
    });

    return card.id;
  } catch (err) {
    throw new Error(`${err}`);
  }
};

export const generatePaymentIntent = async (params: PaymentIntentParams) => {
  try {
    const createPaymentIntent = await stripeClient.paymentIntents.create({
      receipt_email: params.receipt_email,
      amount: params.amount * 100,
      currency: process.env.CURRENCY!,
      payment_method: params.card_id,
      customer: params.customer_id,
      payment_method_types: ["card"],
    });

    return createPaymentIntent;
  } catch (err) {
    throw new Error(`${err}`);
  }
};
