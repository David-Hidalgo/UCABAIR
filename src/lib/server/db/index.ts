// import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import { env } from '$env/dynamic/private';

if (!env.DATABASE_URL) throw new Error('DATABASE_URL is not set');
const client = postgres(env.DATABASE_URL);
import fs from 'fs';
// export const db = drizzle(client)
let script =  fs.readFileSync('./src/lib/server/db/sql/DROPUcabAir.sql',{encoding: "utf-8" });
try {
    console.log(script);
    await client.unsafe(script);
    console.log('dropped');
} catch (error) {
    console.error('error:', error);
    console.log("cagaron \n\n\n\n");
    
}
script =  fs.readFileSync('./src/lib/server/db/sql/CREATEUcabAir.sql',{encoding: "utf-8" });
await client.unsafe(script);
console.log('created');
script = fs.readFileSync('./src/lib/server/db/sql/ALTERUcabAir.sql', { encoding: 'utf-8' });
await client.unsafe(script);
console.log('altered');
script = fs.readFileSync('./src/lib/server/db/sql/INSERTUcabAir.sql', { encoding: 'utf-8' });
await client.unsafe(script);
console.log('inserted');


export const dbPostgre= client;
