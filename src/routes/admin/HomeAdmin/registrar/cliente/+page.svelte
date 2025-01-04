<script lang="ts">
	import { enhance } from '$app/forms';
	import RegistroNat from '$lib/components/registrarClienteNat.svelte';
	import RegistroJur from '$lib/components/registrarClienteJur.svelte';
	let selectedComponent= $state(RegistroNat);
	let codigo_usu = $state(-1);;
    function seleccionarComponente(tipoCliente: string) {
        switch (tipoCliente) {
            case 'Natural':
                selectedComponent = RegistroNat;
				console.log("natural");
				
                break;
            case 'Juridico':
                selectedComponent = RegistroJur;
                break;
            default:
                selectedComponent = RegistroNat;
        }
    }
	async function handleSubmit(event: Event) {
        event.preventDefault();
        const form = event.target as HTMLFormElement;
        const formData = new FormData(form);
        const data = Object.fromEntries(formData.entries());
		console.log(data);
        try {
            const response = await fetch('/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            });

            if (!response.ok) {
				console.log(response);
                throw new Error('Network response was not ok');

            }

            const result = await response.json();
            codigo_usu = result;
        } catch (error) {
            console.error('Error:', error);
        }
    }

	let registrado:boolean=$state(false);
</script>
		
		<!-- {#if }-->
		<form onsubmit="{handleSubmit}">
			<label>Usuario<input name="username" /></label>
			<label>Contraseña<input type="password" name="password" /></label>
			<button type="submit" onclick={() => {codigo_usu=codigo_usu} }>Asignar usuario</button>
		</form>

		<!-- {/if }-->
		{#if codigo_usu!=-1}
		<div class="botonesForm">
			<button onclick={() => seleccionarComponente('Natural')}>Persona Natural</button>
			<button onclick={() => seleccionarComponente('Juridico')}>Persona Jurídica</button>
		</div>
			{#if selectedComponent}
				<!-- svelte-ignore svelte_component_deprecated -->
				<svelte:component this={selectedComponent} fk_usuario={	codigo_usu } codigo_com={null}/>
			{/if}
		{/if }
		
<style>
			/* Estilos generales para el formulario */

			.botonesForm{
				display: flex;
				justify-content: center;
				margin-top: 20px;
				gap: 10px;
			}
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
		
			input {
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
		