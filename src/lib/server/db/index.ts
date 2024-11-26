// import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import { env } from '$env/dynamic/private';

if (!env.DATABASE_URL) throw new Error('DATABASE_URL is not set');
const client = postgres(env.DATABASE_URL);
import fs from 'fs';
// export const db = drizzle(client)
let script =  fs.readFileSync('./src/lib/server/db/sql/DROPUcabAir.sql',{encoding: "utf-8" });
console.log(script);
await client.unsafe(script);
script =  fs.readFileSync('./src/lib/server/db/sql/CREATEUcabAir.sql',{encoding: "utf-8" });
await client.unsafe(script);
script = fs.readFileSync('./src/lib/server/db/sql/ALTERUcabAir.sql', { encoding: 'utf-8' });
await client.unsafe(script);
export const dbPostgre= client;
