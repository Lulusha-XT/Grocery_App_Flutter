import mongoose, { Schema, Document, Model } from "mongoose";

interface IUser {
  full_name: string;
  email: string;
  password: string;
  token?: string;
}

interface IUserDocument extends IUser, Document {
  user_id: string;
  token: string;
}

const userSchema = new Schema<IUserDocument>(
  {
    full_name: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    password: { type: String, required: true },
    token: { type: String },
  },

  {
    toJSON: {
      transform: (doc, ret) => {
        ret.user_id = ret._id.toString();
        delete ret._id;
        delete ret.__v;
        delete ret.password;
      },
    },
  }
);

const User: Model<IUserDocument> = mongoose.model<IUserDocument>(
  "User",
  userSchema
);

export { IUser, IUserDocument, User };
