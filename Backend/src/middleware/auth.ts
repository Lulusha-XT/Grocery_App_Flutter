// import jwt from "jsonwebtoken";
// import express, { Request, Response } from "express";
// import MONGO_DB_CONFIG from "../config/app.config";
// import { IUser } from "../models/user.model";
// import dotenv from "dotenv";

// dotenv.config();
// const secrete: any = process.env.TOKEN_SECRET;

// interface IRequest extends Request {
//   user?: IUser;
// }
// export const verifyToken = async (
//   req: IRequest,
//   res: Response,
//   next: Function
// ) => {
//   try {
//     const authHeader: any = req.headers.authorization;
//     const token = authHeader.split(" ")[1];

//     if (!token) {
//       return res.sendStatus(403).send({message: "No Token Provided!"});
//     }

//     // const decoded = jwt.verify(token, secrete);

//     jwt.verify(token, secrete, (err: any, user: IUser) => {
//       if (err) {
//         return res.sendStatus(401).send({ message: "Unauthorized!" });
//       }
//       req.user = user as IUser;
//       next();
//     });

//     next();
//   } catch (error) {
//     res.status(401);
//     res.json("Access denied, invalid token");
//     return;
//   }
// };

// export const generateAccessToken = (userModel: IUser) => {
//   return jwt.sign({ data: userModel }, secrete, {
//     expiresIn: "1h",
//   });
// };

import { Request, Response, NextFunction } from "express";
import jwt, { Secret } from "jsonwebtoken";
import { IUser } from "../models/user.model";
import dotenv from "dotenv";

dotenv.config();
const secrete: any = process.env.TOKEN_SECRET;

interface IRequest extends Request {
  user?: IUser;
}

interface ITokenData {
  data: IUser;
}

function authenticationToken(req: IRequest, res: Response, next: NextFunction) {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];
  console.log(token);

  if (!token) {
    return res.status(403).send({ message: "No Token Provider" });
  }
  try {
    const decodedToken = jwt.verify(token, secrete as Secret) as ITokenData;
    req.user = decodedToken.data;
    next();
  } catch (err) {
    res.status(401).send({ message: "Unauthorized!" });
  }
}
function generateAccessToken(user: IUser): string {
  const tokenData: ITokenData = { data: user };
  const expiresIn = "1h";
  const secret = process.env.TOKEN_SECRET as Secret;

  return jwt.sign(tokenData, secret, { expiresIn });
}

// function generateAccessToken(user: IUser): string {
//   return jwt.sign(
//     {
//       data: user,
//     },
//     secrete,
//     {
//       expiresIn: "1h",
//     }
//   );
// }

export { authenticationToken, generateAccessToken };
