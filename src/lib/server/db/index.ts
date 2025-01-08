import postgres from 'postgres';
import { env } from '$env/dynamic/private';

if (!env.DATABASE_URL) throw new Error('DATABASE_URL is not set');
const client = postgres(env.DATABASE_URL);
import fs from 'fs';

let script = fs.readFileSync('./src/lib/server/db/sql/DROPUcabAir.sql', { encoding: 'utf-8' });
try {
	await client.unsafe(script);
	console.log('dropped');
} catch (error) {
	console.error('error:', error);
}
script = fs.readFileSync('./src/lib/server/db/sql/CREATEUcabAir.sql', { encoding: 'utf-8' });
await client.unsafe(script);
console.log('created');
script = fs.readFileSync('./src/lib/server/db/sql/ALTERUcabAir.sql', { encoding: 'utf-8' });
await client.unsafe(script);
console.log('altered');
script = fs.readFileSync('./src/lib/server/db/sql/INSERTUcabAir.sql', { encoding: 'utf-8' });
await client.unsafe(script);
console.log('inserted');

export const dbPostgre = client;
