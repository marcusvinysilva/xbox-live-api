import { Prisma, PrismaClient } from '@prisma/client';
import * as bcrypt from 'bcrypt';

export const users: Prisma.UserCreateInput[] = [
  {
    Name: 'Marcus Silva',
    Email: 'marcus.silva@gmail.com',
    Password: 'Abcd@1234',
    CPF: '45272096045',
  },
];

export const user = async (prisma: PrismaClient) => {
  for (const obj of Object.values(users)) {
    await prisma.user.upsert({
      where: { Email: obj.Email },
      update: {},
      create: {
        ...obj,
        Password: await bcrypt.hash(obj.Password, 10),
      },
    });
  }
};
