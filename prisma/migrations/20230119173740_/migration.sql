-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL,
    "Name" TEXT NOT NULL,
    "Email" TEXT NOT NULL,
    "Password" TEXT NOT NULL,
    "CPF" TEXT NOT NULL,
    "isAdmin" BOOLEAN,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profile" (
    "id" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "ImageURL" TEXT NOT NULL,
    "user_id" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "profile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "game" (
    "id" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "CoverImageUrl" TEXT NOT NULL,
    "Description" TEXT NOT NULL,
    "Year" INTEGER NOT NULL,
    "ImdbScore" DOUBLE PRECISION NOT NULL,
    "TrailerYouTubeUrl" TEXT NOT NULL,
    "GameplayYouTubeUrl" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "game_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "genre" (
    "id" TEXT NOT NULL,
    "Name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "genre_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "homepage" (
    "id" TEXT NOT NULL,
    "game_id" TEXT,
    "profile_id" TEXT,
    "is_favorite" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "homepage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_GameToGenre" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "user_Email_key" ON "user"("Email");

-- CreateIndex
CREATE UNIQUE INDEX "user_CPF_key" ON "user"("CPF");

-- CreateIndex
CREATE UNIQUE INDEX "profile_Title_key" ON "profile"("Title");

-- CreateIndex
CREATE UNIQUE INDEX "game_Title_key" ON "game"("Title");

-- CreateIndex
CREATE UNIQUE INDEX "game_CoverImageUrl_key" ON "game"("CoverImageUrl");

-- CreateIndex
CREATE UNIQUE INDEX "game_Description_key" ON "game"("Description");

-- CreateIndex
CREATE UNIQUE INDEX "game_TrailerYouTubeUrl_key" ON "game"("TrailerYouTubeUrl");

-- CreateIndex
CREATE UNIQUE INDEX "game_GameplayYouTubeUrl_key" ON "game"("GameplayYouTubeUrl");

-- CreateIndex
CREATE UNIQUE INDEX "genre_Name_key" ON "genre"("Name");

-- CreateIndex
CREATE UNIQUE INDEX "homepage_profile_id_game_id_key" ON "homepage"("profile_id", "game_id");

-- CreateIndex
CREATE UNIQUE INDEX "_GameToGenre_AB_unique" ON "_GameToGenre"("A", "B");

-- CreateIndex
CREATE INDEX "_GameToGenre_B_index" ON "_GameToGenre"("B");

-- AddForeignKey
ALTER TABLE "profile" ADD CONSTRAINT "profile_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "homepage" ADD CONSTRAINT "homepage_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profile"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "homepage" ADD CONSTRAINT "homepage_game_id_fkey" FOREIGN KEY ("game_id") REFERENCES "game"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGenre" ADD CONSTRAINT "_GameToGenre_A_fkey" FOREIGN KEY ("A") REFERENCES "game"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_GameToGenre" ADD CONSTRAINT "_GameToGenre_B_fkey" FOREIGN KEY ("B") REFERENCES "genre"("id") ON DELETE CASCADE ON UPDATE CASCADE;
