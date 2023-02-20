import mongoose, { Model, mongo, Schema } from "mongoose";
import { Products } from "../types/product.type";
interface ISliderType {
  slider_name: string;
  slider_description: string;
  slider_url: string;
  slider_image: string;
}

interface SliderDocument extends Document, ISliderType {}

const productScheam = new Schema(
  {
    slider_name: { requireed: true, type: String },
    slider_description: { type: String },
    slider_url: { type: String },
    slider_image: { required: true, unique: true, type: String },
  },

  {
    toJSON: {
      transform: function (doc, ret) {
        ret.slider_id = ret._id.toString();
        delete ret._id;
        delete ret.__v;
      },
    },
  }
);

const Slider: Model<SliderDocument> = mongoose.model<SliderDocument>(
  "Product",
  productScheam
);
export { Slider, SliderDocument, ISliderType };
