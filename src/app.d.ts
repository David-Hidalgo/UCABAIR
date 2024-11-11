// See https://svelte.dev/docs/kit/types#app.d.ts
// for information about these interfaces
declare global {
	// biome-ignore lint/style/noNamespace: <explanation>
	namespace App {
		interface Locals {
			user: import('$lib/server/auth').SessionValidationResult['user'];
			session: import('$lib/server/auth').SessionValidationResult['session'];
		}
	}
}

export {};
