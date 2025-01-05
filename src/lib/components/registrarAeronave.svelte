<script lang="ts">
	import { goto } from '$app/navigation';
	import type { Modelo_avion, Caracteristica, Caracteristica_modelo,Tipo_pieza,Tipo_prueba,
				 Configuracion_avion, Configuracion_prueba_avion } from '$lib/server/db/schema';
	export let modelos_avion: Modelo_avion[];
	export let id_editar: Modelo_avion | undefined;

	let piezas: Tipo_pieza[] = [];
	let pruebas: Tipo_prueba[] = [];
	let configuraciones_p: Configuracion_prueba_avion[] = [];
	let configuraciones_a: Configuracion_avion[] = [];
	let caracteristicas: Caracteristica[] = [];
	let caracteristicas_modelo: Caracteristica_modelo[] = [];

	let codigo_viejo: number;
	let aeronave :Modelo_avion= {
		codigo_ma: 0,
		nombre_ma: '',
		descripcion_ma: '',
		precio_unidad_ma: 0,
		fk_modelo_avion: 0
	};
	if (id_editar!=undefined) {
		aeronave = id_editar;
		if (id_editar.codigo_ma)
		codigo_viejo=id_editar.codigo_ma
	} else {
		aeronave = {
			codigo_ma: 0,
			nombre_ma: '',
			descripcion_ma: '',
			precio_unidad_ma: 0,
			fk_modelo_avion: 0
		};
	}
	async function decide() {
		
		if (id_editar==undefined) {
			registrarAeronave();
		} else {
			actualizarAeronave();
		}
	}

	let caracteristica :Caracteristica= {
		codigo_car: Math.floor(Math.random() * 360) + 20,
		nombre_car: '',
	};

	let caracteristica_modelo:Caracteristica_modelo = {
		valor_cm: 0,
		unidad_medida_cm: '',
		fk_caracteristica: caracteristica.codigo_car,
		fk_modelo_avion: aeronave.codigo_ma
	};

	let prueba: Tipo_prueba = {
		codigo_tp: 0,
		nombre_tp: '',
		descripcion_tp: '',
		duracion_estimada_tp: ''
	};

	let pieza: Tipo_pieza = {
		codigo_tp: 0,
		nombre_tp: '',
		descripcion_tp: '',
		precio_unidad_tp: 0,
		fk_tipo_pieza: 0
	};

	let configuracion_p: Configuracion_prueba_avion = {
		fk_tipo_prueba: 0,
		fk_modelo_avion: 0,
		fk_sede: 0
	};

	let configuracion_a: Configuracion_avion = {
		cantidad_pieza_ca: 0,
		fk_tipo_pieza: 0,
		fk_modelo_avion: 0,
		fk_sede: 0
	};

	async function actualizarAeronave() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/editar/rol`, {
			method: 'PUT',
			body: JSON.stringify({aeronave:aeronave , codigo_viejo:codigo_viejo, caracteristicas:caracteristicas, caracteristicas_modelo:caracteristicas_modelo}),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		goto('/admin/HomeAdmin/inventario/aeronaves');
	}
	// Función para manejar el envío del formulario
	async function registrarAeronave() {
		const res = await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/aeronave`, {
			method: 'POST',
			body: JSON.stringify(aeronave),
			headers: { 'Content-Type': 'application/json' }
		});

		for (let car of caracteristicas) {
			console.log(car);
			await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/aeronave/caracteristica`, {
				method: 'POST',
				body: JSON.stringify(car),
				headers: { 'Content-Type': 'application/json' }
			});
		}

		for (let cm of caracteristicas_modelo) {
			console.log(cm);
			await fetch(`http://localhost:5173/admin/HomeAdmin/registrar/aeronave/caracteristica_modelo`, {
				method: 'POST',
				body: JSON.stringify(cm),
				headers: { 'Content-Type': 'application/json' }
			});
		}
		const data = await res.json();
		goto('/admin/HomeAdmin/inventario/aeronaves');
	}

	let showExtraField1 = false;
	let showExtraField2 = false;
	let extraFieldValue1 = [''];
	let extraFieldValue2 = [''];
	let i=0
</script>

