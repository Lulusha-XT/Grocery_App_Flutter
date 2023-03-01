import { User, IUserDocument, IUser } from "../models/user.model";
import { CartModel, ICartDocument } from "../models/cart.model";
import * as stripeService from "../services/strip.service";
import * as cartService from "../services/cart.service";
import { AddCardParams } from "../interface/stripe_params.interface";
import { IOrderDocument, orderModel } from "../models/order.model";
import {
  CreateCustomerResult,
  UpdateOrderParams,
  OrderModel,
} from "../interface/order_service.interface";
import { cardModel, ICardDocument } from "../models/cards.model";

export const creatOrder = async (
  addCardParams: AddCardParams,
  user_id: string,
  amount: number
): Promise<CreateCustomerResult> => {
  try {
    const user: IUserDocument | null = await User.findById(user_id);

    if (!user) {
      throw new Error("User not found");
    }
    // console.log(user.stripeCustomerID);
    let model: CreateCustomerResult = {
      stripeCustomerID: user.stripeCustomerID || "",
    };
    // console.log(model);

    if (!model.stripeCustomerID) {
      const result = await stripeService.createCustomer({
        name: user.full_name,
        email: user.email,
      });
      user.stripeCustomerID = result.id;
      await user.save();
      model.stripeCustomerID = result.id;
    }

    const card: ICartDocument | null = await cardModel.findOne({
      customerId: model.stripeCustomerID,
      cardNumber: addCardParams.card_Number,
      cardExpMonth: addCardParams.card_ExpMonth,
      cardExpYear: addCardParams.card_ExpYear,
    });

    if (!card) {
      console.log(card);
      const result = await stripeService.addCard(
        addCardParams,
        model.stripeCustomerID
      );

      const card_model: ICardDocument | null = new cardModel({
        cartId: result,
        cardName: addCardParams.card_Name,
        cardNumber: addCardParams.card_Number,
        cardExpMonth: addCardParams.card_ExpMonth,
        cardExpYear: addCardParams.card_ExpYear,
        cardCVC: addCardParams.card_CVC,
        customerId: model.stripeCustomerID,
      });

      await card_model?.save();
      model.cardId = result;
    } else {
      model.cardId = card.cartId;
    }
    const paymentIntentResult = await stripeService.generatePaymentIntent({
      receipt_email: user.email,
      amount: amount,
      card_id: model.cardId,
      customer_id: model.stripeCustomerID,
    });

    model.paymentIntentId = paymentIntentResult.id;
    model.client_secret = paymentIntentResult.client_secret!;

    const CartModelResult = await cartService.getCart(user.id);
    if (CartModelResult) {
      const products = CartModelResult.products.map((product) => ({
        product: product.product._id,
        qty: product.qty,
        amount: product.product.product_sale_price,
      }));

      const grandT0tal = products.reduce(
        (total, product) => total + product.amount!,
        0
      );

      const order = new orderModel({
        userId: CartModelResult.userId,
        products,
        orderStatus: "pending",
        grandT0tal,
      });

      const orderResult = await order.save();
      model.orderId = orderResult._id;
    }
    return model;
  } catch (error) {
    throw new Error(`${error}`);
  }
};

export const updateOrder = async (
  params: UpdateOrderParams
): Promise<OrderModel | "order failed"> => {
  try {
    const model: OrderModel = {
      orderStatus: params.status,
      transactionId: params.transactionId,
    };

    console.log(model);
    const updateOrder = await orderModel.findByIdAndUpdate(
      params.orderId,
      model,
      { useFindAndModify: false, new: true }
    );
    console.log(updateOrder);
    if (!updateOrder) {
      return "order failed";
    }

    if (params.status === "success") {
      // clear cart
    }
    return updateOrder;
  } catch (error) {
    throw new Error(`${error}`);
  }
};

export const getOrder = async (userId: string): Promise<IOrderDocument> => {
  try {
    const orders = await orderModel.findOne({ userId }).populate({
      path: "products",
      populate: {
        path: "product",
        model: "Product",
        populate: {
          path: "category",
          model: "Category",
          select: "categoryName",
        },
      },
    });
    return orders as IOrderDocument;
  } catch (error) {
    throw new Error(`${error}`);
  }
};
