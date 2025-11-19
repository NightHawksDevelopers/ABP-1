/*
 * Este é o script de filtro ATUALIZADO.
 *
 * Ele agora resolve os 2 problemas:
 * 1. (TIMING): Usa um "Vigia" (MutationObserver) para esperar
 * o publicacoes.js carregar os posts antes de ativar o filtro.
 *
 * 2. (LÓGICA DA DATA): "Caça" o ano (ex: 2007) de dentro do
 * texto (ex: "Por Autor (2007)"), já que não podemos
 * mexer no publicacoes.js para adicionar o data-date.
 */
document.addEventListener("DOMContentLoaded", () => {
  // 1. Pegar os elementos-chave
  const formFiltro = document.getElementById("pr-filter");
  const grid = document.querySelector(".pubs-grid"); // Onde os posts são injetados

  if (!formFiltro || !grid) {
    console.error(
      "ERRO: O formulário de filtro ou a 'grid' de publicações não foram encontrados."
    );
    return;
  }

  // 2. Esta é a função do filtro (o seu código antigo, mas com correções)
  //    Ela SÓ vai ser ativada DEPOIS que o observador rodar.
  function aplicarFiltro(event) {
    event.preventDefault();

    // Esta linha agora roda SÓ DEPOIS que os posts existem
    const post = document.getElementsByClassName("pub-pub");

    let valorKeyWord = document
      .getElementById("palavra-chave")
      .value.toLowerCase();
    let valorData = document.getElementById("pr-date").value; // Pega o ANO (ex: "2007")
    let valorNome = document.getElementById("pr-nome").value.toLowerCase(); // Pega o AUTOR

    for (let i = 0; i < post.length; i++) {
      let textPostCompleto = post[i].textContent.toLowerCase();

      // Lógica do Autor (Mantida, já estava correta)
      let autoresPostEl = post[i].querySelector(".pub-authors");
      let autoresPostTexto = "";

      if (autoresPostEl) {
        autoresPostTexto = autoresPostEl.textContent.toLowerCase();
      }

      // --- CORREÇÃO DA DATA (PROBLEMA 2) ---
      // Nova lógica para "caçar" o ano (ex: 2007) do texto (ex: "Por Autor (2007)")
      let anoPost = "";
      const regexAno = /\((\d{4})\)/; // Regex para achar (XXXX)
      const match = autoresPostTexto.match(regexAno);

      if (match && match[1]) {
        anoPost = match[1]; // Pega o "2007"
      }
      // --- Fim da Correção ---

      let mostrarEstePost = true;

      if (valorKeyWord !== "" && !textPostCompleto.includes(valorKeyWord)) {
        mostrarEstePost = false;
      }

      // Lógica do Autor (funciona no texto "por autor (2007)")
      if (
        mostrarEstePost &&
        valorNome !== "" &&
        !autoresPostTexto.includes(valorNome)
      ) {
        mostrarEstePost = false;
      }

      // Lógica da Data (agora compara "2007" === "2007")
      if (mostrarEstePost && valorData !== "" && anoPost !== valorData) {
        mostrarEstePost = false;
      }

      if (mostrarEstePost) {
        post[i].style.display = "flex";
      } else {
        post[i].style.display = "none";
      }
    }
  }

  // 3. Configurar o "Vigia" (MutationObserver)
  // --- CORREÇÃO DO TIMING (PROBLEMA 1) ---
  const observer = new MutationObserver((mutationsList, obs) => {
    // Vamos checar se algum .pub-pub foi adicionado
    let postAdicionado = false;
    for (const mutation of mutationsList) {
      if (mutation.type === "childList" && mutation.addedNodes.length > 0) {
        for (const node of mutation.addedNodes) {
          // Checa se o nó é um elemento e se tem a classe 'pub-pub'
          if (node.nodeType === 1 && node.classList.contains("pub-pub")) {
            postAdicionado = true;
            break;
          }
        }
      }
      if (postAdicionado) break;
    }

    if (postAdicionado) {
      // CONSEGUIMOS! Os posts começaram a ser carregados.
      console.log("Observador: Posts detectados. Ativando o filtro.");

      // 1. Ativa o filtro: (só adiciona o 'submit' AGORA)
      formFiltro.addEventListener("submit", aplicarFiltro);

      // 2. Para de vigiar (trabalho concluído)
      obs.disconnect();
    }
  });

  // 4. Ligar o "Vigia"
  // Manda ele observar o 'grid' e avisar sobre adição de filhos.
  observer.observe(grid, { childList: true });
  console.log(
    "Observador (Vigia) ligado. Esperando posts do publicacoes.js..."
  );
});
