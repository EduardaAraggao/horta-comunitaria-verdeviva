
# 🌿 Sistema de Gestão da Horta Comunitária VerdeViva
Treinandas: Jhulia Eduarda e Maria Eduarda                                                   
Professor: Silvio Montes  
turma05PEc1 - JavaScript+Node

<img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Food/Tomato.png" alt="Tomato" width="25" height="25" />

# Sobre o projeto

> Projeto desenvolvido como parte do curso **Bolsa Futuro Digital / Softex PE**, para gerenciamento de hortas comunitárias administradas por voluntários.



---

## 💡 Sobre o Sistema

O **Sistema de Gestão da Horta Comunitária VerdeViva** tem como objetivo **organizar, registrar e otimizar** o processo de cultivo, colheita e doação de alimentos produzidos na horta.

O sistema permite acompanhar **quem realizou o plantio**, **quando foi colhido**, **quanto foi colhido** e **para qual instituição o alimento foi doado**.

---

## 👥 Atores do Sistema

| 🧩 Ator | 🪴 Papel / O que faz |
|----------|-----------------------|
| **Voluntário** | Realiza os cultivos (plantios) nos canteiros e registra data e quantidade plantada. |
| **Administrador** | Gerencia o sistema: cadastra voluntários, plantas, canteiros e instituições parceiras. |
| **Instituição Parceira** | Recebe as doações de alimentos colhidos. |
| **Sistema (automático)** | Gera relatórios sobre plantios, colheitas e doações, mostrando o fluxo completo da horta. |

> 🌱 *Exemplo: O voluntário João planta alface no Canteiro 3 em 10/04. A colheita acontece em 20/05, e parte é doada para o Lar Esperança.*

---

## 🧩 Entidades e Atributos

| Entidade | Atributos principais | Descrição |
|-----------|----------------------|------------|
| **Voluntário** | `id`, `nome` | Pessoa que realiza os cultivos. |
| **Canteiro** | `id`, `grade`,` localização` `solo` | Área física onde são realizados os plantios. |
| **Planta** | `id`, `nome`, `tipo`, `tempoCultivo` | Espécies cultivadas (hortaliças, legumes, etc). |
| **Cultivo** | `id`, `data`, `qtd (kg)` | Registro de quem plantou, o que e quando. |
| **Colheita** | `id`, `data`, `qtd (kg)` | Registro da colheita feita em um canteiro. |
| **ItemColheita** | `id`, `data`, `qtd (kg)`| Ligação entre uma colheita e suas doações. |
| **Doação** | `id`, `dataDoacao`, `quantidadeTotal (kg)` | Registro de alimentos doados a instituições. |
| **Instituição** | `id`, `nome`, `responsavel`, `telefone`, `endereco` | Entidade que recebe as doações. |
| **Endereço** | `rua`, `numero`, `bairro`, `cidade`, `estado` | Localização da instituição. |
| **Telefone** | `numero` | Contato da instituição. |


## ⚙️ Funcionalidades Principais

✅ Cadastrar **voluntários**, **plantas**, **canteiros** e **instituições**  
✅ Registrar **cultivos** (quem plantou, o que e quando)  
✅ Registrar **colheitas** (data e quantidade colhida)  
✅ Registrar **doações** e **instituições beneficiadas**  
✅ Exibir **relatórios completos**:
- Quem realizou o plantio  
- Quando foi colhido  
- Quanto foi colhido  
- Para qual instituição foi doado  

## 🌾 Modelo Conceitual (Diagrama ER)
![Modelo Conceitual da Horta](./modelo-conceitual.png)


## 🌿 Modelo Lógico
![Modelo Conceitual da Horta](./modelo-logico.png)  

## 🧩 Entidades e Relacionamentos

### 🧑‍🌾 Voluntário
- **PK:** `id`
- Representa os voluntários responsáveis pelos plantios e cuidados com os canteiros.

---

### 🌱 Canteiro
- **PK:** `id`
- Contém informações sobre a localização e tipo de solo de cada canteiro.

---

### 🪴 Planta
- **PK:** `id`
- Armazena as espécies de plantas cultivadas na horta.

---

### 🌾 Cultivo
- **PK:** `id`
- **FKs:**
  - `idVoluntario` → `voluntario.id`
  - `idPlanta` → `planta.id`
  - `idCanteiro` → `canteiro.id`
- 📘 Registra **quem plantou**, **o que foi plantado**, **onde** e **quando**.

---

### 🧺 Colheita
- **PK:** `id`
- **FK:** `idCultivo` → `cultivo.id`
- 📘 Cada colheita está associada a um cultivo específico, com data e quantidade colhida.

---

### 🎁 Doação
- **PK:** `id`
- **FK:** `idInstituicao` → `instituicao.id`
- 📘 Registra as doações realizadas para instituições parceiras.

---

### 🪣 ItemColheita
- **PK (composta):** `colheita_id`, `doacao_id`
- **FKs:**
  - `colheita_id` → `colheita.id`
  - `doacao_id` → `doacao.id`
- 📘 Permite que **uma colheita gere várias doações** e **uma doação contenha itens de várias colheitas**.

---

### 🏛️ Instituição
- **PK:** `id`
- 📘 Representa as instituições sociais que recebem as doações de alimentos.

---

### ☎️ Telefone
- **PK:** `id`
- **FK:** `idInstituicao` → `instituicao.id`
- 📘 Cada instituição pode ter um ou mais telefones cadastrados.

---

### 🏠 Endereço
- **PK:** `id`
- **FK:** `idInstituicao` → `instituicao.id`
- 📘 Armazena o endereço completo de cada instituição parceira.

---

## 🧾 Resumo das Chaves

| 🗂️ **Tabela** | 🔑 **Chave Primária (PK)** | 🔗 **Chaves Estrangeiras (FK)** |
|----------------|-----------------------------|---------------------------------|
| **voluntario** | `id` | — |
| **canteiro** | `id` | — |
| **planta** | `id` | — |
| **cultivo** | `id` | `idVoluntario → voluntario.id`<br>`idPlanta → planta.id`<br>`idCanteiro → canteiro.id` |
| **colheita** | `id` | `idCultivo → cultivo.id` |
| **doacao** | `id` | `idInstituicao → instituicao.id` |
| **itemColheita** | `colheita_id`, `doacao_id` | `colheita_id → colheita.id`<br>`doacao_id → doacao.id` |
| **instituicao** | `id` | — |
| **telefone** | `id` | `idInstituicao → instituicao.id` |
| **endereco** | `id` | `idInstituicao → instituicao.id` |

---



## 💻 Modelo Físico 

[Visualizar o Manual do Projeto](hortaverdeviva.sql.pdf) 
