const tipoSelect = document.getElementById("editTipo");
const submitBtn = document.getElementById("saveEdit");
const requiredByType = {
  1: ["co_titulo", "co_autor", "co_pdf", "co_citacao", "co_doi", "co_data", "co_imagem"], // Publicação
  2: ["co_titulo", "co_lide", "co_conteudo", "co_data", "co_autor", "co_imagem"], // Notícia
  3: ["co_titulo", "co_atividades", "co_status", "co_data_inicio", "co_data_termino", "co_autor", "co_imagem", "co_atividades"], // Projeto
  4: ["co_titulo", "co_data", "co_objetivo", "co_requisitos", "co_plano_trabalho", "co_atividades"] // Vaga
};

function atualizarCamposModal() {
  const tipo = tipoSelect.value;
  // Esconde todos os campos primeiro
  document.querySelectorAll("#editModal .field").forEach(f => {
    f.style.display = "none";
    const input = f.querySelector("input, textarea");
    if (input) input.required = false;
  });
  submitBtn.style.display = "none";

  if (!tipo) return; // Se não tem tipo selecionado, nada aparece

  // Mostra só os campos do tipo
  requiredByType[tipo].forEach(id => {
    const field = document.querySelector(`#editModal .field[data-field="${id}"]`);
    if (field) {
      field.style.display = "block";
      const input = field.querySelector("input, textarea");
      if (input) input.required = true;
    }
  });

  submitBtn.style.display = "block";
}


tipoSelect.addEventListener("change", atualizarCamposModal);
