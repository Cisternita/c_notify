<script>
    import { fade } from "svelte/transition";
    import { writable } from "svelte/store";
    export let title = "";
    export let message = "";
</script>

<div class="notification" transition:fade>
    <h1 class="title">{title}</h1>
    <span class="message">{message}</span>
</div>

<style>
    .notification {
        position : absolute;
        display: flex;
        flex-direction: column;
        background-color: rgb(42, 42, 42);
        height: 10vh;
        width: 38vh;
        max-width: 36vh;
        bottom: 15vh;
        right: 1vh;
        color: white;
        padding: 2vh;
        font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        border-top-right-radius: 1vh;
        border-bottom-right-radius: 1vh;
        box-shadow: 0 0 1vh black;
    }
    .notification::before{
        content: "";
        position: absolute;
        height: 100%;
        width: 1vh;
        background-color: chartreuse;
        left: -1vh;
        bottom: 0;
        border-top-left-radius: 1vh;
        border-bottom-left-radius: 1vh;
        box-shadow: 0 0 1vh chartreuse;
    }
    .title {
        font-size: 2.5vh;
        margin: 0;
    }
    .message {
        font-size: 2vh;
        padding-top: 1vh;
    }
</style>