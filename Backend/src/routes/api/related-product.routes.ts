import express from "express";
import relatedProducts_router from "../../controllers/related-product.controller";

const relatedProductRoutets = express.Router();

relatedProducts_router(relatedProductRoutets);

export default relatedProductRoutets;
