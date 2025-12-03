document.addEventListener("DOMContentLoaded", () => {
  const switches = document.querySelectorAll('.sw-switch input');

  switches.forEach((checkbox) => {
    const circle = checkbox.parentElement.querySelector('.sw-circle');

    if (!circle) return;

    checkbox.addEventListener('change', () => {

      // Se estiver mudando de pt-br para inglês
      if (checkbox.checked) {
        showModal();
      } else {
        // Vai direto para a versão pt-br
        redirectLanguage(false);
      }

      const onTransitionEnd = (e) => {
        if (e.propertyName === 'transform') {
          circle.removeEventListener('transitionend', onTransitionEnd);
        }
      };

      circle.addEventListener('transitionend', onTransitionEnd);
    });
  });

  function showModal() {
    // Cria o modal
    const modal = document.createElement('div');
    modal.id = "lang-modal";
    modal.style.position = "fixed";
    modal.style.top = 0;
    modal.style.left = 0;
    modal.style.width = "100%";
    modal.style.height = "100%";
    modal.style.background = "rgba(0,0,0,0.6)";
    modal.style.display = "flex";
    modal.style.alignItems = "center";
    modal.style.justifyContent = "center";
    modal.style.zIndex = 1000;

    const content = document.createElement('div');
    content.style.background = "#fff";
    content.style.padding = "20px";
    content.style.borderRadius = "10px";
    content.style.maxWidth = "400px";
    content.style.textAlign = "center";
    content.innerHTML = `
      <p style="margin-bottom: 20px;">The website content may not have full English versions.</p>
      <button id="modal-ok" style="padding: 10px 20px; cursor:pointer;">OK</button>
    `;

    modal.appendChild(content);
    document.body.appendChild(modal);

    // Quando clicar OK, fecha o modal e faz a tradução
    document.getElementById("modal-ok").addEventListener("click", () => {
      document.body.removeChild(modal);
      redirectLanguage(true);
    });
  }

  function redirectLanguage(toEnglish) {
    let currentPath = window.location.pathname;

    if (toEnglish) {
      currentPath = currentPath.replace("/pages/", "/en-pages/");
    } else {
      currentPath = currentPath.replace("/en-pages/", "/pages/");
    }

    window.location.href = currentPath;
  }
});
