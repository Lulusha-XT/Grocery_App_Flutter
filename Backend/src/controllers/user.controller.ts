import { Request, Response, Router } from "express";
import * as userService from "../services/user.service";
import bcrypt from "bcrypt";
import MONGO_DB_CONFIG from "../config/app.config";
import { IUser } from "../models/user.model";

const createUser = async (req: Request, res: Response, next: Function) => {
  console.log(`${req.body.full_name}`);
  try {
    const user: IUser = {
      full_name: req.body.full_name,
      email: req.body.email,
      password: req.body.password,
      stripeCustomerID: "",
    };

    const newUser = await userService.creatUser(user);
    return res.json({ message: "Success", data: newUser });
  } catch (error) {
    return next(error);
  }
};

const getAllUser = async (req: Request, res: Response, next: Function) => {
  try {
    const allUser = await userService.getAllUser({
      page: req.query.page?.toString(),
      pageSize: req.query.pageSize?.toString(),
    });
    return res.json({ message: "Success", data: allUser });
  } catch (error) {
    return next(error);
  }
};

const userLogin = async (req: Request, res: Response, next: Function) => {
  try {
    const { email, password } = req.body;
    const token = await userService.login(email, password);
    if (token) {
      res.json({ message: "Success", data: token });
    } else {
      res
        .status(401)
        .json({ message: "error", error: `Invalid email or password` });
    }
  } catch (error) {
    res.status(500).json({ message: "error", error: `${error}` });
  }
};

const userDelete = async (req: Request, res: Response, next: Function) => {
  try {
    const id = req.params.id;
    const deletedUser = await userService.deleteUser(id);
    res.json(deletedUser);
  } catch (error) {
    return next(error);
  }
};

const user_routes = (router: Router) => {
  router.route("/").get(getAllUser);
  router.route("/register").post(createUser);
  router.route("/login").post(userLogin);
  router.route("/:id").delete(userDelete);
};

export default user_routes;
