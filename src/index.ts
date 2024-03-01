import { PrismaClient } from "@prisma/client";

import app from "./app";

const prisma = new PrismaClient();

const main = async () => {
    try {
        prisma.$connect();
    } catch (error) {
        console.error(error);
    }
}

main().catch((error) => {
    console.error(error);
}).finally(async () => {
    await prisma.$disconnect();
});

app.listen(3000);