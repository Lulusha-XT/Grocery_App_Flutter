const MONGO_DB_CONFIG = {
  DB: "mongodb+srv://lulusha:21191921@cluster0.szudsvc.mongodb.net/?retryWrites=true&w=majority",
  PAGE_SIZE: 10,
  BCRYPT_PASSWORD: "Grocery App",
  SALT_ROUND: 10,
  TOKEN_SECRET: 2119,
};

const STRIPE_CONFIG = {
  STRIPE_KEY: "sk_test",
  CURRENCY: "birr",
};

export default MONGO_DB_CONFIG;
