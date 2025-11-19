localStorage.setItem("userName", nomeDoUsuario);

const name = localStorage.getItem("userName");

document.getElementById("welcome-message").innerText = `Bem vindo, ${name}!`;