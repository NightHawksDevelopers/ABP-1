/*
 * appProjetos.js FINAL
 * Filtro e Paginação com botões que desaparecem quando não são necessários.
 */

document.addEventListener("projetosCarregados", () => {
  console.log(">>> Projetos carregados. Iniciando sistema...");
  inicializarApp();
});

function inicializarApp() {
  const articles = document.getElementsByTagName("article");
  let botaoProx = document.getElementById("prox");
  let botaoPrev = document.getElementById("prev");
  const formFiltro = document.getElementById("pr-filter");

  // Estado Global da Aplicação
  let estado = {
    paginaAtual: 0,
    itensPorPagina: 3,
    totalPaginas: 0,
  };

  if (articles.length === 0) return;

  // --- FUNÇÃO PRINCIPAL: RENDERIZAR ---
  function renderizar() {
    // 1. Identifica quem são os candidatos válidos (quem NÃO foi bloqueado pelo filtro)
    let validos = [];

    for (let i = 0; i < articles.length; i++) {
      // Se não tiver a classe 'filtro-bloqueado', é um item válido
      if (!articles[i].classList.contains("filtro-bloqueado")) {
        validos.push(articles[i]);
      }
    }

    // 2. Calcula matemática da paginação
    estado.totalPaginas =
      Math.ceil(validos.length / estado.itensPorPagina) || 1;

    // Correção de limite (se filtrar e sobrar pouca coisa, volta pra pág 0)
    if (estado.paginaAtual >= estado.totalPaginas) estado.paginaAtual = 0;

    // Intervalo de exibição
    const inicio = estado.paginaAtual * estado.itensPorPagina;
    const fim = inicio + estado.itensPorPagina;

    // 3. Aplica a visibilidade
    // Primeiro, esconde TUDO
    for (let i = 0; i < articles.length; i++) {
      articles[i].style.display = "none";
    }

    // Agora, mostra SÓ quem é válido E está na página certa
    for (let i = 0; i < validos.length; i++) {
      if (i >= inicio && i < fim) {
        validos[i].style.display = "flex";
      }
    }

    // 4. Atualiza Botões
    atualizarBotoes();
  }

  function atualizarBotoes() {
    // Botão Próximo
    if (estado.paginaAtual >= estado.totalPaginas - 1) {
      botaoProx.style.opacity = "0"; // Invisível
      botaoProx.style.cursor = "default";
    } else {
      botaoProx.style.opacity = "1"; // Visível
      botaoProx.style.cursor = "pointer";
    }

    // Botão Anterior
    if (estado.paginaAtual <= 0) {
      botaoPrev.style.opacity = "0"; // Invisível
      botaoPrev.style.cursor = "default";
    } else {
      botaoPrev.style.opacity = "1"; // Visível
      botaoPrev.style.cursor = "pointer";
    }
  }

  // --- EVENTOS DOS BOTÕES ---

  // Limpeza total dos eventos antigos
  const novoProx = botaoProx.cloneNode(true);
  botaoProx.parentNode.replaceChild(novoProx, botaoProx);
  botaoProx = novoProx;

  const novoPrev = botaoPrev.cloneNode(true);
  botaoPrev.parentNode.replaceChild(novoPrev, botaoPrev);
  botaoPrev = novoPrev;

  novoProx.onclick = (e) => {
    e.preventDefault();
    // Só avança se não for a última página
    if (estado.paginaAtual < estado.totalPaginas - 1) {
      estado.paginaAtual++;
      renderizar();
      document.querySelector("section").scrollIntoView({ behavior: "smooth" });
    }
  };

  novoPrev.onclick = (e) => {
    e.preventDefault();
    // Só volta se não for a primeira página
    if (estado.paginaAtual > 0) {
      estado.paginaAtual--;
      renderizar();
      document.querySelector("section").scrollIntoView({ behavior: "smooth" });
    }
  };

  // --- EVENTO DO FILTRO ---
  const novoForm = formFiltro.cloneNode(true);
  formFiltro.parentNode.replaceChild(novoForm, formFiltro);

  novoForm.onsubmit = (e) => {
    e.preventDefault();

    const valorKey = document
      .getElementById("palavra-chave")
      .value.toLowerCase();
    const valorStatus = document
      .getElementById("pr-status")
      .value.toLowerCase();
    const valorData = document.getElementById("pr-date").value;
    const valorNome = document.getElementById("pr-nome").value.toLowerCase();

    // Passa por todos os artigos e marca quem deve ser bloqueado
    for (let i = 0; i < articles.length; i++) {
      const texto = articles[i].textContent.toLowerCase();
      const titulo = articles[i].querySelector("h2").textContent.toLowerCase();
      const status = articles[i].querySelector("h5").textContent.toLowerCase();
      const data = articles[i].querySelector("h6").dataset.date;

      let bloqueado = false;

      if (valorKey && !texto.includes(valorKey)) bloqueado = true;
      if (valorNome && valorNome !== "nome" && !titulo.includes(valorNome))
        bloqueado = true;
      if (valorStatus && !status.includes(valorStatus)) bloqueado = true;
      if (valorData && data !== valorData) bloqueado = true;

      // Aplica a etiqueta de bloqueio
      if (bloqueado) {
        articles[i].classList.add("filtro-bloqueado");
      } else {
        articles[i].classList.remove("filtro-bloqueado");
      }
    }

    // Reseta para página 0 sempre que filtrar
    estado.paginaAtual = 0;
    renderizar();
  };

  // Inicializa a primeira vez
  renderizar();
}
