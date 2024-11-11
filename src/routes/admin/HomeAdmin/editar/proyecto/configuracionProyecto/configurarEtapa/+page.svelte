<script lang="ts">
	import ConfigurarEtapa from '$lib/components/configurarEtapa.svelte';
	import Etapas from '$lib/components/configurarProyecto.svelte';
</script>

<body>
	<!-- <Etapas bind:cantidad_etapas={cantidad_etapas}/> -->
	<div class="ConfigurarEtapa">
		<h2>Configuracion Etapa</h2>
		<ConfigurarEtapa />
		<a
			href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa/configurarActividad"
		>
			<button>Configurar Actividades</button>
		</a>
	</div>
</body>

<style>
	button {
		background-color: #050505;
		justify-content: center;
		width: 50%;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 16px;
	}
</style>
