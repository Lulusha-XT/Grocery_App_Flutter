import { Request, Response, NextFunction } from "express";

import multer from "multer";
import path from "path";
import { v4 } from "uuid";

const storage = multer.diskStorage({
  destination: "./uploads/sliders",
  filename: (req, file) => {
    const modifiedPath = v4() + path.extname(file.originalname);
    return modifiedPath;
  },
});

const fileFilter = (req: Request, file: Express.Multer.File): boolean => {
  const acceptableExt = [".png", ".jpg", ".jpeg"];
  if (!acceptableExt.includes(path.extname(file.originalname))) {
    throw new Error("Only .png, .jpg and .jpeg format allowed!");
  }

  const fileSize: number = parseInt(req.headers["content-length"] as string);
  if (fileSize > 1048567) {
    throw new Error("File Size Big");
  }

  return true;
};

const uploadslider = multer({
  storage: storage,
  fileFilter: fileFilter,
  limits: {
    fileSize: 1048567,
  },
});

export default uploadslider;
