export interface Categorys {
  category_name: String;
  category_description: String;
  category_image: String | undefined;
}

export interface paramsCategory {
  category_name: string;
  pageSize: number;
  page: number;
}
