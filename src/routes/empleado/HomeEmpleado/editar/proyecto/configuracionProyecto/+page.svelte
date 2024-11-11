<script>
	import ConfigurarProyecto from '$lib/components/configurarProyecto.svelte';
</script>

<body>
	<div class="ConfigurarProyecto">
		<ConfigurarProyecto />
		<a href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa">
			<button>Configurar Etapas</button>
		</a>
	</div>
</body>

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
