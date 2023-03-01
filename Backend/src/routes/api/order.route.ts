import express from "express";
import order_router from "../../controllers/order.controller";

const orderRouter = express.Router();

order_router(orderRouter);

export default orderRouter;
