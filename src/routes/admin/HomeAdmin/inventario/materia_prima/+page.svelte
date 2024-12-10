<script>
    import Combobox from "$lib/components/combobox.svelte";

    let sedes = [
        { value: 1, label: "Distrito Capital" },
        { value: 2, label: "Miranda" },
        { value: 3, label: "Vargas" },
        { value: 4, label: "Aragua" },
        { value: 5, label: "Carabobo" },
        { value: 6, label: "Lara" },
        { value: 7, label: "Yaracuy" },
        { value: 8, label: "Falcón" },
        { value: 9, label: "Zulia" },
        { value: 10, label: "Mérida" },
        { value: 11, label: "Táchira" },
        { value: 12, label: "Trujillo" },
        { value: 13, label: "Barinas" },
        { value: 14, label: "Portuguesa" },
        { value: 15, label: "Cojedes" },
        { value: 16, label: "Guárico" },
        { value: 17, label: "Anzoátegui" },
        { value: 18, label: "Monagas" },
        { value: 19, label: "Sucre" },
        { value: 20, label: "Nueva Esparta" },
        { value: 21, label: "Delta Amacuro" },
        { value: 22, label: "Amazonas" },
        { value: 23, label: "Bolívar" },
        { value: 24, label: "Apure" },
        { value: 25, label: "Guarico" },
        { value: 26, label: "Dependencias Federales" },
        { value: 27, label: "Extranjero" }
    ];

</script>


<div class="ComboboxSedes">
    <p>Selecciona una sede:</p>
    <Combobox options={sedes}/>
</div>

<style>
    .ComboboxSedes {
        display: flex;
        flex-direction: row;
        align-items: left;
    }
</style>