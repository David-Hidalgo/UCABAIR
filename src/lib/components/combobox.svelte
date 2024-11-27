<script lang="ts">
    export let options: { value: number; label: string }[] = [];
  </script>
  
  <select>
    {#each options as option}
      <option value={option.value}>{option.label}</option>
    {/each}
  </select>
  
  <style>
      select {
        width: 30%;
        box-sizing: border-box;
        
}
  </style>