async function findImage(base) {
  const exts = ["webp", "jpg", "png"];

  // Se o nome já termina com alguma extensão, só tenta ele direto
  if (/\.(webp|jpg|png)$/i.test(base)) {
    try {
      await check(base);
      console.log(`[findImage] SUCESSO! Imagem encontrada: ${base}`);
      return base;
    } catch (e) {
      console.warn(`[findImage] Nenhuma imagem encontrada para base: ${base}`);
      return null;
    }
  }

  // Senão, tenta cada extensão normalmente
  for (const ext of exts) {
    const path = `${base}.${ext}`;
    try {
      await check(path);
      console.log(`[findImage] SUCESSO! Imagem encontrada: ${path}`);
      return path;
    } catch (e) {
      // Tenta o próximo
      console.log(`[findImage] Falha ao carregar: ${path}`);
    }
  }

  console.warn(`[findImage] Nenhuma imagem encontrada para base: ${base}`);
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
   
      const imgPath = `http://localhost:3000/uploads/${noticia.co_imagem}`;
      document.getElementById('ni-img').src = imgPath;
  } catch (err) {
    console.error("Erro ao carregar notícia:", err);
  }
});
