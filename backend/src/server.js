// backend/src/server.js
import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import nodemailer from "nodemailer"; // 1. Importamos o carteiro de volta!

import userRoutes from "./routes/userRoutes.js";
import dashboardRoutes from "./routes/dashboardRoutes.js";
import postsRoutes from "./routes/postsRoutes.js";
import membrosRoutes from "./routes/membrosRoutes.js";

import path from "path";
import { fileURLToPath } from "url";

// Configuração para __dirname funcionar com "import" (ES Modules)
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());

// 2. ADICIONADO: O "tradutor" para ler os dados do formulário HTML
app.use(express.urlencoded({ extended: true }));

// Rota de teste
app.get("/", (req, res) => {
  res.json({ status: "backend ok" });
});

// Rotas do seu projeto (Banco de Dados)
app.use("/api", userRoutes);
app.use("/dashboard", dashboardRoutes);
app.use("/posts", postsRoutes);
app.use("/membros", membrosRoutes);

// Pasta de uploads pública
app.use("/uploads", express.static("src/uploads"));

// Ensina o servidor a servir os arquivos da raiz do projeto (onde estão as pastas 'pages', 'src', etc.)
app.use(express.static(path.join(__dirname, "../../")));

// --- 3. A VOLTA DO CÓDIGO DE E-MAIL ---

// Configuração do Carteiro (Transporter)
const transporter = nodemailer.createTransport({
  host: "smtp.gmail.com",
  port: 587,
  secure: false,
  auth: {
    user: "ceconlucasferreira@gmail.com", // Seu e-mail
    pass: "spmzsbzrhipavsvh", // Sua senha de app
  },
});

// A Rota /enviar
app.post("/enviar", (req, res) => {
  console.log("Dados recebidos do formulário de contato:");
  console.log(req.body);

  const mailOptions = {
    from: "ceconlucasferreira@gmail.com",
    to: "lucasfcecon@outlook.com", // Para quem vai o e-mail
    replyTo: req.body.email,
    subject: `Nova mensagem do site: ${req.body.assunto}`,
    text: `
      Você recebeu uma nova mensagem de:
      Nome: ${req.body.nome}
      Email: ${req.body.email}

      Assunto: ${req.body.assunto}

      Mensagem:
      ${req.body.mensagem}
    `,
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.error("ERRO AO ENVIAR E-MAIL:", error);
      // Em caso de erro, volta para a página mas (opcional) você poderia mandar um status de erro
      res.redirect("/pages/contato.html?status=erro");
    } else {
      console.log("E-mail enviado com sucesso! " + info.response);
      // SUCESSO: Redireciona de volta com o status correto
      res.redirect("/pages/contato.html?status=sucesso");
    }
  });
});

// ---------------------------------------

const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
