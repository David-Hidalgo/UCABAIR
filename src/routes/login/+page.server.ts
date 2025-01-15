/* eslint-disable @typescript-eslint/no-unused-vars */
import { hash, verify } from '@node-rs/argon2';
import { encodeBase32LowerCase } from '@oslojs/encoding';
import { fail, redirect } from '@sveltejs/kit';
import { regExpPassword } from "$lib/index"
// import postgres from 'postgres';
//por cambiar
// import { eq } from 'drizzle-orm';
import * as auth from '$lib/server/auth';
import { dbPostgre } from '$lib/server/db';
// import * as table from '$lib/server/db/schema';
// import util from 'util';
import type { Actions, PageServerLoad } from './$types';

export const load: PageServerLoad = async (event) => {
	if (event.locals.user) {
		return redirect(302, '/');
	}
	return {};
};

export const actions: Actions = {
	login: async (event) => {
		const formData = await event.request.formData();
		const username = formData.get('username');
		const password = formData.get('password');

		if (!validateUsername(username)) {
			return fail(400, { message: 'Invalid username' });
		}
		if (!validatePasswordLog(password)) {
			return fail(400, { message: 'Invalid password' });
		}

		const results =
			// await db.select().from(table.user).where(eq(table.user.username, username));
			await dbPostgre`
			select * from usuario
			where nombre_usu = ${username};
		`;

		console.log('results: \n', results);
		let validPassword = false;
		if (results.length == 0) {
			console.log('No existe el usuario');
			return fail(400, { message: 'Username does not exist' });
		}
		for (let index = 0; index < results.length; index++) {
			const existingUser = results[index];
			if (!existingUser || results.length == 0) {
				console.log('No existe el usuario');
				return fail(400, { message: 'Username does not exist' });
			}

			validPassword = await verify(existingUser.contraseña_usu, password, {
				memoryCost: 19456,
				timeCost: 2,
				outputLen: 32,
				parallelism: 1
			});

			if (validPassword) {
				const sessionToken = auth.generateSessionToken();

				const session = await auth.createSession(sessionToken, existingUser.codigo_usu);
				auth.setSessionTokenCookie(event, sessionToken, session.expiresAt);
				const { user } = await auth.validateSessionToken(sessionToken);
				console.log(user?.rol);

				switch (user?.rol) {
					case 1:
						return redirect(302, '/admin/HomeAdmin');
						break;
					case 2:
						return redirect(302, '/cliente/Home');

						break;
					case 3:
						return redirect(302, '/empleado/HomeEmpleado');
						break;

					default:
						return redirect(302, '/cliente/Home');
						break;
				}
			} else {
				console.log('Contraseña incorrecta');
				return fail(400, { message: 'Incorrect username or password' });
			}
		}
	},
	register: async (event) => {
		const formData = await event.request.formData();
		const username = formData.get('username');
		const password = formData.get('password');

		if (!validateUsername(username)) {
			return fail(400, { message: 'Invalid username' });
		}
		if (!validatePassword(password)) {
			return fail(400, { message: 'Invalid password' });
		}

		console.log(' validé todo');
		let userId = generateUserId();
		const passwordHash = await hash(password, {
			// recommended minimum parameters
			memoryCost: 19456,
			timeCost: 2,
			outputLen: 32,
			parallelism: 1
		});

		console.log(' generé userId y passwordHash');
		try {
			// await db.insert(table.user).values({ id: userId, username, passwordHash });
			//console.log(' entré al try los valores son: ', username, passwordHash);
			await dbPostgre`CALL insertar_usuario(${username}, ${passwordHash})`;
			//console.log('Hice el call');

			const sessionToken = auth.generateSessionToken();
			//console.log('Generé token');
			const [a] = await dbPostgre`
			select codigo_usu from usuario
			where nombre_usu = ${username};`;
			// const b = a[0].codigo_usu;
			// console.log('lo que me regresó fué: \n ', a, '\n');
			console.log('el codigo del usuario es: ', a.codigo_usu);
			userId = a.codigo_usu;
			/*  */
			const session = await auth.createSession(sessionToken, a.codigo_usu);
			auth.setSessionTokenCookie(event, sessionToken, session.expiresAt);
		} catch (e) {
			console.error('el error es \n', e);
			return fail(500, { message: 'An error has occurred' });
		}
		switch (event.locals.user?.rol) {
			case 1:
				return redirect(302, '/admin/HomeAdmin');
				break;
			case 2:
				return redirect(302, `/cliente/registro?codigo=${userId}`);

				break;
			case 3:
				return redirect(302, '/empleado/HomeEmpleado');
				break;

			default:
				return redirect(302, `/cliente/registro?codigo=${userId}`);
				break;
		}
	}
};

function generateUserId() {
	// ID with 120 bits of entropy, or about the same as UUID v4.
	const bytes = crypto.getRandomValues(new Uint8Array(15));
	const id = encodeBase32LowerCase(bytes);
	return id;
}

function validateUsername(username: unknown): username is string {
	return (
		typeof username === 'string' &&
		username.length >= 3 &&
		username.length <= 31 &&
		/^[a-z0-9_-]+$/i.test(username)
	);
}

function validatePasswordLog(password: unknown): password is string {
	return typeof password === 'string' && password.length >= 6 && password.length <= 255 ;

}
function validatePassword(password: unknown): password is string {
	return typeof password === 'string' && password.length >= 6 && password.length <= 255 && regExpPassword.test(password);

}
