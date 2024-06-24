<script lang="ts">
    import Notification from "./components/notification.svelte";
    import { useNuiEvent } from "./utils/useNuiEvent";
    import { each } from "svelte/internal";
    let notifications = [];
    let visible = true;
    let title = "";
    let message = "";
    notifications = [...notifications, {title: "Test", message: "Test"}]
    useNuiEvent("sendNotification", (data) => {
        visible = true;
        title = data.title;
        message = data.message;
        notifications = [...notifications, {title: data.title, message: data.message }];
    });
</script>

{#if visible}
    {#each notifications as notification}
        <Notification title={notification.title} message={notification.message} />
    {/each}
{/if}

