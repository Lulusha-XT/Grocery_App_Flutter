import express from "express";
import product_router from "../../controllers/product.controller";

const productRoutes: express.Router = express.Router();

product_router(productRoutes);

export default productRoutes;
