<script lang="ts">
	import type { ActionData, PageData, PageLoad } from './$types';
	import { enhance } from '$app/forms';
	import type { SvelteURL } from 'svelte/reactivity';

	let { data, form }: { data: PageData; form: ActionData } = $props();


</script>

<form method="POST" action="?/PlanAvion" use:enhance>
	{#if form?.missing}<p class="error">The email field is required</p>{/if}
	{#if form?.incorrect}<p class="error">Invalid credentials!</p>{/if}
	<label>
		Email
		<input name="email" type="email" value={form?.email ?? ''} />
	</label>
	<label>
		Password
		<input name="password" type="password" />
	</label>
	<button>Log in</button>
	<button formaction="?/register">Register</button>
</form>
