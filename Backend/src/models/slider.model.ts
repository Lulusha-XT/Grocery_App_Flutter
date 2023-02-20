import mongoose, { Model, Document, Schema } from "mongoose";

interface ISliderType {
  slider_name: string;
  slider_description: string;
  slider_url: string;
  slider_image: string;
}

interface SliderDocument extends Document, ISliderType {}

const sliderScheam = new Schema<SliderDocument>(
  {
    slider_name: { required: true, unique: true, type: String },
    slider_description: { type: String },
    slider_url: { type: String },
    slider_image: { required: true, type: String },
  },

  {
    toJSON: {
      transform: (doc, ret) => {
        ret.slider_id = ret._id.toString();
        delete ret._id;
        delete ret.__v;
      },
    },
  }
);

const Slider: Model<SliderDocument> = mongoose.model<SliderDocument>(
  "Slider",
  sliderScheam
);
export { Slider, SliderDocument, ISliderType };
