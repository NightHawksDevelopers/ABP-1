import dotenv from 'dotenv';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';
import pg from 'pg';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
dotenv.config({ path: path.resolve(__dirname, '../../.env') });

const pool = new pg.Pool({
    connectionString: process.env.DATABASE_URL
});

async function restaurarBanco() {
    console.log('🗑️  Limpando e restaurando banco com db-1.sql...');

    try {
        // Aponta para o arquivo NOVO que criamos
        const sqlPath = path.join(__dirname, 'db-1.sql');
        const sql = fs.readFileSync(sqlPath, 'utf8');

        await pool.query(sql);
        console.log('✅ Banco restaurado com sucesso!');
    } catch (error) {
        console.error('❌ Erro:', error.message);
        process.exit(1);
    } finally {
        await pool.end();
    }
}

restaurarBanco();