import express from "express";
import slider_router from "../../controllers/slider.controller";

const sliderRoutes: express.Router = express.Router();

slider_router(sliderRoutes);

export default sliderRoutes;
