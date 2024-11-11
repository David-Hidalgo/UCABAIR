<script>
	import { page } from '$app/stores';
	import Editar from '$lib/components/configurarProyecto.svelte';
	let id_editar = Number($page.params.index);
</script>

<body>
	<div class="ConfigurarProyecto">
		<Editar bind:id_editar />
	</div>
</body>
