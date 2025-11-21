/*
 * filtropub.js FINAL (Estilo appProjetos)
 * Paginação (6 por página) + Filtro de Ano, Autor e Palavra-chave.
 */

document.addEventListener("publicacoesCarregadas", () => {
  console.log(">>> Publicações carregadas. Iniciando sistema de paginação...");
  inicializarAppPubs();
});

function inicializarAppPubs() {
  // Seleciona os elementos
  const itens = document.getElementsByClassName("pub-pub"); // As divs que contêm os cards
  let botaoProx = document.getElementById("prox");
  let botaoPrev = document.getElementById("prev");
  const formFiltro = document.getElementById("pr-filter");

  // Estado Global
  let estado = {
    paginaAtual: 0,
    itensPorPagina: 6, // Pedido: 6 itens por página
    totalPaginas: 0,
  };

  if (itens.length === 0) return;

  // --- FUNÇÃO PRINCIPAL: RENDERIZAR ---
  function renderizar() {
    // 1. Identifica quem são os candidatos válidos
    let validos = [];

    for (let i = 0; i < itens.length; i++) {
      // Se não tiver a classe 'filtro-bloqueado', é válido
      if (!itens[i].classList.contains("filtro-bloqueado")) {
        validos.push(itens[i]);
      }
    }

    // 2. Cálculos de Paginação
    estado.totalPaginas =
      Math.ceil(validos.length / estado.itensPorPagina) || 1;

    // Correção de limite
    if (estado.paginaAtual >= estado.totalPaginas) estado.paginaAtual = 0;

    const inicio = estado.paginaAtual * estado.itensPorPagina;
    const fim = inicio + estado.itensPorPagina;

    // 3. Aplica a visibilidade
    // Esconde TUDO
    for (let i = 0; i < itens.length; i++) {
      itens[i].style.display = "none";
    }

    // Mostra SÓ os válidos da página atual
    for (let i = 0; i < validos.length; i++) {
      if (i >= inicio && i < fim) {
        // No CSS original, .pub-pub tem display: flex
        validos[i].style.display = "flex";
      }
    }

    // 4. Atualiza Botões
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
  // (Mesma lógica de clonar e atualizar referência para limpar eventos antigos)

  const novoProx = botaoProx.cloneNode(true);
  botaoProx.parentNode.replaceChild(novoProx, botaoProx);
  botaoProx = novoProx; // Atualiza a referência

  const novoPrev = botaoPrev.cloneNode(true);
  botaoPrev.parentNode.replaceChild(novoPrev, botaoPrev);
  botaoPrev = novoPrev; // Atualiza a referência

  novoProx.onclick = (e) => {
    e.preventDefault();
    if (estado.paginaAtual < estado.totalPaginas - 1) {
      estado.paginaAtual++;
      renderizar();
      // Rola até o topo da lista
      document
        .querySelector(".pubs-grid")
        .scrollIntoView({ behavior: "smooth" });
    }
  };

  novoPrev.onclick = (e) => {
    e.preventDefault();
    if (estado.paginaAtual > 0) {
      estado.paginaAtual--;
      renderizar();
      document
        .querySelector(".pubs-grid")
        .scrollIntoView({ behavior: "smooth" });
    }
  };

  // --- EVENTO DO FILTRO ---
  const novoForm = formFiltro.cloneNode(true);
  formFiltro.parentNode.replaceChild(novoForm, formFiltro);

  novoForm.onsubmit = (e) => {
    e.preventDefault();

    // Valores dos inputs
    const valorKey = document
      .getElementById("palavra-chave")
      .value.toLowerCase();
    const valorAno = document.getElementById("pr-date").value; // Input type number
    const valorAutor = document.getElementById("pr-nome").value.toLowerCase();

    for (let i = 0; i < itens.length; i++) {
      // Extração de dados do card
      const textoCompleto = itens[i].textContent.toLowerCase();
      const autoresTexto = itens[i]
        .querySelector(".pub-authors")
        .textContent.toLowerCase();

      // Tenta achar o ano no formato "(2025)" dentro do texto de autores
      let anoEncontrado = "";
      const match = autoresTexto.match(/\((\d{4})\)/);
      if (match && match[1]) {
        anoEncontrado = match[1];
      }

      let bloqueado = false;

      // 1. Filtro Palavra-Chave
      if (valorKey && !textoCompleto.includes(valorKey)) bloqueado = true;

      // 2. Filtro Autor
      // Ignora se o valor for "autor" (padrão do HTML antigo) ou vazio
      if (
        valorAutor &&
        valorAutor !== "autor" &&
        !autoresTexto.includes(valorAutor)
      ) {
        bloqueado = true;
      }

      // 3. Filtro Ano
      if (valorAno && anoEncontrado !== valorAno) bloqueado = true;

      // Aplica bloqueio
      if (bloqueado) {
        itens[i].classList.add("filtro-bloqueado");
      } else {
        itens[i].classList.remove("filtro-bloqueado");
      }
    }

    // Reseta para a primeira página ao filtrar
    estado.paginaAtual = 0;
    renderizar();
  };

  // Renderiza a primeira vez
  renderizar();
}
