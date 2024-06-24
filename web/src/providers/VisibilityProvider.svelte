<script lang="ts">
    import { visibility } from "../stores/visibility";
</script>

{#if $visibility}
    <slot />
{/if}
