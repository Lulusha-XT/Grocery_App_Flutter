import {
  Category,
  CategoryDocument,
  ICategoryType,
} from "../models/category.model";
import { ObjectId } from "mongodb";
import path from "path";
import fs from "fs-extra";
import { Categorys, paramsCategory } from "../types/category.types";
import MONGO_DB_CONFIG from "../config/app.config";
import { FilterQuery } from "mongoose";

export const getAllCategories = async (
  params: any
): Promise<ICategoryType[]> => {
  // try {
  //   const categories = await Category.find().lean();
  //   return categories;
  // }
  try {
    const category_name = params.category_name;
    const category_id = params.category_id;
    let condition: FilterQuery<any> = {};

    // if (category_id) {
    //   condition["category_id"] = category_id;
    // }
    condition = category_id ? category_id : {};
    condition = category_name
      ? {
          category_name: { $regex: new RegExp(category_name), $options: "i" },
        }
      : {};

    let perPage = Math.abs(params.pageSize) || MONGO_DB_CONFIG.PAGE_SIZE;
    let page = (Math.abs(params.page) || 1) - 1;

    const categories = await Category.find(
      condition,
      "category_name category_image"
    )
      .limit(perPage)
      .skip(perPage * page);

    return categories;
  } catch (err: any) {
    throw new Error(`Error retrieving categories: ${err.message}`);
  }
};

export const getCategoryById = async (id: string): Promise<ICategoryType> => {
  try {
    const category = await Category.findById(id).lean();
    if (!category) throw "Not Found Category With id" + id;
    else return category;
  } catch (err: any) {
    throw new Error(`Error retrieving category with id ${id}: ${err.message}`);
  }
};

export const createCategory = async (
  model: Categorys
): Promise<ICategoryType> => {
  try {
    const newCategory = new Category(model);
    const savedCategory = await newCategory.save();
    return savedCategory;
  } catch (err: any) {
    throw new Error(`Error creating category: ${err.message}`);
  }
};

export const updateCategoryById = async (
  id: string,
  category_name: string,
  category_description: string
): Promise<ICategoryType> => {
  try {
    const updatedCategory = await Category.findByIdAndUpdate(
      id,
      {
        category_name,
        category_description,
      },
      { new: true }
    ).lean();
    if (!updatedCategory) throw "Not Found Category With id" + id;
    else return updatedCategory;
  } catch (err: any) {
    throw new Error(`Error updating category with id ${id}: ${err.message}`);
  }
};

export const deleteCategoryById = async (
  id: string
): Promise<ICategoryType> => {
  try {
    const category = await Category.findByIdAndDelete(id).lean();
    if (category) {
      console.log(path.resolve(category.category_image));
      const exist = await fs.pathExists(path.resolve(category.category_image));
      if (exist) await fs.unlink(path.resolve(category.category_image));
    }
    if (!category) throw "Not Found Category With id" + id;
    else return category;
  } catch (err: any) {
    throw new Error(`Error deleting category with id ${id}: ${err.message}`);
  }
};
