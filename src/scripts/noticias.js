document.addEventListener("noticiasCarregadas", () => {
  console.log(">>> Notícias carregadas. Iniciando sistema de paginação...");
  inicializarNoticias();
});

function inicializarNoticias() {

  const news = document.getElementsByClassName("no-content");
  let botaoProx = document.getElementById("prox");
  let botaoPrev = document.getElementById("prev");


  let estado = {
    paginaAtual: 0,
    itensPorPagina: 3, 
    totalPaginas: 0,
  };

  if (news.length === 0) return;


  function renderizar() {
    
    estado.totalPaginas = Math.ceil(news.length / estado.itensPorPagina) || 1;

    
    if (estado.paginaAtual >= estado.totalPaginas) estado.paginaAtual = 0;

    
    const inicio = estado.paginaAtual * estado.itensPorPagina;
    const fim = inicio + estado.itensPorPagina;

    
    for (let i = 0; i < news.length; i++) {
      news[i].style.display = "none";
    }

    
    for (let i = 0; i < news.length; i++) {
      if (i >= inicio && i < fim) {
        news[i].style.display = "flex"; 
      }
    }

    
    atualizarBotoes();
  }

  function atualizarBotoes() {
    
    if (estado.paginaAtual >= estado.totalPaginas - 1) {
      botaoProx.style.opacity = "0"; 
      botaoProx.style.cursor = "default";
    } else {
      botaoProx.style.opacity = "1"; 
      botaoProx.style.cursor = "pointer";
    }

    
    if (estado.paginaAtual <= 0) {
      botaoPrev.style.opacity = "0"; 
      botaoPrev.style.cursor = "default";
    } else {
      botaoPrev.style.opacity = "1"; 
      botaoPrev.style.cursor = "pointer";
    }
  }


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
      
      document
        .querySelector(".noticias-grid")
        .scrollIntoView({ behavior: "smooth" });
    }
  };

  novoPrev.onclick = (e) => {
    e.preventDefault();
    
    if (estado.paginaAtual > 0) {
      estado.paginaAtual--;
      renderizar();
      document
        .querySelector(".noticias-grid")
        .scrollIntoView({ behavior: "smooth" });
    }
  };

  
  renderizar();
}
