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