import MONGO_DB_CONFIG from "../config/app.config";
import { Slider, SliderDocument, ISliderType } from "../models/slider.model";
import fs from "fs-extra";
import path from "path";

export const createSlider = async (
  slider: ISliderType
): Promise<SliderDocument> => {
  try {
    if (!slider.slider_name) {
      throw new Error("Slider name is required");
    }

    const newSlider = new Slider(Slider);
    const savedSlider = await newSlider.save();
    return savedSlider as SliderDocument;
  } catch (error: any) {
    throw new Error(`Error creating product  ${error.message}`);
  }
};

export const getAllSliders = async (
  params: SliderParams
): Promise<SliderDocument> => {
  try {
    const slider_name = params.slider_name;
    let condition = slider_name
      ? { slider_name: { $regex: new RegExp(slider_name), $option: "i" } }
      : {};

    let perPage = Math.abs(params.page_size) || MONGO_DB_CONFIG.PAGE_SIZE;
    let page = (Math.abs(params.page) || 1) - 1;

    const sliders = await Slider.find(condition, "slider_name slider_image")
      .limit(perPage)
      .skip(perPage * page);

    return sliders as unknown as SliderDocument;
  } catch (error: any) {
    throw new Error(`Error retriving sliders ${error.message}`);
  }
};

export const getSliderById = async (id: string): Promise<SliderDocument> => {
  try {
    const slider = await Slider.findById(id).lean();
    if (!slider) throw "not Found slider with" + id;
    else return slider;
  } catch (error: any) {
    throw new Error(`Error retriving slider with id ${id}: ${error.message}`);
  }
};

export const updateSlider = async (
  id: string,
  slider_name: string,
  slider_description: string
): Promise<SliderDocument> => {
  try {
    const updateSlider = await Slider.findByIdAndUpdate(
      id,
      {
        slider_name,
        slider_description,
      },
      { new: true }
    ).lean();
    if (updateSlider) throw "Not found slider with id " + id;
    else return updateSlider as unknown as SliderDocument;
  } catch (error: any) {
    throw new Error(`Error updating slider with id ${id}: ${error.message}`);
  }
};

export const delleteSlider = async (id: string): Promise<SliderDocument> => {
  try {
    const slider = await Slider.findByIdAndDelete(id).lean();
    if (slider && slider.slider_image) {
      const exist = await fs.pathExists(path.resolve(slider.slider_image));
      if (exist) await fs.unlink(path.resolve(slider.slider_image));
    }
    if (!slider) throw "Not Found Slider with id " + id;
    else return slider;
  } catch (error: any) {
    throw new Error(`Error deleting category with id ${id}: ${error.message}`);
  }
};
