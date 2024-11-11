<script lang="ts">
	import ConfigurarEtapa from '$lib/components/configurarEtapa.svelte';
	import Etapas from '$lib/components/configurarProyecto.svelte';
</script>

<body>
	<!-- <Etapas bind:cantidad_etapas={cantidad_etapas}/> -->
	<div class="ConfigurarEtapa">
		<h2>Configuracion Etapa</h2>
		<ConfigurarEtapa />
		<div class="botones">
			<a
				href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa/configurarActividad"
			>
				<button>Configurar Actividades</button>
			</a>
			<a href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa">
				<button>Agregar Etapa</button>
			</a>
		</div>
	</div>
</body>

<style>
	.botones {
		display: flex;
	}

	button {
		background-color: #050505;
		color: #fff;
		border: none;
		border-radius: 3px;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 16px;
	}
</style>
