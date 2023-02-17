import { User, IUserDocument, IUser } from "../models/user.model";

export const creatUser = async (user: IUser): Promise<IUserDocument> => {
  try {
    const newUser = new User(user);
    await newUser.save();
    return newUser as IUserDocument;
  } catch (error) {
    throw new Error(`Could not creat user ${error}`);
  }
};
