<script>
	let username = '';
	let password = '';
</script>

<div class="cajaIngresoRegistro">
	<div class="cajaInicioSesion">
		<div class="cajaborde">
			<form action="?/login" method="post" class="cajachica">
				<div class="titulocaja">
					<h2 class="palabras">Si ya tienes una cuenta</h2>
				</div>

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
		<div>
			Si eres admin pulsa
			<a href="/moduloGestion">aqui</a>
		</div>
	</div>
	<div class="lineaSeparacion">
		<p>i</p>
	</div>
	<div class="cajaRegistro">
		<div class="mensajeRegistrate">
			<p>Si no tienes una cuenta registrate</p>
			<a href="/registro">Registrarme</a>
		</div>
	</div>
</div>

<style>
	.lineaSeparacion {
		height: 300px;
		background-color: gray;
		color: gray;
	}

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
		margin: 80px;
		width: 300px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		border-radius: 10px;
		height: 450px;
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

	.cajaIngresoRegistro {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		justify-content: space-between;
		margin: 0px 150px 0px 100px;
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

	.mensajeRegistrate {
		justify-content: center;
		align-items: center;
	}
</style>
