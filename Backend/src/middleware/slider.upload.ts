import { Request, Response, NextFunction } from "express";

import multer from "multer";
import path from "path";
import { v4 } from "uuid";

const storage = multer.diskStorage({
  destination: "./uploads/sliders",
  filename: (req, file, cb) => {
    cb(null, v4() + path.extname(file.originalname));
  },
});

const fileFilter = (
  req: Request,
  file: Express.Multer.File,
  callback: Function
): void => {
  const acceptableExt = [".png", ".jpg", ".jpeg"];
  if (!acceptableExt.includes(path.extname(file.originalname))) {
    return callback(
      new Error("Only .png, .jpg and .jpeg format allowed!"),
      false
    );
  }
  const fileSize: number = parseInt(req.headers["content-length"] as string);

  if (fileSize > 1048576) {
    return callback(new Error("File Size Big"), false);
  }

  callback(null, true);
};
const uploadslider = multer({
  storage: storage,
  fileFilter: fileFilter,
  limits: {
    fileSize: 1048567,
  },
});

export default uploadslider;
