<script>
    import { onMount, onDestroy } from "svelte";
    import { fly, fade } from "svelte/transition";
    export let title;
    export let message;
    export let time;
    export let id;
    export let notifications;
    export let color;
    let currentTime = time;
    let interval;
    let divElement;

    const colors = {
        alert: "red",
        advise: "blue",
        success: "green",
        info: "yellow"
    };

    onMount(() => {
        divElement.style.setProperty("--color", colors[color] || color);
        interval = setInterval(() => {
            currentTime -= 10;
            if (currentTime <= 0) {
                notifications.update(current => current.filter(notification => notification.id !== id));
            }
        }, 10);
    });

    onDestroy(() => {
        clearInterval(interval);
    });
</script>

<div class="notification" in:fly={{ x: "200%", duration: 500}} out:fly={{ x: "200%" }} bind:this={divElement}>
    <h1 class="title">{title}</h1>
    <div class="timer" style={`width: ${currentTime / time * 100}%;`} />
    <span class="message">{message}</span>
</div>

<style>
    .timer {
        height: .3vh;
        width: 100%;
        background-color: var(--color);
        box-shadow: 0 0 1vh var(--color);
    }
    .notification {
        position : relative;
        display: flex;
        flex-direction: column;
        background-color: rgb(42, 42, 42);
        width: 38vh;
        max-width: 36vh;
        color: white;
        padding: 2vh;
        font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        border-top-right-radius: 5vh;
        border-bottom-right-radius: 5vh;
        box-shadow: 0 0 1vh black;
    }
    .notification::before{
        content: "";
        position: absolute;
        height: 100%;
        width: 5vh;
        background-color: var(--color);
        left: -5vh;
        bottom: 0;
        border-top-left-radius: 5vh;
        border-bottom-left-radius: 5vh;
        box-shadow: 0 0 1vh var(--color);
    }
    .title {
        font-size: 2.5vh;
        margin: 0;
        max-width: 100%;
        word-break: break-all;
        padding-bottom: 0.5vh;
    }
    .message {
        font-size: 2vh;
        padding-top: 1vh;
        max-width: 100%;
        word-break: break-all;
    }
</style>