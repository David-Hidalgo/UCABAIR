<script lang="ts">
   import { enhance } from '$app/forms';
	import { goto } from '$app/navigation';

	import type { Modelo_avion, Caracteristica, Caracteristica_modelo,
        Configuracion_avion, Tipo_pieza, Tipo_prueba, Configuracion_prueba_avion } from '$lib/server/db/schema';
    import { writable } from 'svelte/store';
	// const dispatch = createEventDispatcher();
    export let modelos_avion:Modelo_avion[];
    export let id_editar:Modelo_avion | undefined;

    for (let index = 0; index < data.ma_table.length; index++) {
		let modelo_avion:  Modelo_avion = {
			codigo_ma: 0,
            nombre_ma: '',
            descripcion_ma: '',
            precio_unidad_ma: 0,
            fk_modelo_avion: 0
		};
        modelo_avion.codigo_ma = data.ma_table[index].codigo_ma;
        modelo_avion.nombre_ma = data.ma_table[index].nombre_ma;
        modelo_avion.descripcion_ma = data.ma_table[index].descripcion_ma;
        modelo_avion.precio_unidad_ma = data.ma_table[index].precio_unidad_ma;
        modelo_avion.fk_modelo_avion = data.ma_table[index].fk_modelo_avion;
        modelos_avion.push(modelo_avion);
	};


    export let tipo_pieza: Tipo_pieza[];
    export let tipo_prueba: Tipo_prueba[];


console.log(modelos_avion)
        
</script>
<div class="presupuesto">
  </div>
<style>
	.presupuesto {
        padding-left: 20px;
        border: 1px solid black;
	}

	table {
		width: 100%;
		border-collapse: collapse;
	}
	th,
	td {
		border: 1px solid #adadad;
		padding: 8px;
		text-align: left;
		font-family: 'Baskervville';
		font-style: light;
		align-items: center;
		text-align: left;
		letter-spacing: -0.03em;
	}
	thead {
		background-color: white;
	}

    h2 {
        text-decoration: underline;
    }

    h1 {
        text-decoration: underline;
        text-align: center;
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