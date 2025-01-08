<script lang="ts">
	import type { PageData } from './$types';
	import MostrarPresupuesto from '$lib/components/mostrarPresupuesto.svelte';
	import type { Modelo_avion, Plan_ensamblaje } from '$lib/server/db/schema';
	let { data }: { data: PageData } = $props();
	const modelo_aEditar: Modelo_avion = { 
		codigo_ma: data.resultado[0].codigo_ma,
		nombre_ma: data.resultado[0].nombre_ma,
		descripcion_ma: data.resultado[0].descripcion_ma,
		fk_modelo_avion: data.resultado[0].fk_modelo_avion,
		precio_unidad_ma: data.resultado[0].precio_unidad_ma
		};
	const datos_ensamblaje: Plan_ensamblaje = {
		codigo_pe:data.resultado[0].codigo_pe,
		duracion_estimada_pe:data.resultado[0].duracion_estimada_pe,
		descripcion_pe:data.resultado[0].descripcion_pe,		
	};
</script>

<div class="EditarRol">
	<MostrarPresupuesto
		modelo_avion_entrante={modelo_aEditar}
		datos_ensamblaje={datos_ensamblaje}
		id_editar={data.resultado}
		tipo_prueba={data.tp_table}
		tipo_pieza={data.p_table}
		configuracion_avion={data.ca_table}
		configuracion_prueba_avion={data.cpa_table}
		empleado_profesion={null}
		estimacion_profesion_empleado={data.epe_table}
		profesion={data.profesion_table}
	/>
</div>
