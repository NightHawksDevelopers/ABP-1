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

            // Salvar token e usuário localmente
            localStorage.setItem("token", data.token);
            localStorage.setItem("user", JSON.stringify(data.user));

            // Redirecionar para uma única página
            window.location.href = "./dashboard_html/dashboard.html";
        } catch (err) {
            console.error(err);
            errorMessage.textContent = "Falha na conexão com o servidor.";
        }
    });
}

// =============================
// DASHBOARD (protegido)
// =============================
if (window.location.pathname.endsWith(".html")) {
    const user = JSON.parse(localStorage.getItem("user"));
    const token = localStorage.getItem("token");

    // if (!token || !user) {
    //     alert("Você precisa estar logado.");
    //     window.location.href = "login.html";
    // }

    // Exibir nome do usuário
    const userNameEl = document.getElementById("user-name");
    if (userNameEl) {
        userNameEl.textContent = user.name;
    }

    // Mostrar ou esconder botões conforme papel
    if (!user.isAdmin) {
        document.querySelectorAll(".admin-only").forEach(el => {
    el.style.display = "none";
});
    }else {
              document.querySelectorAll(".user-only").forEach(el => {
            el.style.display = "none";
        });
         

    }

    
  // Ajustar link "Editar meu perfil" com ID do usuário
   
const editProfileLinks = document.querySelectorAll('a[href="./editar-membro.html"]');
editProfileLinks.forEach(link => {
    link.href = `./editar-membro.html?id=${user.id}`;
});

}
    
        
