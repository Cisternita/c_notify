<script lang="ts">
    import Notification from "./components/notification.svelte";
    import { writable } from "svelte/store";
    import { useNuiEvent } from "./utils/useNuiEvent";
    import { flip } from "svelte/animate";

    const notifications = writable([
        { color: "red", icon: "fa fa-info-circle", title: "Initializing", message: "Initializing script, this is a common message", time: 1000, id: Math.random() },
    ]);

    let lastAdded = new Date();
    const addNotification = (notification) => {
        if (new Date() - lastAdded < 1000) setTimeout(() => addNotification(notification), 1000);
        else {
            lastAdded = new Date();
            notifications.update((n) => [...n, { ...notification, id: Math.random() }]);
        }
    };

    useNuiEvent("notification", (notification) => {
        addNotification(notification);
    });
</script>

<ul>
    {#each $notifications as notification, i (notification.id)}
        <li animate:flip={{ delay:100 }}>
            <Notification {...notification} {notifications}  />
        </li>
    {/each}
</ul>

<style>
    ul {
        position: absolute;
        display: flex;
        flex-direction: column-reverse;
        bottom: 15vh;
        right: 1vh;
        height: 80vh;
        width: 40vh;
        list-style: none;
        gap: 2vh;
    }
</style>

