const statusMap = {
  1: "Concluído",
  2: "Em andamento",
  3: "Agendado"
}

document.addEventListener("DOMContentLoaded", async () => {
  try {
    const params = new URLSearchParams(window.location.search);
    const id = parseInt(params.get("id"));
    console.log(`[Projeto Individual] ID da URL: ${id}`); // LOG A

    if (!id) {
      console.error("Projeto não encontrada (sem ID)");
      return;
    }

    const res = await fetch(`http://localhost:3000/posts/${id}`);
    const projeto = await res.json();
    console.log("Projeto Individual] Dados recebidos:", projeto); // LOG B

    if (!projeto) {
      console.error("Projeto não encontrada no backend");
      return;
    }

    // Atualiza HTML
    document.querySelector(".pi-title h1").textContent =
      projeto.co_titulo || "";
    document.querySelector(".pi-title p").textContent =
    "Autor: " + projeto.co_autor;
    document.querySelector("#statusProjeto").textContent =
    "Situação: " + statusMap[projeto.co_status]
    document.querySelector(".pi-date p").textContent = projeto.co_data
      ? `Publicada em ${new Date(projeto.co_data).toLocaleDateString()}`
      : "";
    document.querySelector(".pi-text p").innerHTML = projeto.co_atividades
      ? projeto.co_atividades.replace(/\n/g, "<br>")
      : "";
   
      const imgPath = `http://localhost:3000/uploads/${projeto.co_imagem}`;
      document.getElementById('pi-img').src = imgPath;
  } catch (err) {
    console.error("Erro ao carregar projeto:", err);
  }
});
