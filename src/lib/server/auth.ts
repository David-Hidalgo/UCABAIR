import type { RequestEvent } from '@sveltejs/kit';
// import { eq } from 'drizzle-orm';
import { sha256 } from '@oslojs/crypto/sha2';
import { encodeBase32LowerCase, encodeHexLowerCase } from '@oslojs/encoding';
import { dbPostgre } from '$lib/server/db';
// import * as table from '$lib/server/db/schema';
// import util from 'util';
const DAY_IN_MS = 1000 * 60 * 60 * 24;

export const sessionCookieName = 'auth-session';

export function generateSessionToken() {
	const bytes = crypto.getRandomValues(new Uint8Array(20));
	const token = encodeBase32LowerCase(bytes);
	return token;
}

export async function createSession(token: string, userId: string) {
	const sessionId = encodeHexLowerCase(sha256(new TextEncoder().encode(token)));
	const session = {
		id: sessionId,
		userId,
		expiresAt: new Date(Date.now() + DAY_IN_MS * 30)
	};

	await dbPostgre`INSERT INTO sesion (id, user_id, expires_at) VALUES (${sessionId}, ${userId}, ${session.expiresAt.toUTCString()})`;
	return session;
}

export async function validateSessionToken(token: string) {
	const sessionId = encodeHexLowerCase(sha256(new TextEncoder().encode(token)));
	const [result] =
		await dbPostgre`SELECT usuario.codigo_usu, usuario.nombre_usu, usuario.fk_rol, sesion.id, sesion.expires_at
		FROM sesion INNER JOIN usuario ON sesion.user_id = usuario.codigo_usu WHERE sesion.id = ${sessionId}`;

	if (!result) {
		return { session: null, user: null };
	}
	const session = { id: result.id, expiresAt: new Date(result.expires_at) };
	const user = { id: result.codigo_usu, username: result.nombre_usu, rol: result.fk_rol };

	const sessionExpired = Date.now() >= session.expiresAt.getTime();
	if (sessionExpired) {
		await dbPostgre`DELETE FROM sesion WHERE id = ${session.id}`;
		return { session: null, user: null };
	}

	const renewSession = Date.now() >= session.expiresAt.getTime() - DAY_IN_MS * 15;
	if (renewSession) {
		session.expiresAt = new Date(Date.now() + DAY_IN_MS * 30);

		await dbPostgre`UPDATE sesion 
			SET expires_at = ${session.expiresAt} 
			WHERE id = ${session.id}`;
	}

	return { session, user };
}

export type SessionValidationResult = Awaited<ReturnType<typeof validateSessionToken>>;

export async function invalidateSession(sessionId: string) {
	await dbPostgre`DELETE FROM sesion WHERE id = ${sessionId}`;
}

export function setSessionTokenCookie(event: RequestEvent, token: string, expiresAt: Date) {
	event.cookies.set(sessionCookieName, token, {
		expires: expiresAt,
		path: '/'
	});
}

export function deleteSessionTokenCookie(event: RequestEvent) {
	event.cookies.delete(sessionCookieName, {
		path: '/'
	});
}
