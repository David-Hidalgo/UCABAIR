<script lang="ts">
	import { goto } from '$app/navigation';

	async function handleSubmit(event: Event) {
		event.preventDefault();
		// Obtener el valor del campo de contraseña
		const passwordInput = document.getElementById('password') as HTMLInputElement;
		const password = passwordInput.value;
		console.log(password);
		// Verificar la clave y redirigir según el valor
		if (password === '1') {
			// Redirigir a la página 1
			goto('/admin/HomeAdmin');
		} else if (password === '2') {
			// Redirigir a la página 2
			goto('/empleado/HomeEmpleado');
		} else if (password === '3') {
			// Redirigir a la página aliado
			goto('/aliado/HomeAliado');
		} else if (password === '4') {
			// Redirigir a la página aliado
			goto('/cliente/Home');
		} else {
			// Clave incorrecta, mostrar un mensaje de error o hacer otra acción
			console.error('Clave incorrecta');
		}
	}
	let username = '';
	let password = '';
</script>

<div class="cajaInicioSesion">
	<div class="cajaborde">
		<h2>Ingrese con sus credenciales de inicio de sesion</h2>
		<form on:submit={handleSubmit} class="cajachica">
			<label class="palabras" style="margin-top: 5%;" for="username">Correo Electronico:</label>
			<input class="palabras" id="username" name="username" type="text" placeholder="Usuario" />

			<label class="palabras" style="margin-top: 5%;" for="password">Contraseña:</label>
			<input
				class="palabras"
				id="password"
				name="password"
				type="password"
				placeholder="*********"
			/>

			<button type="submit" class="ingresar">Ingresar</button>
		</form>
	</div>
</div>

<style>
	.form-label {
		margin-top: 5%;
	}
	input {
		font-size: 20px;
		font-family: 'Courier New', Courier, monospace;
		color: black;
	}
	h1 {
		font-size: 100px;
		text-align: center;
	}
	.ingresar {
		background-color: black;
		border-radius: 25px;
		margin-top: 5%;
		justify-self: right;
		color: white;
		width: 100px;
		height: 40px;
		font-size: 15px;
		font-weight: bold;
	}
	.titulocaja {
		flex-direction: column;
		justify-content: center;
	}
	.cajaInicioSesion {
		margin: 100px;
		width: 90%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		height: 300px;
	}
	.cajaborde {
		background-color: white;
		width: 300px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		height: 440px;
	}
	input {
		align-self: center;
		width: 400px;
		border-radius: 10px;
	}
	.palabras {
		align-self: flex-start;
		font-family: 'Courier New', Courier, monospace;
	}

	.cajachica {
		width: 500px;
		display: flex;
		padding: 10px;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		border-right: black;
		color: black;
		border-radius: 40px;
		height: 100px;
	}
</style>
