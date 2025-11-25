/*
 * vagasPagination.js
 * Paginação automática esperando o evento do servidor.
 */

document.addEventListener("vagasCarregadas", () => {
  console.log(">>> Vagas carregadas. Iniciando sistema de paginação...");
  inicializarVagas();
});

function inicializarVagas() {
  // Seleciona os elementos (As caixas das vagas)
  const vagas = document.getElementsByClassName("va-content__block");
  let botaoProx = document.getElementById("prox");
  let botaoPrev = document.getElementById("prev");

  // Estado Global
  let estado = {
    paginaAtual: 0,
    itensPorPagina: 3, // Define quantas vagas aparecem por vez
    totalPaginas: 0,
  };

  if (vagas.length === 0) return;

  // --- FUNÇÃO PRINCIPAL: RENDERIZAR ---
  function renderizar() {
    // 1. Calcula total de páginas
    estado.totalPaginas = Math.ceil(vagas.length / estado.itensPorPagina) || 1;

    // Correção de limite
    if (estado.paginaAtual >= estado.totalPaginas) estado.paginaAtual = 0;

    // Intervalo de exibição
    const inicio = estado.paginaAtual * estado.itensPorPagina;
    const fim = inicio + estado.itensPorPagina;

    // 2. Controla Visibilidade
    // Esconde TUDO
    for (let i = 0; i < vagas.length; i++) {
      vagas[i].style.display = "none";
    }

    // Mostra SÓ os da página atual
    for (let i = 0; i < vagas.length; i++) {
      if (i >= inicio && i < fim) {
        vagas[i].style.display = "flex"; // No CSS original é flex
      }
    }

    // 3. Atualiza Botões
    atualizarBotoes();
  }

  function atualizarBotoes() {
    // Botão Próximo
    if (estado.paginaAtual >= estado.totalPaginas - 1) {
      botaoProx.style.opacity = "0";
      botaoProx.style.cursor = "default";
    } else {
      botaoProx.style.opacity = "1";
      botaoProx.style.cursor = "pointer";
    }

    // Botão Anterior
    if (estado.paginaAtual <= 0) {
      botaoPrev.style.opacity = "0";
      botaoPrev.style.cursor = "default";
    } else {
      botaoPrev.style.opacity = "1";
      botaoPrev.style.cursor = "pointer";
    }
  }

  // --- EVENTOS DOS BOTÕES ---

  // Limpeza de eventos antigos (Clone)
  const novoProx = botaoProx.cloneNode(true);
  botaoProx.parentNode.replaceChild(novoProx, botaoProx);
  botaoProx = novoProx;

  const novoPrev = botaoPrev.cloneNode(true);
  botaoPrev.parentNode.replaceChild(novoPrev, botaoPrev);
  botaoPrev = novoPrev;

  novoProx.onclick = (e) => {
    e.preventDefault();
    if (estado.paginaAtual < estado.totalPaginas - 1) {
      estado.paginaAtual++;
      renderizar();
      // Rola suavemente para o topo da lista de vagas
      document
        .getElementById("va-title")
        .scrollIntoView({ behavior: "smooth" });
    }
  };

  novoPrev.onclick = (e) => {
    e.preventDefault();
    if (estado.paginaAtual > 0) {
      estado.paginaAtual--;
      renderizar();
      document
        .getElementById("va-title")
        .scrollIntoView({ behavior: "smooth" });
    }
  };

  // Inicializa a primeira vez
  renderizar();
}
