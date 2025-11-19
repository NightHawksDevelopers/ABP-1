# ABP 1º Semestre DSM

# Documentação - Sprint 2

<p align="center">
  <a href ="#desafio"> Desafio</a>  |
  <a href ="#us"> Backlog</a>  |   
  <a href ="#dor">DoR</a>  |
  <a href ="#dod">DoD</a>  |
  <a href ="#equipe"> Equipe</a> |
<a href ="#burndown"> Burndown</a>
</p>

> Status da Sprint: Finalizado ✅
>
> [Sprint 2 no YouTube](https://www.youtube.com/watch?v=tCPADslzZis) 📽️

##  Burndown Chart 📉🔥 <a id="burndown"></a>

<p align="center">
  <img src="Burndown_spr2.png" alt="BurnDown Sprint 2" width="400px" />
</p>


##  Desafio <a id="desafio"></a>

Desenvolver banco de dados iniciando através da 'entidade-relação' e dar início à programação do banco de dados. Realização do CRUD de páginas necessárias; script de funcionalidades dos botões.

##  Backlog e progresso <a id="us"></a>

<table>
  <tr>
    <td>

      <p><strong>🏷️ Legendas Tasks</strong></p>

      <table>
        <tr><th>Sigla</th><th>Descrição</th></tr>
        <tr><td><strong>DD</strong></td><td>Design Digital</td></tr>
        <tr><td><strong>DW</strong></td><td>Desenvolvimento Web</td></tr>
        <tr><td><strong>ES</strong></td><td>Engenharia de Software</td></tr>
        <tr><td><strong>AL</strong></td><td>Algoritmos e Lógica de Programação</td></tr>
        <tr><td><strong>MB</strong></td><td>Modelagem de Banco de Dados</td></tr>
        <tr><td><strong>SO</strong></td><td>Sistemas Operacionais e Redes</td></tr>
      </table>

    </td>

    <td style="padding-left: 40px;">

      <p><strong>🏷️ Legendas Backlog ID</strong></p>

      <table>
        <tr><th>Sigla</th><th>Descrição</th></tr>
        <tr><td>RF</td><td>Requisito funcional</td></tr>
        <tr><td>RNF</td><td>Requisito não funcional</td></tr>
      </table>

    </td>
  </tr>
</table>



| Backlog ID | Task                  | Tipo do item   | Descrição                                    | Prioridade | Especifidades                                                                                                                         | Pontuação | Status    | Tecnologias utilizadas      | Prazo    |
|------------|-----------------------|----------------|----------------------------------------------|------------|---------------------------------------------------------------------------------------------------------------------------------------|-----------|-----------|-----------------------------|----------|
|            | BD-001,BD-002         | BANCO DE DADOS | CRIAÇÃO DE UM ESQUEMA DE ENTIDADE RELACIONAL | Alta       | Criar um esquema de entidade relacional do banco de dados que será utilizado                                                          | 5         | ✅ | DBDesigner, PostgreSQL      | 21/10/25 |
|            | BD-001,BD-002         | BANCO DE DADOS | CRIAÇÃO DO BANCO DE DADOS                    | Muito alta | Criar um banco de dados com todas as tabelas necessárias para o funcionamento do site, seguindo o esquema entidade relacional         | 8         | ✅ | DBDesigner, PostgreSQL      | 21/10/25 |
| RNF-02     | AL-001, AL-006        | SCRIPT         | CRIAÇÃO DE SCRIPT - CONTATO                  | Alta       | Criar um script referênte a pagina contato para o envio de mensagens de contato direto com o laboratório                              | 5         | ✅ | JavaScript, VSCode, Node.js | 31/10/25 |
| RNF-02     | AL-001, AL-006        | SCRIPT         | CRIAÇÃO DO SCRIPT - PASSAR PÁGINA            | Media      | Criar um script que passe páginas com muito conteúdo, como a de projetos. O objetivo é deixar a página mais suave de ser visualizada. | 3         | ✅ | JavaScript, VSCode, Node.js | 31/10/25 |
| RNF-02     | AL-001, AL-006        | SCRIPT         | CRIAÇÃO DE SCRIPT - FILTRO                   | Alta       | Criar um script de filtro para as páginas que necessitam de pesquisa                                                                  | 5         | ✅ | JavaScript, VSCode, Node.js | 31/10/25 |
| RNF-02     | DD-015                | DESIGN         | CRIAÇÃO DE UM MENU - ADMINISTRADOR           | Media      | Criar um design de um menu para o administrador do sistema                                                                            | 3         | ✅ | FIGMA                       | 13/10/25 |
| RNF-02     | DD-016                | DESIGN         | CRIAÇÃO DE UM MENU - MEMBRO                  | Media      | Criar um design de um menu para os membros do sistema                                                                                 | 3         | ✅ | FIGMA                       | 13/10/25 |
| RNF-02     | DD-017                | DESIGN         | CRIAÇÃO DE UMA PÁGINA DE ENVIO DE CONTEUDO   | Alta       | Criar um design para uma pagina de envio de conteudos que alimentarao o site                                                          | 5         | ✅ | FIGMA                       | 13/10/25 |
| RNF-02     | DD-018                | DESIGN         | CRIAÇÃO DE UM PÁGINA DE LISTA DE CONTEÚDO    | Media      | Criar um design de uma página que lista todos os conteudos do site                                                                    | 3         | ✅ | FIGMA                       | 13/10/25 |
| RNF-02     | DD-016                | DESIGN         | CRIAÇÃO DE UMA PÁGINA DE CADASTRO DE MEMBRO  | Alta       | Criar um design para uma página que permita cadastrar membros                                                                         | 5         | ✅ | FIGMA                       | 13/10/25 |
| RNF-02     | DD-016                | DESIGN         | CRIAÇÃO DE UM PÁGINA DE LISTA DE MEMBROS     | Media      | Criar um design de uma página que liste todos os membros cadastrados                                                                  | 3         | ✅ | FIGMA                       | 13/10/25 |
| RNF-02     | DD-015                | DESIGN         | CRIAÇÃO DE UMA PÁGINA DE LOGIN               | Media      | Criar um design para uma página de login                                                                                              | 3         | ✅ | FIGMA                       | 13/10/25 |
| RNF-02     | AL-003,AL-004, AL-005 | BACKEND        | CRIAÇÃO DE UM CRUD DE MEMBROS                | Muito alta | Criar as funções primárias de um um sistema para membros                                                                              | 8         | ✅ | JavaScript, VSCode, Node.js | 31/10/25 |
| RNF-02     | AL-003,AL-004, AL-005 | BACKEND        | CRIAÇÃO DE UM CRUD DE CONTEÚDO               | Muito alta | Criar as funções primárias de um sistema para conteúdo                                                                                | 8         | ✅ | JavaScript, VSCode, Node.js | 31/10/25 |



##  DoR - Definition of Ready <a id="dor"></a>

|             Critério             | Descrição                                                                                                                                                           |
| :------------------------------: | ------------------------------------------------------------------------------------------------- |
|       Código Padronizado       | Segue boas práticas e padrões do time.           |
| Revisão e Deploy | Código revisado, aprovado e build sem erros. |
| Entidade-Relação| Visualização e organização de relações.                   |



##  DoD - Definition of Done <a id="dod"></a>

|                 Critério                 | Descrição                                                                            |
| :--------------------------------------: | ------------------------------------------------------------------------------------ |
|     Tabelas Criadas e Programadas                   | Tabelas organizadas e funcionais.                                             |
|     Botões                    | Scriptados conforme necessidade e 100% funcionais.                                                |
|     CRUD                   | CRUD finalizado e funcional.                                               |


## 🎓 Equipe <a id="equipe"></a>

<div align="center">

  <table>
    <tr>
      <th>Membro</th>
      <th>Função</th>
      <th>Github</th>
      <th>Linkedin</th>
    </tr>
    <tr>
       <td>Gianluca Lourenço</td>
      <td>Product Owner</td>
      <td><a href="https://github.com/Duraxxi"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a></td>
      <td><a href=""><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a></td>
    </tr>
    <tr>
      <td>Victor Coutinho</td>
      <td>Scrum Master</td>
      <td><a href="https://github.com/Vitaixs"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a></td>
      <td><a href=""><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a></td>
    </tr>
    <tr>
      <td>Allan Ramos</td>
      <td>Desenvolvedor</td>
      <td><a href="https://github.com/Allan-ramos122"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a></td>
      <td><a href=""><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a></td>
    </tr>
    <tr>
      <td>Guilherme Henrique</td>
      <td>Desenvolvedor</td>
      <td><a href=""><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a></td>
      <td><a href=""><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a></td>
    </tr>
    <tr>
      <td>Lucas Cecon</td>
      <td>Desenvolvedor</td>
      <td><a href="https://github.com/lucas-cecon"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a></td>
      <td><a href="s"><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a></td>
    </tr>
    <tr>
      <td>Lucas Cobra</td>
      <td>Desenvolvedor</td>
      <td><a href="https://github.com/LucasCobraFatec"><img src="https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white"></a></td>
      <td><a href=""><img src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"></a></td>
    </tr>
  </table>
</div>
