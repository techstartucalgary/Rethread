export type PrismaProduct = {
  id: string;
  title: string;
  size: string;
  color: string;
  description: string;
  gender: string;
  category: string;
  price: number;
  imageUrl: string;
  createdAt: Date;
  updatedAt: Date;
};

export type PrismaProducts = PrismaProduct[];

export type Tag = {
  material: string;
  percentage: string;
};
