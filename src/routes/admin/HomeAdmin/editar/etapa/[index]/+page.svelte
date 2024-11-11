<script lang="ts">
	import { page } from '$app/stores';
	import ConfigurarEtapa from '$lib/components/configurarEtapa.svelte';
	let id_editar = Number($page.params.index);
</script>

<body>
	<!-- <Etapas bind:cantidad_etapas={cantidad_etapas}/> -->
	<div class="ConfigurarEtapa">
		<h2>Configuracion Etapa</h2>
		<ConfigurarEtapa bind:id_editar />
		<div class="botones">
			<a
				href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa/configurarActividad/asignarEmpleado"
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
