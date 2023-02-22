import * as relatedProductService from "../services/related-produts.service";
import { Request, Response, Router } from "express";
import { IRelatedProduct } from "../models/related-products.model";

const addRelatedProduct = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const relatedProduct: IRelatedProduct = {
      product: req.body.product,
      relatedProduct: req.body.relatedProduct,
    };
    const newRelatedProduct = await relatedProductService.addRelatedProduct(
      relatedProduct
    );
    res.json({ message: "success", data: newRelatedProduct });
  } catch (error) {
    return next(error);
  }
};

const removeRelatedProduct = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const removedRelatedProduct = relatedProductService.removeRelatedProduct(
      req.params.id
    );
    return res.status(200).send({
      message: "success",
      data: removedRelatedProduct,
    });
  } catch (error) {
    return next(error);
  }
};

// const getAllRelatedProducts = async (
//   req: Request,
//   res: Response,
//   next: Function
// ) => {
//   try {
//     const allProducts = relatedProductService.getAllRelatedProducts(next);
//     return res.status(200).send({
//       message: "success",
//       data: allProducts,
//     });
//   } catch (error) {
//     return next(error);
//   }
// };
const relatedProducts_router = (router: Router) => {
  router.route("/").post(addRelatedProduct);
  // .get(getAllRelatedProducts);
  router.route("/:id").delete(removeRelatedProduct);
};

export default relatedProducts_router;
