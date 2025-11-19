// auth-helper.js
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


document.addEventListener("DOMContentLoaded", () => {
  // Esconder elementos admin-only se não for admin
  if (userData.isAdmin) {
    document.querySelectorAll(".admin-only").forEach(el => el.style.display = "none");
  }

  // Esconder elementos user-only se for admin
  if (!userData.isAdmin) {
    document.querySelectorAll(".user-only").forEach(el => el.style.display = "none");
  }

  // Ajustar todos os links que editam perfil do usuário
  document.querySelectorAll('a[href="./editar-membro.html"]').forEach(link => {
    if (!userData.isAdmin) {
      link.href = `./editar-membro.html?id=${userData.id}`;
    }
  });
});
});
