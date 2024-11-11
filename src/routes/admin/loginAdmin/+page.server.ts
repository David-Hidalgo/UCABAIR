import type { Action, Actions } from './$types';
import { fail } from '@sveltejs/kit';

const login: Action = async ({ request }) => {
	const data = await request.formData();
	const username = data.get('username');
	const password = data.get('password');

	if (!username || !password) {
		return fail(400, { invalid: true });
	}
	console.log(username, password);
};

export const actions: Actions = { login };