<form on:submit|preventDefault={registrarAeronave}>
	<h2>Registrar Aeronave</h2>

	<label for="codigo_ma">Codigo Aeronave</label>
	<input id="codigo_ma" bind:value={aeronave.codigo_ma} />

	<label for="nombre_ma">Nombre Aeronave</label>
	<input id="nombre_ma" bind:value={aeronave.nombre_ma} />

	<label for="descripcion_ma">Descripcion Aeronave</label>
	<input id="descripcion_ma" bind:value={aeronave.descripcion_ma} />

	<label for="precio_unidad_ma">Precio Unidad Aeronave</label>
	<input id="precio_unidad_ma" bind:value={aeronave.precio_unidad_ma} />

	<label for="fk_modelo_avion">Modelo Aeronave</label>
	<select id="fk_modelo_avion" bind:value={aeronave.fk_modelo_avion}>
		{#each modelos_avion as modelo}
			<option value={modelo.codigo_ma}>{modelo.nombre_ma}</option>
		{/each}
	</select>
	<div class="caracteristicas">
		<label for="caracteristica">Nombre de la caracteristica</label>
		<input id="caracteristica" bind:value={caracteristica.nombre_car} />

		<label for="valor_cm">Valor de la caracteristica</label>
		<input id="valor_cm" bind:value={caracteristica_modelo.valor_cm} />

		<label for="unidad_medida_cm">Unidad de medida de la caracteristica</label>
		<input id="unidad_medida_cm" bind:value={caracteristica_modelo.unidad_medida_cm} />
		<button type="button" on:click={() => { caracteristicas.push({ ...caracteristica });
							caracteristica_modelo = {valor_cm: caracteristica_modelo.valor_cm,unidad_medida_cm:caracteristica_modelo.unidad_medida_cm,fk_caracteristica: caracteristica.codigo_car,fk_modelo_avion: aeronave.codigo_ma};
							caracteristicas_modelo.push({ ...caracteristica_modelo });
							 caracteristica = { codigo_car: caracteristica.codigo_car+1, nombre_car: ''};
							 caracteristica_modelo = {valor_cm: caracteristica_modelo.valor_cm + 1,unidad_medida_cm:'',fk_caracteristica: caracteristica.codigo_car,fk_modelo_avion: aeronave.codigo_ma};alert('Caracteristica añadida') }}>Agregar Caracteristica</button>
	</div>
	<div class="piezas">
		<button type="button" on:click={() => showExtraField1 = true}>Agregar Piezas</button>
		{#if showExtraField1}
			{#each Array(extraFieldValue1.length).fill(null) as _, i}
				<label for="pieza_field_{i}">Nombre Pieza {i + 1}</label>
				<input id="pieza_field_{i}" bind:value={pieza.nombre_tp} />

				<label for="cant_pieza_field_{i}">Descripcion Pieza {i + 1}</label>
				<input id="cant_pieza_field_{i}" bind:value={pieza.descripcion_tp} />

				<label for="precio_pieza_field_{i}">Precio Pieza {i + 1}</label>
				<input id="precio_pieza_field_{i}" bind:value={pieza.precio_unidad_tp} />
			{/each}
			<button type="button" on:click={() => {extraFieldValue1 = [...extraFieldValue1, ''];piezas.push({ ...pieza });console.log(piezas)}}>Agregar Otro Campo Extra</button>
			{/if}
	</div>
	<div class="pruebas">
		<button type="button" on:click={() => showExtraField2 = true}>Agregar Pruebas</button>
		{#if showExtraField2}
			{#each Array(extraFieldValue2.length).fill(null) as _, i}
				<label for="prueba_field_{i}">Nombre Prueba {i + 1}</label>
				<input id="prueba_field_{i}" bind:value={prueba.nombre_tp} />

				<label for="desc_prueba_field_{i}">Descripcion Prueba {i + 1}</label>
				<input id="desc_prueba_field_{i}" bind:value={prueba.descripcion_tp} />

				<label for="duracion_prueba_field_{i}">Duracion estimada Prueba {i + 1}</label>
				<input id="duracion_prueba_field_{i}" bind:value={prueba.duracion_estimada_tp} />
			{/each}
			<button type="button" on:click={() => {extraFieldValue2 = [...extraFieldValue2, ''];pruebas.push({ ...prueba });console.log(pruebas)}}>Agregar Otro Campo Extra</button>
			{/if}
	<button type="submit">Registrar Aeronave</button>
</form>

<style>
	/* Estilos generales para el formulario */
	form {
		max-width: 100%;
		margin: 0 auto;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 5px;
		background-color: #f9f9f9;
		display: flex;
		flex-direction: column;
	}

	/* Estilos para las etiquetas y campos de entrada */
	label {
		display: block;
		margin-bottom: 10px;
		font-weight: bold;
	}

	input,
	select {
		width: 40%;
		padding: 10px;
		margin-bottom: 15px;
		border: 1px solid #ccc;
		border-radius: 3px;
		font-size: 14px;
	}

	/* Estilos para el botón de envío */
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
