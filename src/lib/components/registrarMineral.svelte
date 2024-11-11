<script lang="ts">
	import { goto } from '$app/navigation';

	interface Mineral {
		id_mineral: string;
		mi_nombre: string;
		mi_tipo: string; // Valor predeterminado
		mi_utilizacion: string;
		mi_dureza: string;
		mi_maleabilidad: string;
		mi_peso: string;
	}

	let mineral: Mineral = {
		id_mineral: '',
		mi_nombre: '',
		mi_tipo: '',
		mi_utilizacion: '',
		mi_dureza: '',
		mi_maleabilidad: '',
		mi_peso: ''
	};

	// Función para manejar el envío del formulario
	async function registrarMineral() {
		const res = await fetch(`http://localhost:4000/mineral`, {
			method: 'POST',
			body: JSON.stringify(mineral),
			headers: { 'Content-Type': 'application/json' }
		});
		const data = await res.json();
		console.log(data);
		goto('/admin/HomeAdmin/mineral');
		alert('Se agregó exitosamente el mineral');
	}
</script>

<form on:submit|preventDefault={registrarMineral}>
	<h2>Registrar Mineral</h2>

	<label for="id_mineral">ID de Mineral</label>
	<input id="id_mineral" bind:value={mineral.id_mineral} />

	<label for="nombreMineral">Nombre del Mineral</label>
	<input id="nombreMineral" bind:value={mineral.mi_nombre} />

	<label for="tipoMineral">Tipo de mineral</label>
	<select id="tipoMineral" bind:value={mineral.mi_tipo}>
		<option value="metalico">metalico</option>
		<option value="no metalico">no metalico</option>
		<!-- Agrega más opciones según sea necesario -->
	</select>

	<label for="Utilizacion">Utilizacion del mineral</label>
	<input id="Utilizacion" bind:value={mineral.mi_utilizacion} />

	<label for="Dureza">Dureza</label>
	<input id="Dureza" bind:value={mineral.mi_dureza} />

	<label for="Maleabilidad">maleabilidad</label>
	<input id="Maleabilidad" bind:value={mineral.mi_maleabilidad} />

	<label for="Peso">peso</label>
	<input id="Peso" bind:value={mineral.mi_peso} />

	<button type="submit">Registrar Mineral</button>
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
