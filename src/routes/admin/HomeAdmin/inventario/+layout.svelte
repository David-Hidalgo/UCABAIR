<h2>Seleccione el inventario que desea mostrar:</h2>
<a href="/admin/HomeAdmin/inventario/piezas">
	<button>Piezas</button>
</a>
<a href="/admin/HomeAdmin/inventario/materia_prima">
	<button>Materia Prima</button>
</a>
<a href="/admin/HomeAdmin/inventario/aeronaves">
	<button>Aeronaves</button>
</a>
<slot />

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
