const apiUrl = "http://localhost:3000/posts";
const userData = JSON.parse(localStorage.getItem("user"));

let currentFilter = ""; // variável global para armazenar filtro atual

// Mapeamento de tipos
const tipoMap = {
  1: "Publicações",
  2: "Notícias",
  3: "Projetos",
  4: "Vagas de Estágio"
};

// =============================
// FILTRO POR TIPO
// =============================
document.getElementById("filterTipo").addEventListener("change", e => {
  currentFilter = e.target.value;
  loadConteudos(currentFilter);
});

// =============================
// CARREGAR CONTEÚDOS
// =============================
async function loadConteudos(tipo = "") {
  const url = tipo ? `${apiUrl}?tipo=${tipo}` : apiUrl;
  const res = await fetch(url);
  let data = await res.json();

  if (!userData.isAdmin) {
    // Supondo que cada post tem 'coautor' como identificador do usuário autor
    data = data.filter(post => post.co_publicante == userData.id);
  }

  // Ordenar por id_conteudo
  data.sort((a, b) => a.id_conteudo - b.id_conteudo);

  const tbody = document.querySelector("#conteudoTable tbody");
  tbody.innerHTML = "";

  data.forEach(c => {
    const tr = document.createElement("tr");
    tr.innerHTML = `
      <td>${c.id_conteudo}</td>
      <td>${c.co_titulo}</td>
      <td>${c.co_autor}</td>
      <td>${tipoMap[c.co_tipo_conteudo] || c.co_tipo_conteudo}</td>
      <td>${c.co_data || c.co_data_inicio}</td>
      <td class="actions">
        <button type="button" class="edit" onclick="editConteudo(${c.id_conteudo})">Editar</button>
        <button class="delete" onclick="deleteConteudo(${c.id_conteudo})">Excluir</button>
      </td>
    `;
    tbody.appendChild(tr);
  });
}

// =============================
// EDITAR CONTEÚDO
// =============================
let editingId = null;

async function editConteudo(id){
  console.log("Abrindo modal para ID:", id); // DEPURAÇÃO
  

  editingId = id;
  currentFilter = document.getElementById("filterTipo").value; // salva filtro atual
  console.log("Filtro salvo:", currentFilter);
  atualizarCamposModal();

  const res = await fetch(`${apiUrl}/${id}`);
  const data = await res.json();

  document.getElementById("editTitulo").value = data.co_titulo;
  document.getElementById("editLide").value = data.co_lide;
  document.getElementById("editAutor").value = data.co_autor || data.autor_nome;
  document.getElementById("editTipo").value = data.co_tipo_conteudo;
  document.getElementById("editPdf").value = data.co_pdf;
  document.getElementById("editCitacao").value = data.co_citacao;
  document.getElementById("editDoi").value = data.co_doi;
  document.getElementById("editStatus").value = data.co_status;
  document.getElementById("editObjetivo").value = data.co_objetivo;
  document.getElementById("editRequisitos").value = data.co_requisitos;
  document.getElementById("editPlano").value = data.co_plano_trabalho;
  document.getElementById("editAtividades").value = data.co_atividades;
  document.getElementById("editConteudo").value = data.co_conteudo;
  document.getElementById("editData").value = data.co_data ? data.co_data.split("T")[0] : "";
  document.getElementById("editDataInicio").value = data.co_data_inicio;
  document.getElementById("editDataTermino").value = data.co_data_termino;

    atualizarCamposModal();


  document.getElementById("editModal").style.display = "flex";
}

async function saveEdit() {
  const formData = new FormData();
  
  
  formData.append("co_titulo", document.getElementById("editTitulo").value);
  formData.append("co_lide", document.getElementById("editLide").value);
  formData.append("co_autor", document.getElementById("editAutor").value);
  formData.append("co_tipo_conteudo", document.getElementById("editTipo").value);
  formData.append("co_pdf", document.getElementById("editPdf").value);
  formData.append("co_citacao", document.getElementById("editCitacao").value);
  formData.append("co_doi", document.getElementById("editDoi").value);
  formData.append("co_status", document.getElementById("editStatus").value);
  formData.append("co_objetivo", document.getElementById("editObjetivo").value);
  formData.append("co_requisitos", document.getElementById("editRequisitos").value);
  formData.append("co_plano_trabalho", document.getElementById("editPlano").value); 
  formData.append("co_atividades", document.getElementById("editAtividades").value);
  formData.append("co_conteudo", document.getElementById("editConteudo").value); 
  formData.append("co_data", document.getElementById("editData").value);
  formData.append("co_data_inicio", document.getElementById("editDataInicio").value);
  formData.append("co_data_termino", document.getElementById("editDataTermino").value);

 
  const fileInput = document.getElementById("editImagem");
  if (fileInput.files.length > 0) {
    formData.append("imagem", fileInput.files[0]);
  }

  try {
    const res = await fetch(`${apiUrl}/${editingId}`, {
        method: "PUT",
        body: formData
    });

    if (res.ok) {
        closeModal();
        // Recarrega a lista mantendo o filtro atual
        loadConteudos(currentFilter);
        alert("Edição realizada com sucesso!");
    } else {
        const errorText = await res.text();
        console.error("Erro no backend:", errorText);
        alert("Erro ao salvar. Verifique o console.");
    }
  } catch (error) {
      console.error("Erro na requisição:", error);
      alert("Erro de conexão ao tentar salvar.");
  }
}


function closeModal() {
  document.getElementById("editModal").style.display = "none";
}

// =============================
// EXCLUIR CONTEÚDO
// =============================
async function deleteConteudo(id) {
  if (!confirm("Deseja realmente excluir este conteúdo?")) return;
  await fetch(`${apiUrl}/${id}`, { method: "DELETE" });
  loadConteudos(currentFilter);
}

// =============================
// CARREGAR CONTEÚDOS AO INICIAR
// =============================
loadConteudos();
