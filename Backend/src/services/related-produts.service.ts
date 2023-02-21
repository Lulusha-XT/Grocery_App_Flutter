import {
  RelatedProduct,
  RelatedProductDocument,
  IRelatedProduct,
} from "../models/related-products.model";
import {
  Product,
  ProductDocument,
  IProductType,
} from "../models/product.model";

const addRelatedProduct = async (
  params: IRelatedProduct
): Promise<RelatedProductDocument> => {
  try {
    if (!params.product) {
      throw `Product id is required`;
    }
    if (!params.relatedProduct) {
      throw `Related Product Id Required`;
    }

    const newRelatedProduct = new RelatedProduct(params);
    const savedRelatedProduct = await newRelatedProduct.save();
    const respons = async (response) => {
        await RelatedProduct.findOneAndUpdate(
            {
                _id: params.product
            },
            {
                $addToSet: {
                    "relatedProduct"
                }
            }
        )
    }
  } catch (error: any) {
    throw new Error(`Error creating product ${error.message}`);
  }
};
