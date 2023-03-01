import {
  CartModel,
  ICart,
  ICartDocument,
  ICartItem,
} from "../models/cart.model";

export const addCart = async (
  userId: string,
  products: ICartItem
): Promise<ICartDocument> => {
  console.log(products);
  try {
    const cart = await CartModel.findOne({ userId });

    if (cart && products && products.product) {
      // if cart already exists, find if product is already present
      const existingProductIndex = cart.products.findIndex(
        (item) => item.product.toString() === products.product.toString()
      );
      // console.log(existingProductIndex);
      if (existingProductIndex !== -1) {
        // if product already exists in cart, update its quantity
        cart.products[existingProductIndex].qty += products.qty;
      } else {
        // if product does not exist in cart, add it
        cart.products.push(products);
      }
      const cartItem = await cart.save();
      return cartItem as ICartDocument;
    } else {
      console.log("hi");
      console.log(products);
      // if cart does not exist, create a new one
      const newCart = new CartModel({
        userId,
        products: [products],
      });

      return await newCart.save();
    }
  } catch (error) {
    throw new Error(`Could not add product to cart: ${error}`);
  }
};

export const getCart = async (id: string): Promise<ICartDocument> => {
  try {
    console.log(id);
    const allCart = await CartModel.findOne({ user_id: id })
      .populate({
        path: "products",
        populate: {
          path: "product",
          model: "Product",
          select: "product_name product_price product_sale_price product_image",
          populate: {
            path: "category",
            model: "Category",
            select: "category_name",
          },
        },
      })
      .lean();
    if (allCart) {
      // Convert cart._id to cartId
      const cartId = allCart._id.toString();

      // Add cartId property to the cart object
      const cartWithId = { ...allCart, cartId };

      return cartWithId as ICartDocument;
    } else {
      throw new Error("Cart not found");
    }
  } catch (error: any) {
    throw new Error(error.message);
  }
};

// export const removeCartItem = async (id: string) => {
//     try {
//         if (id) {

//         }
//     } catch (error) {

//     }
// }

export const removeCart = async (
  userId: string,
  productId: string,
  qty: number
): Promise<ICart> => {
  const cart = await CartModel.findOne({ userId }).exec();
  try {
    if (cart) {
      // Check if the product is in the cart
      const productIndex = cart.products.findIndex(
        (item) => item.product.toString() === productId
      );
      if (productIndex !== -1) {
        // If the product is in the cart, decrease the quantity by 1
        if (
          cart.products[productIndex].qty > 1 &&
          cart.products[productIndex].qty >= qty
        ) {
          cart.products[productIndex].qty -= qty;
        } else {
          // If the quantity is 1, remove the product from the cart
          cart.products.splice(productIndex, 1);
        }
        await cart.save();
        return cart;
      } else {
        // If the product is not in the cart, return the current cart
        return cart;
      }
    } else {
      throw new Error(`Empty cart`);
    }
  } catch (err) {
    throw new Error(`Could not remove product`);
  }
};
