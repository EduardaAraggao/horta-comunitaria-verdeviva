
# 🌿 Sistema de Gestão da Horta Comunitária VerdeViva
Treinandas: Jhulia Eduarda e Maria Eduarda                                                   
Professor: Silvio Montes  
turma05PEc1 - JavaScript+Node



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
| **ItemColheita** | `quantidadeDoada (kg)` | Ligação entre uma colheita e suas doações. |
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
![Modelo Conceitual da Horta](C:\Users\Maria Eduarda\Desktop\verdeviva\verdeviva.png)


