import express from "express";
import cart_router from "../../controllers/cart.controller";

const cartRoutes = express.Router();

cart_router(cartRoutes);

export default cartRoutes;
