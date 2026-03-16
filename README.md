# 🚀 Global IoT Sentinel - Database Engine

Este projeto demonstra uma arquitetura de banco de dados de alta performance para sistemas IoT, focada em escalabilidade e baixa latência no processamento de telemetria.

## 🛠️ Tecnologias
* **Banco de Dados:** PostgreSQL 16 (via Supabase Cloud)
* **Arquitetura:** Table Partitioning (Range)
* **Performance:** GIN Indexes & JSONB Storage

## 📊 Resultados de Performance
Utilizei o comando `EXPLAIN ANALYZE` para validar a eficiência do particionamento. 
O banco realizou o **Partition Pruning**, buscando dados apenas na partição necessária (`telemetry_y2026m03`), resultando em um tempo de execução de apenas **0.02ms**.

![Plano de Execução]([COLE_AQUI_O_LINK_DA_SUA_IMAGEM_DE_PERFORMANCE](https://supabase.com/dashboard/project/aqdgxqitxvbpmtaosyid/sql/0c33dbe0-485d-415e-b9fb-1104bbfeb51a))

## 🏗️ Estrutura do Banco
O sistema gerencia clientes, dispositivos e milhões de registros de telemetria de forma particionada por mês, garantindo que o crescimento da base não degrade as consultas.
