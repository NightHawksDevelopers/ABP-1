const token = localStorage.getItem("token");
const userData = JSON.parse(localStorage.getItem("user"));

// Se não estiver logado, redireciona para login
if (!token || !userData) {
    window.location.href = "../login.html";
}

document.addEventListener("DOMContentLoaded", () => {
    // Preencher dados do usuário
    document.getElementById("userName").textContent = userData.name;
    document.getElementById("userEmail").textContent = userData.email;
    document.getElementById("userRole").textContent = userData.isAdmin ? "Administrador" : "Membro";

   

    // Botão de logout
    const logoutBtn = document.getElementById("logoutBtn");
    if (logoutBtn) {
        logoutBtn.addEventListener("click", () => {
            localStorage.removeItem("token");
            localStorage.removeItem("user");
            window.location.href = "../login.html";
        });
    }
});
