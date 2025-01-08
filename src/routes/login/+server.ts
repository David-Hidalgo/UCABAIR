import { json, error, fail, redirect } from '@sveltejs/kit';
import type { RequestEvent } from '@sveltejs/kit';
import { dbPostgre } from '$lib/server/db';
import * as auth from '$lib/server/auth.js';
import { encodeBase32LowerCase } from '@oslojs/encoding';
import { hash, verify } from '@node-rs/argon2';

// import type { RequestHandler } from './$types';

function validateUsername(username: unknown): username is string {
	return (
		typeof username === 'string' &&
		username.length >= 3 &&
		username.length <= 31 &&
		/^[a-z0-9_-]+$/.test(username)
	);
}

function validatePassword(password: unknown): password is string {
	return typeof password === 'string' && password.length >= 6 && password.length <= 255;
}

export async function POST({ request }) {
	const usuario = await request.json();
	const username = usuario.username;
	const password = usuario.password;
	console.log(usuario);

	if (!validateUsername(username)) {
		return error(400, { message: 'Invalid username' });
	}
	if (!validatePassword(password)) {
		return error(400, { message: 'Invalid password' });
	}
	console.log(' validé todo');
	// const userId = generateUserId();
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
		/*     
                const sessionToken = auth.generateSessionToken();
                //console.log('Generé token');
                const [a] = await dbPostgre`
                select codigo_usu from usuario
                where nombre_usu = ${username};`;
                // const b = a[0].codigo_usu;
                // console.log('lo que me regresó fué: \n ', a, '\n');
    
                
                const session = await auth.createSession(sessionToken, a.codigo_usu);
                auth.setSessionTokenCookie(event, sessionToken, session.expiresAt);
                */
		interface codusu {
			codigo_usu: number;
		}
		const [usuario] = await dbPostgre<
			codusu[]
		>`select codigo_usu FROM usuario where nombre_usu=${username} ORDER BY codigo_usu LIMIT 1`;
		console.log(usuario);
		return json(usuario.codigo_usu, { status: 201 });
	} catch (e) {
		console.error('el error es \n', e);
		return error(500, { message: 'An error has occurred' });
	}
	/*             switch (event.locals.user?.rol) {
                case 1:
                    return redirect(302, '/admin/HomeAdmin');
                    break;
                case 2:
                    return redirect(302, '/cliente/registro');
    
                    break;
                case 3:
                    return redirect(302, '/empleado/HomeEmpleado');
                    break;
    
                default:
                    return redirect(302, '/cliente/registro');
                    break;
            } */
}
