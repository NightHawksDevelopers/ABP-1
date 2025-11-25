const tipoSelect = document.getElementById("co_tipo_conteudo");
const submitBtn = document.getElementById("submitBtn");

const requiredByType = {
    1: ["co_titulo", "co_pdf", "co_citacao", "co_doi", "co_data", "co_imagem"],                     // Publicação
    2: ["co_titulo", "co_lide", "co_conteudo", "co_data", "co_autor", "co_imagem"],                            // Notícia
    3: ["co_titulo", "co_atividades", "co_status", "co_data_inicio", "co_data_termino", "co_autor", "co_imagem"],  // Projeto
    4: ["co_titulo", "co_data", "co_objetivo", "co_requisitos", "co_plano_trabalho", "co_atividades"]             // Vaga
};

tipoSelect.addEventListener("change", () => {
    const tipo = tipoSelect.value;

    // Esconde tudo primeiro
    document.querySelectorAll(".field").forEach(f => {
        f.style.display = "none";
        const input = f.querySelector("input, textarea,select");
        if (input) input.required = false;
    });

    submitBtn.style.display = "none";

    if (!tipo) return;

    // Mostra apenas os campos desse tipo
    requiredByType[tipo].forEach(id => {
        const field = document.querySelector(`.field[data-field="${id}"]`);
        if (field) {
            field.style.display = "block";
            const input = field.querySelector("input, textarea, select");
            if (input) input.required = true;
        }
    });

    submitBtn.style.display = "block";
});
