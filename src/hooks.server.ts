import type { Handle } from '@sveltejs/kit';
import * as auth from '$lib/server/auth.js';

const handleAuth: Handle = async ({ event, resolve }) => {
	const sessionToken = event.cookies.get(auth.sessionCookieName);
	if (!sessionToken) {
		event.locals.user = null;
		event.locals.session = null;
		return resolve(event);
	}

	const { session, user } = await auth.validateSessionToken(sessionToken);
	if (session) {
		auth.setSessionTokenCookie(event, sessionToken, session.expiresAt);
	} else {
		auth.deleteSessionTokenCookie(event);
	}

	event.locals.user = user;
	event.locals.session = session;
	if (
		event.url.pathname.startsWith('/admin') &&
		!event.url.pathname.startsWith('/admin/HomeAdmin/registrar/cliente') &&
		!event.url.pathname.startsWith('/admin/HomeAdmin/registrar/telefono') &&
		!event.url.pathname.startsWith('/admin/HomeAdmin/registrar/correo')
	) {
		if (user?.rol != 1) {
			return new Response('Unauthorized', { status: 401 });
		}
	}
	return resolve(event);
};

export const handle: Handle = handleAuth;
