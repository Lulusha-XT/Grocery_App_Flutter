import express, { Router } from "express";
import categoryRoutes from "./api/category.api";
import productRoutes from "./api/product.api";
import relatedProductRoutets from "./api/related-product.routes";
import sliderRoutes from "./api/slider.rout";
import userRoutes from "./api/user.api";
const router: express.Router = express.Router();
router.use("/category", categoryRoutes);
router.use("/product", productRoutes);
router.use("/user", userRoutes);
router.use("/slider", sliderRoutes);
router.use("/relatedProducts", relatedProductRoutets);
// router.get("/category", (req, res) => {
//   res.send("CAtegory WORKING !!");
// });
export default router;
