<script lang="ts">
	import { page } from '$app/stores';
	import { desc } from 'drizzle-orm';
	let id_editar = Number($page.params.index);

    let avion = { 
        id: 1, 
        nombre: 'Sky Cruiser', 
        modelo: 'Boeing 737', 
        capacidad: 180, 
        stock: 10, 
        precio: 1000000, 
        descripcion: 'El Boeing 737, conocido como "Sky Cruiser", es uno de los aviones más populares y confiables en la industria de la aviación comercial. Con una capacidad para 180 pasajeros, este modelo ofrece un equilibrio perfecto entre eficiencia y comodidad. Equipado con tecnología de punta, el Boeing 737 garantiza un vuelo suave y seguro. Su diseño aerodinámico y motores potentes permiten un rendimiento excepcional, mientras que su interior espacioso y bien diseñado asegura una experiencia de viaje placentera para todos los pasajeros. Además, el "Sky Cruiser" cuenta con un historial de seguridad impecable y es altamente valorado por aerolíneas de todo el mundo por su fiabilidad y bajo costo operativo.',
        especificaciones: [
            { nombre: 'Velocidad máxima', valor: '850 km/h' },
            { nombre: 'Alcance', valor: '5,500 km' },
            { nombre: 'Altitud máxima', valor: '12,500 m' },
            { nombre: 'Consumo de combustible', valor: '2.5 L/km' }
        ]
    };

</script>

<p>Estás viendo el producto con id {id_editar}</p>


<div class="detalle_producto">
    <h2>{avion.nombre}</h2>
    <p>{avion.modelo}</p>
    <p>{avion.descripcion}</p>
    <ul>
        {#each avion.especificaciones as especificacion}
            <li>{especificacion.nombre}: {especificacion.valor}</li>
        {/each}
    </ul>
    <p>Stock disponible: {avion.stock}</p>
</div>
<a href='/cliente/productos'>
    <button>Generar Solicitud de Compra</button>
</a>

<style>
    button{
			background-color: black;
			color: white;
			padding: 8px 16px;
			border: none;
			border-radius: 4px; 
			cursor: pointer;
		}
</style>

