import express, { Request, Response, Router } from "express";
import uploads from "../middleware/category.upload";
import { Categorys, paramsCategory } from "../types/category.types";
import * as categoryService from "../services/categories.services";

const getAllCategories = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const params: any = {
      category_name: req.query.category_name as string,
      pageSize: parseInt(req.query.pageSize as string),
      page: parseInt(req.query.page as string),
    };
    const categories = await categoryService.getAllCategories(params);
    return res.json({ message: "Success", data: categories });
  } catch (error) {
    return next(error);
  }
};

const getCategoryById = async (req: Request, res: Response, next: Function) => {
  try {
    console.log(req.params.id);
    const category = await categoryService.getCategoryById(req.params.id);
    console.log(category);
    return res.json({ message: "Success", data: category });
  } catch (error) {
    return next(error);
  }
};

const createCategory = async (req: Request, res: Response, next: Function) => {
  try {
    const { category_name, category_description } = req.body;
    console.log(`${category_name}`);
    const path =
      req.file?.path != undefined ? req.file.path.replace(/\\/g, "/") : "";
    console.log(`${path}`);

    const model: Categorys = {
      category_name: category_name,
      category_description: category_description,
      category_image: path,
    };

    const savedCategory = await categoryService.createCategory(model);
    return res.json({
      message: "Success",
      category: savedCategory,
    });
  } catch (error) {
    return next(error);
  }
};

const updateCategoryById = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const { id } = req.params;
    const { category_name, category_description } = req.body;
    const updatedCategory = await categoryService.updateCategoryById(
      id,
      category_name,
      category_description
    );
    return res.json({
      message: "Success",
      category: updatedCategory,
    });
  } catch (error) {
    return next(error);
  }
};

const deleteCategoryById = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const category = await categoryService.deleteCategoryById(req.params.id);
    console.log(category);
    if (category) {
      return res.json({ message: "Category deleted", category });
    } else {
      return res.json({ message: "Category not found" });
    }
  } catch (error) {
    return next(error);
  }
};

const category_router = (router: Router) => {
  router
    .route("/")
    .get(getAllCategories)
    .post(uploads.single("image"), createCategory);

  router
    .route("/:id")
    .get(getCategoryById)
    .delete(deleteCategoryById)
    .put(updateCategoryById);
};

export default category_router;
