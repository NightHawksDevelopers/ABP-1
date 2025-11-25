document.addEventListener("DOMContentLoaded", async () => {
  const container = document.querySelector("main section");
  const insertionPoint = container.querySelector(".main-buttons-pos");

  try {
    const res = await fetch("http://localhost:3000/posts?tipo=3");
    const data = await res.json();

    const staticArticles = container.querySelectorAll("article");
    staticArticles.forEach((article) => article.remove());

    // --- MUDANÇA 1: Mapa para traduzir os números do banco ---
    const mapaStatus = {
      1: "Concluido",
      2: "Em andamento",
      3: "Agendado"
    };

    data.sort((a, b) => new Date(b.co_data_inicio) - new Date(a.co_data_inicio));
    
    data.forEach((projeto) => {
      const article = document.createElement("article");

      const dataInicio = new Date(projeto.co_data_inicio).toLocaleDateString(
        "pt-BR",
        { day: "2-digit", month: "2-digit", year: "numeric" }
      );
      const dataTermino = new Date(projeto.co_data_termino).toLocaleDateString(
        "pt-BR",
        { day: "2-digit", month: "2-digit", year: "numeric" }
      );

      let dataFormatadaFiltro = "";
      if (projeto.co_data_inicio) {
        // Garante que é uma string e pega os 10 primeiros chars (ex: 2007-10-31)
        dataFormatadaFiltro = String(projeto.co_data_inicio).substring(0, 10);
      }

      // Traduz o número (1, 2, 3) para texto. Se não achar, usa "Desconhecido"
      const statusTexto = mapaStatus[projeto.co_status] || "Desconhecido";

      article.innerHTML = `
      <a class="article-link" href="./projetoindividual.html?id=${projeto.id_conteudo}">

      
      <img class="article-img"
            src="http://localhost:3000/uploads/${projeto.co_imagem}" 
            onerror="this.onerror=null; this.src='../src/assets/image/pc_home_carrosel1.webp';" 
            alt="${projeto.co_titulo}"
        />
        <div class="article-text">
            <h2 class="article-title">${projeto.co_titulo}</h2>
        
          <p>${projeto.co_atividades}</p> 
          
          <h5>Situação: ${mapaStatus[projeto.co_status]}</h5> 
          
          <h6 data-date="${dataFormatadaFiltro}">Data de inicio: ${dataInicio}</h6>
          <h6 data-date="${dataFormatadaFiltro}">Data de término: ${dataTermino}</h6>

        </div>
          </a>
      `;

      container.insertBefore(article, insertionPoint);
    });

    // --- MUDANÇA 2: Avisar o outro script que terminou ---
    // Dispara um evento personalizado chamado "projetosCarregados"
    const eventoPronto = new Event("projetosCarregados");
    document.dispatchEvent(eventoPronto);
  } catch (err) {
    console.error("Erro ao carregar projetos:", err);
    const errorMsg = document.createElement("p");
    errorMsg.textContent = "Não foi possível carregar os projetos no momento.";
    errorMsg.style.textAlign = "center";
    errorMsg.style.color = "#fff";
    container.insertBefore(errorMsg, insertionPoint);
  }
});
