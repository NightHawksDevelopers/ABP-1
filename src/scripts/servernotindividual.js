async function findImage(base) {
  const exts = ["webp", "jpg", "png"];
  console.log(`[findImage] Buscando imagem com base: ${base}`); // LOG 1

  const check = (url) =>
    new Promise((resolve, reject) => {
      const img = new Image();
      img.onload = () => resolve(url);
      img.onerror = () => {
        console.log(`[findImage] Falha ao carregar: ${url}`); // LOG 2
        reject();
      };
      img.src = url;
    });

  for (const ext of exts) {
    const path = `${base}.${ext}`;
    try {
      await check(path);
      console.log(`[findImage] SUCESSO! Imagem encontrada: ${path}`); // LOG 3
      return path;
    } catch (e) {
      // Tenta o próximo
    }
  }
  console.warn(`[findImage] Nenhuma imagem encontrada para base: ${base}`); // LOG 4
  return null;
}

/*
  Nosso script principal
*/
document.addEventListener("DOMContentLoaded", async () => {
  try {
    const params = new URLSearchParams(window.location.search);
    const id = parseInt(params.get("id"));
    console.log(`[Noticia Individual] ID da URL: ${id}`); // LOG A

    if (!id) {
      console.error("Notícia não encontrada (sem ID)");
      return;
    }

    const res = await fetch(`http://localhost:3000/posts/${id}`);
    const noticia = await res.json();
    console.log("[Noticia Individual] Dados recebidos:", noticia); // LOG B

    if (!noticia) {
      console.error("Notícia não encontrada no backend");
      return;
    }

    // Atualiza HTML
    document.querySelector(".ni-title h1").textContent =
      noticia.co_titulo || "";
    document.querySelector(".ni-title p").textContent = noticia.co_lide || "";
    document.querySelector(".ni-date p").textContent = noticia.co_data
      ? `Publicada em ${new Date(noticia.co_data).toLocaleDateString()}`
      : "";
    document.querySelector(".ni-text p").innerHTML = noticia.co_conteudo
      ? noticia.co_conteudo.replace(/\n/g, "<br>")
      : "";
    // (Pode adicionar .ni-author e .ni-reference se tiver no HTML)

    // IMAGEM
    const imgDiv = document.querySelector(".ni-img");
    const base = `./backend/uploads/${noticia.co_imagem}`;

    const imageUrl = await findImage(base); // Usa a função mestre

    if (imageUrl) {
      imgDiv.style.backgroundImage = `url('${imageUrl}')`;
    }
    // Se não achou, deixa a imagem padrão do CSS
  } catch (err) {
    console.error("Erro ao carregar notícia:", err);
  }
});
