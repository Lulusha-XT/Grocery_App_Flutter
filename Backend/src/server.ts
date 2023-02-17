import express from "express";
import morgan from "morgan";
import path from "path";
import indexRoutes from "./routes/index";
import connectDB from "./config/db.conn";
import errorHandler from "./middleware/error";

// Initializations
const app = express();

// Settings
app.set("port", process.env.PORT || 4000);

// Middlewares
app.use(morgan("dev"));
app.use(express.json());

// Routes
app.use("/api", indexRoutes);

// Error Handler
app.use(errorHandler);

// app.get("/api", (req, res) => {
//   res.send("API WORKING !!");
// });

// Public
app.use("/uploads", express.static(path.resolve("uploads")));

(async () => {
  try {
    await connectDB();
    app.listen(app.get("port"));
    console.log(`Server on port ${app.get("port")}`);
  } catch (e) {
    console.log(e);
  }
})();
