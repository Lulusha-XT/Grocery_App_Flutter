import mongoose, { Schema, Document, Model } from "mongoose";

interface IUser {
  full_name: string;
  email: string;
  password: string;
}

interface IUserDocument extends IUser, Document {}

const userSchema = new Schema<IUserDocument>(
  {
    full_name: { required: true, type: String },
    email: { required: true, type: String },
    password: { required: true, type: String },
  },

  {
    toJSON: {
      transform: (doc, ret) => {
        ret.user_id = ret.id.toString;
        delete ret._id;
        delete ret._v;
      },
    },
  }
);

const User: Model<IUserDocument> = mongoose.model<IUserDocument>(
  "user",
  userSchema
);

export { IUser, IUserDocument, User };
