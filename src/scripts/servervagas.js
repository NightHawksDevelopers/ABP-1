document.addEventListener("DOMContentLoaded", async () => {
  // 1. Pega o container certo da sua página vagas.html
  const containerVagas = document.getElementById("va-content");

  try {
    // 2. CORREÇÃO AQUI: Vaga é 'tipo=4' no seu BD
    const res = await fetch("http://localhost:3000/posts?tipo=4");
    const data = await res.json();

    data.sort((a, b) => {
      // Transforma as strings de data em objetos Date reais para comparar
      // b - a = Ordem Decrescente (Mais nova primeiro)
      return new Date(b.co_data) - new Date(a.co_data);
    });

    // 3. Limpa os blocos estáticos (os exemplos do HTML)
    containerVagas.innerHTML = "";

    // 4. Cria os blocos de vagas dinamicamente
    data.forEach((vaga) => {
      const div = document.createElement("div");
      // Usa a classe principal do bloco de vaga
      div.classList.add("va-content__block");

      // Formata a data (pegando do BD)
      const dataPublicacao = new Date(vaga.co_data).toLocaleDateString(
        "pt-BR",
        {
          day: "2-digit",
          month: "long",
          year: "numeric",
        }
      );

      // 5. Monta o HTML com os nomes CORRETOS do BD
      //    (co_titulo, co_objetivo, co_data, id_conteudo)
      div.innerHTML = `
        <a href="./vaga-individual.html?id=${vaga.id_conteudo}">
          <h2 class="va-content__block-title">
             ${vaga.co_titulo}
          </h2>

          <p class="va-content__block-desc">${vaga.co_objetivo}</p>

          <p class="va-content__block-date">Publicado em <em>${dataPublicacao}</em></p>
        </a>
      `;

      // Joga o bloco pronto dentro do container
      containerVagas.appendChild(div);
    });

    // --- NOVO: Avisa que as vagas chegaram ---
    const eventoPronto = new Event("vagasCarregadas");
    document.dispatchEvent(eventoPronto);

  } catch (err) {
    console.error("Erro ao carregar vagas:", err);
    // Mensagem de fallback caso a API dê pau
    containerVagas.innerHTML =
      "<p style='text-align: center; color: #fff;'>Deu ruim, mano. Não carregou as vagas.</p>";
  }
});
