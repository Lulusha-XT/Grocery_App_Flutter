import express, { Router } from "express";
import categoryRoutes from "./api/category.api";
import productRoutes from "./api/product.api";
const router: express.Router = express.Router();
router.use("/category", categoryRoutes);
router.use("/product", productRoutes);
// router.get("/category", (req, res) => {
//   res.send("CAtegory WORKING !!");
// });
export default router;
