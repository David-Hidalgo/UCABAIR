<script lang="ts">
	import ConfigurarActividad from '$lib/components/configurarActividad.svelte';
	import AgregarEmpleados from '$lib/components/agregarEmpleados.svelte';
	import AgregarMaquinaria from '$lib/components/agregarMaquinaria.svelte';
	import ConfigurarProyecto from '$lib/components/configurarProyecto.svelte';
</script>

<body>
	<div class="ConfigurarActividad">
		<!-- <ConfigurarEtapa bind:cant_actividades={cant_actividades}/> -->
		<h2>Configuracion Actividad <!-- {cant_actividades} --></h2>
		<ConfigurarActividad />
		<div class="AgregarEmpleados">
			<AgregarEmpleados />
		</div>
		<div class="AgregarMaquinaria">
			<AgregarMaquinaria />
		</div>
		<a
			href="/admin/HomeAdmin/registrar/proyecto/configuracionProyecto/configurarEtapa/configurarActividad"
		>
			<button type="submit">Continuar</button>
		</a>
	</div>
</body>

<style>
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
