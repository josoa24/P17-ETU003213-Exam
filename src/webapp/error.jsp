<style>
    .error-message {
        color: red;
        font-weight: bold;
        font-size: 16px;
    }
</style>

<div class="error-message">
    <%= request.getAttribute("message") %>
</div>