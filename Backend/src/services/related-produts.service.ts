import { Product } from "../models/product.model";
import {
  RelatedProductModel,
  RelatedProductDocument,
  IRelatedProduct,
} from "../models/related-products.model";

export const getAllRelatedProducts = async (next: Function) => {
  try {
    const allProducts = await RelatedProductModel.find().lean();
    return allProducts;
  } catch (error) {
    return next(error);
  }
};

export const addRelatedProduct = async (
  relatedProduct: IRelatedProduct
): Promise<RelatedProductDocument> => {
  try {
    if (!relatedProduct.product) {
      throw new Error(`Product id is required`);
    }
    if (!relatedProduct.relatedProduct) {
      throw new Error(`Related Product Id Required`);
    }
    console.log(relatedProduct);
    const newRelatedProduct = new RelatedProductModel(relatedProduct);
    await newRelatedProduct.save();

    await Product.findByIdAndUpdate(
      relatedProduct.product,
      {
        $addToSet: {
          relatedProduct: newRelatedProduct._id,
        },
      },
      { new: true }
    );

    return newRelatedProduct;
  } catch (error: any) {
    throw new Error(`Error creating product ${error.message}`);
  }
};

export const removeRelatedProduct = async (id: string) => {
  try {
    const removedProduct = await RelatedProductModel.findByIdAndRemove(id);

    async () => {
      if (!removedProduct) {
        throw `Product id not found `;
      } else {
        return removedProduct;
      }
    };
  } catch (error: any) {
    throw new Error(`${error}`);
  }
};
