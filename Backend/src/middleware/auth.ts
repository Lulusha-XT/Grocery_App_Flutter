import jwt from "jsonwebtoken";
import express, { Request, Response } from "express";
import MONGO_DB_CONFIG from "../config/app.config";
import { IUser } from "../models/user.model";
import dotenv from "dotenv";

dotenv.config();
const secrete: any = process.env.TOKEN_SECRET;
export const verifyToken = async (
  req: Request,
  res: Response,
  next: Function
) => {
  try {
    const authHeader: any = req.headers.authorization;
    const token = authHeader.split(" ")[1];

    if (!token) {
      return res.sendStatus(400);
    }

    const decoded = jwt.verify(token, secrete);
    next();
  } catch (error) {
    res.status(401);
    res.json("Access denied, invalid token");
    return;
  }
};

export const generateAccessToken = (userModel: IUser) => {
  return jwt.sign({ data: userModel }, secrete, {
    expiresIn: "1h",
  });
};
