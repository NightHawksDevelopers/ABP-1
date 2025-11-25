// --- Script para o PRIMEIRO carrossel ---
let count1 = 1;
document.getElementById("radio1").checked = true;

setInterval(function() {
    nextImage1();
}, 3000); 

function nextImage1() {
    count1++;
    if (count1 > 4) {
        count1 = 1;
    }
    document.getElementById("radio" + count1).checked = true;
}




document.addEventListener('DOMContentLoaded', () => {
        // Altere esta URL para a rota correta do seu backend
        const API_URL = 'http://localhost:3000/posts/ultimas'; // Exemplo, ajuste a porta e o caminho

        const noticiasListaContainer = document.querySelector('.ho-noticias-lista');
        // Mantemos o h2 e criamos uma div temporária para o conteúdo
        const h2Titulo = noticiasListaContainer.querySelector('h2'); 
        
        // Limpar os placeholders estáticos (noticia1.html, noticia2.html, etc.)
        noticiasListaContainer.innerHTML = ''; 
        if (h2Titulo) {
            noticiasListaContainer.appendChild(h2Titulo);
        }
        
        fetch(API_URL)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Erro ao carregar notícias da API.');
                }
                return response.json();
            })
            .then(noticias => {
                if (noticias.length === 0) {
                    noticiasListaContainer.innerHTML += '<p>Nenhuma notícia recente encontrada.</p>';
                    return;
                }

                noticias.forEach(noticia => {
                    const noticiaItem = document.createElement('a');
                    noticiaItem.classList.add('ho-noticia-item');
                    // Usar o id_conteudo para criar o link de detalhe
                    noticiaItem.href = `notindividual.html?id=${noticia.id_conteudo}`;
                    
                    // Montar o HTML do card
                    noticiaItem.innerHTML = `
                             <div class="ho-noticia-thumb-container">
                             <img class="ho-noticia-thumb" src="http://localhost:3000/uploads/${noticia.co_imagem}" 
                             onerror="this.onerror=null; this.src='../src/assets/image/pc_home_carrosel1.webp';" 
                             alt="${noticia.co_titulo}"
                            />
                            </div>
                       
                        <div class="ho-noticia-conteudo">
                            <h3 class="ho-noticia-titulo">${noticia.co_titulo}</h3>
                            <p class="ho-noticia-resumo">${noticia.co_lide}</p>
                            <span class="ho-noticia-mais">Ver mais</span>
                        </div>
                
                    `;
                    
                    noticiasListaContainer.appendChild(noticiaItem);
                });
            })
            .catch(error => {
                console.error('Erro no Fetch:', error);
                noticiasListaContainer.innerHTML += '<p>Não foi possível carregar as notícias.</p>';
            });
    });