import { Response, Router } from "express";
import { UpdateOrderParams } from "../interface/order_service.interface";
import { AddCardParams } from "../interface/stripe_params.interface";
import { IRequest } from "../interface/user.interface";
import { authenticationToken } from "../middleware/auth";
import * as orderService from "../services/order.service";

export async function getOrder(req: IRequest, res: Response): Promise<void> {
  try {
    const userId = req.user?.user_id!;
    const orders = await orderService.getOrder(userId);

    res.status(201).json({ message: "success", data: orders });
  } catch (err) {
    res.status(500).json({ message: "error", error: `${err}` });
  }
}
export async function createOrder(req: IRequest, res: Response): Promise<void> {
  try {
    // console.log(req.user?.user_id);
    const userId = req.user?.user_id!;
    const amount = req.body.amount;
    const model: AddCardParams = {
      card_Name: req.body.card_Name,
      card_Number: req.body.card_Number,
      card_ExpMonth: req.body.card_ExpMonth,
      card_ExpYear: req.body.card_ExpYear,
      card_CVC: req.body.card_CVC,
      customer_id: req.user?.user_id!,
    };
    // console.log(model);
    const order = await orderService.creatOrder(model, userId, amount);
    res.status(200).json({ message: "success", data: order });
  } catch (err) {
    res.status(500).json({ message: "error", error: `${err}` });
  }
}

export async function updateOrder(req: IRequest, res: Response): Promise<void> {
  try {
    const model: UpdateOrderParams = {
      orderId: req.body.orderId,
      status: req.body.status,
      transactionId: req.body.transactionId,
    };
    const updateOrder = await orderService.updateOrder(model);
    res.status(201).json({ message: "success", data: updateOrder });
  } catch (err) {
    res.status(500).json({ message: "error", error: `${err}` });
  }
}

const order_router = (router: Router) => {
  router.post("/", authenticationToken, createOrder);
  router.put("/", authenticationToken, updateOrder);
  router.get("/", authenticationToken, getOrder);
};

export default order_router;
