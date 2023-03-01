import * as cartService from "../services/cart.service";
import { Request, Response, Router } from "express";
import { IUserDocument } from "../models/user.model";
import { authenticationToken } from "../middleware/auth";

interface IRequest extends Request {
  user?: IUserDocument;
}

const addCart = async (req: IRequest, res: Response, next: Function) => {
  try {
    const userId = req.user?.user_id; // or however you get the user ID from the request
    const product = req.body.product; // or however you get the product ID from the request
    // Call the cart service with the user ID and product

    // console.log(product);
    const savedCart = await cartService.addCart(userId!, product);
    console.log(savedCart);

    return res.status(200).send({
      message: "Success",
      data: savedCart,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: `${error}` });
  }
};

const getCart = async (req: IRequest, res: Response, next: Function) => {
  try {
    const carts = await cartService.getCart(req.user?.user_id as string);
    return res.status(200).send({
      message: "success",
      data: carts,
    });
  } catch (error) {
    return next(error);
  }
};

const removeCart = async (req: IRequest, res: Response, next: Function) => {
  try {
    console.log(req.body.product_id);
    const qty = parseInt(req.body.qty as string);
    const carts = await cartService.removeCart(
      req.user?.user_id as string,
      req.body.product_id,
      qty
    );
    return res.status(200).send({
      message: "success",
      data: carts,
    });
  } catch (error) {
    return next(error);
  }
};

const cart_router = (router: Router) => {
  router
    .route("/")
    .post(authenticationToken, addCart)
    .get(authenticationToken, getCart)
    .delete(authenticationToken, removeCart);
  router.route("/:id").get(authenticationToken, getCart);
};

export default cart_router;
