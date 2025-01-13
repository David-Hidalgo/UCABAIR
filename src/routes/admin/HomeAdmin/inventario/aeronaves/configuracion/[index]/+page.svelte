<script lang="ts">
	import type { PageData } from './$types';
	import MostrarPresupuesto from '$lib/components/mostrarPresupuesto.svelte';
	import type { Modelo_avion, Plan_ensamblaje, Profesion } from '$lib/server/db/schema';
	let { data }: { data: PageData } = $props();
	const modelo_aEditar: Modelo_avion = {
		codigo_ma: data.resultado[0].codigo_ma,
		nombre_ma: data.resultado[0].nombre_ma,
		descripcion_ma: data.resultado[0].descripcion_ma,
		fk_modelo_avion: data.resultado[0].fk_modelo_avion,
		precio_unidad_ma: data.resultado[0].precio_unidad_ma
	};
	const planes_ensamblaje: Plan_ensamblaje[] = data.resultado.map((plan: any) => {
		return {
			codigo_pe: plan.codigo_pe,
			duracion_estimada_pe: plan.duracion_estimada_pe,
			descripcion_pe: plan.descripcion_pe
		};
	});
	const profesionales: any[] = data.profesion_table;
</script>

<div class="Presupuesto">
	<MostrarPresupuesto
		modelo_avion_entrante={modelo_aEditar}
		datos_ensamblaje={planes_ensamblaje}
		tipo_prueba={data.tp_table}
		tipo_pieza={data.p_table}
		configuracion_avion={data.ca_table}
		configuracion_prueba_avion={data.cpa_table}
		estimacion_profesion_empleado={data.epe_table}
		profesion={profesionales}
	/>
</div>