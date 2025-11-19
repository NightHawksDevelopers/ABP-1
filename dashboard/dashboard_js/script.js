// =============================
// LOGIN
// =============================
const form = document.getElementById("login-form");
if (form) {
  form.addEventListener("submit", async (e) => {
    e.preventDefault();

    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();
    const errorMessage = document.getElementById("error-message");

    try {
      const res = await fetch("http://localhost:3000/api/login", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, password }),
      });

      const data = await res.json();

      if (!res.ok) {
        errorMessage.textContent = data.error || "Erro no login.";
        return;
      }

      // salvar token e usuário localmente
      localStorage.setItem("token", data.token);
      localStorage.setItem("user", JSON.stringify(data.user));

      // redirecionar conforme tipo de usuário
      if (data.user.isAdmin === true) {
        window.location.href = "dashboard_html/dashboardadmin.html";
      } else {
        window.location.href = "dashboard_html/dashboarduser.html";
      }

    } catch (err) {
      console.error(err);
      errorMessage.textContent = "Falha na conexão com o servidor.";
    }
  });
}

// =============================
// DASHBOARD (protegido)
// =============================
if (
  window.location.pathname.endsWith("dashboard.html") ||
  window.location.pathname.endsWith("dashboardadmin.html") ||
  window.location.pathname.endsWith("dashboarduser.html")
) {
  const user = JSON.parse(localStorage.getItem("user"));
  const token = localStorage.getItem("token");

  // se não estiver logado, redireciona
  if (!token || !user) {
    alert("Você precisa estar logado.");
    window.location.href = "login.html";
  }

  // Exibir o nome do usuário
  const userNameEl = document.getElementById("user-name");
  if (userNameEl) {
    userNameEl.textContent = user.name;  // <-- Aqui aparece no HTML
  }

  // BOTÃO DE SAIR
  const logoutBtn = document.getElementById("logout");
  if (logoutBtn) {
    logoutBtn.addEventListener("click", () => {
      localStorage.removeItem("token");
      localStorage.removeItem("user");
      window.location.href = "login.html";
    });
  }
}
