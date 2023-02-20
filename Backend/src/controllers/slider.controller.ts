import express, { Request, Response, Router } from "express";

import { ISliderType } from "../models/slider.model";
import * as sliderService from "../services/slider.service";
import upload from "../middleware/category.upload";
import router from "../routes";
import uploadProduct from "../middleware/product.upload";

const createSlider = async (req: Request, res: Response, next: Function) => {
  try {
    const path =
      req.file?.path != undefined ? req.file.path.replace(/\\/g, "/") : "";
    const slider: ISliderType = {
      slider_name: req.body.slider_name,
      slider_url: req.body.slider_url,
      slider_image: path,
      slider_description: req.body.slider_description,
    };

    const savedSlider = await sliderService.createSlider(slider);
    return res.json({
      message: "Success",
      slider: savedSlider,
    });
  } catch (error) {
    return next(error);
  }
};

const getAllSliders = async (req: Request, res: Response, next: Function) => {
  try {
    const params: SliderParams = {
      slider_name: req.query.slider_name as string,
      page_size: parseInt(req.query.page_size as string),
      page: parseInt(req.query.page as string),
    };

    const slider = await sliderService.getAllSliders(params);
    return res.json({
      message: "succes",
      data: slider,
    });
  } catch (error) {
    return next(error);
  }
};

const getSlidersById = async (req: Request, res: Response, next: Function) => {
  try {
    const slider = await sliderService.getAllSliders(req.body.id);
    return res.json({
      message: "succes",
      data: slider,
    });
  } catch (error) {
    return next(error);
  }
};

const updateSliderById = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const slider = await sliderService.getAllSliders(req.body.id);
    return res.json({
      message: "succes",
      data: slider,
    });
  } catch (error) {
    return next(error);
  }
};

const deleteSliderById = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const slider = await sliderService.getAllSliders(req.body.id);
    return res.json({
      message: "succes",
      data: slider,
    });
  } catch (error) {
    return next(error);
  }
};

const slider_router = (router: Router) => {
  router
    .route("/")
    .post(uploadProduct.single("image"), createSlider)
    .get(getAllSliders);
  router
    .route("/:id")
    .get(getSlidersById)
    .delete(deleteSliderById)
    .put(updateSliderById);
};

export default slider_router;
