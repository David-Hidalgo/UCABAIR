<script>
	import ConfigurarProyecto from '$lib/components/configurarProyecto.svelte';
</script>

<div class="ConfigurarEtapa">
	<ConfigurarProyecto />
	<a href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa">
		<button>Configurar Etapa</button>
	</a>
</div>

<style>
	button {
		background-color: #050505;
		width: 100%;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 16px;
	}
</style>
