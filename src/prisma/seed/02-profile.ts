import { Prisma, PrismaClient } from '@prisma/client';

export const profiles: Prisma.ProfileCreateInput[] = [
  {
    Title: 'marcusvinysilva',
    ImageURL: 'https://avatars.githubusercontent.com/u/71359413?v=4.png',
  },
];

export const profile = async (prisma: PrismaClient) => {
  for (const obj of Object.values(profiles)) {
    await prisma.profile.upsert({
      where: { Title: obj.Title },
      update: {},
      create: {
        ...obj,
      },
    });
  }
};
