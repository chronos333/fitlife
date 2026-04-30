# 📄 Documentação de Requisitos – FITLife
**Padrão: ISO/IEC/IEEE 29148**

---

## 1. Introdução

### 1.1 Propósito
Este documento descreve os requisitos do aplicativo **FITLife**, desenvolvido em Flutter, com o objetivo de auxiliar usuários no monitoramento de atividades físicas e hábitos saudáveis.

---

### 1.2 Escopo
O aplicativo FITLife permitirá:

- Registrar atividades físicas
- Acompanhar progresso
- Visualizar métricas de desempenho
- Gerenciar configurações

O sistema será um protótipo funcional com navegação fluida e atualização em tempo real utilizando Provider.

---

### 1.3 Definições, Acrônimos e Abreviações

| Termo | Definição |
|------|--------|
| Flutter | Framework para desenvolvimento mobile |
| Provider | Gerenciamento de estado |
| Dashboard | Painel de métricas |
| UI | Interface do usuário |

---

## 2. Visão Geral do Sistema

### 2.1 Perspectiva do Produto
O FITLife é um aplicativo independente voltado para saúde e bem-estar, podendo futuramente integrar com APIs externas.

---

### 2.2 Funções do Produto

O sistema deverá:

- Exibir tela inicial
- Gerenciar atividades físicas
- Permitir conclusão de atividades
- Exibir dashboard com métricas
- Permitir configurações do usuário
- Atualizar dados em tempo real

---

### 2.3 Características dos Usuários

O sistema é destinado a:

- Usuários interessados em saúde e fitness
- Iniciantes e praticantes de exercícios
- Usuários com conhecimento básico de smartphones

---

### 2.4 Restrições

- Desenvolvido em Flutter
- Uso obrigatório do Provider
- Aplicação mobile (Android)
- Não requer conexão com internet

---

## 3. Requisitos Funcionais

### RF01 – Tela Inicial
O sistema deve exibir:

- Nome do aplicativo
- Slogan
- Botão “Começar”

---

### RF02 – Navegação
O sistema deve permitir navegação através de:

- BottomNavigationBar
- Drawer

---

### RF03 – Gerenciamento de Atividades
O sistema deve:

- Exibir atividades pendentes
- Permitir marcar atividades como concluídas
- Mover atividades para lista de concluídas

---

### RF04 – Dashboard
O sistema deve exibir:

- Quantidade de atividades concluídas
- Quantidade de atividades pendentes
- Calorias estimadas
- Tempo total de treino
- Meta semanal

---

### RF05 – Configurações
O sistema deve permitir:

- Alternar modo escuro
- Resetar progresso
- Definir meta semanal

---

### RF06 – Atualização em Tempo Real
O sistema deve atualizar automaticamente os dados ao:

- Concluir atividades
- Alterar configurações

---

## 4. Requisitos Não Funcionais

### RNF01 – Usabilidade
Interface simples, intuitiva e de fácil navegação.

---

### RNF02 – Desempenho
Atualizações devem ocorrer em tempo real sem atrasos perceptíveis.

---

### RNF03 – Manutenibilidade
O código deve ser organizado em:

- Providers
- Screens
- Widgets

---

### RNF04 – Portabilidade
Compatível com dispositivos Android.

---

## 5. Requisitos de Interface

### 5.1 Interface do Usuário
O sistema deve conter:

- AppBar
- Drawer
- BottomNavigationBar
- TabBarView
- ListView
- GridView

---

### 5.2 Interface de Software

- Flutter SDK
- Provider

---

## 6. Casos de Uso

### Caso de Uso 01 – Iniciar Aplicação

**Ator:** Usuário  

**Fluxo:**
1. Usuário abre o aplicativo  
2. Visualiza tela inicial  
3. Clica em “Começar”  
4. Sistema direciona para tela principal  

---

### Caso de Uso 02 – Concluir Atividade

**Ator:** Usuário  

**Fluxo:**
1. Acessa tela de atividades  
2. Seleciona uma atividade pendente  
3. Marca como concluída  
4. Sistema move atividade para lista de concluídas  

---

### Caso de Uso 03 – Visualizar Dashboard

**Ator:** Usuário  

**Fluxo:**
1. Acessa dashboard  
2. Visualiza métricas atualizadas  

---

### Caso de Uso 04 – Alterar Configurações

**Ator:** Usuário  

**Fluxo:**
1. Acessa configurações  
2. Ativa/desativa modo escuro  
3. Sistema aplica alteração  

---

## 7. Modelo de Dados
    Atividade:

    nome: String
    status: (pendente/concluída)

    AppState:

    listaPendentes: List<String>
    listaConcluidas: List<String>
    metaSemanal: int
    tema: boolean

---

## 8. Critérios de Aceitação

O sistema será considerado válido se:

- ✔ Navegação funcionando corretamente  
- ✔ Atividades sendo movidas corretamente  
- ✔ Dashboard atualizado em tempo real  
- ✔ Provider implementado corretamente  
- ✔ Mínimo de 3 telas funcionais  

---

## 9. Melhorias Futuras

- Integração com APIs de saúde  
- Sistema de login  
- Persistência de dados (SQLite)  
- Gráficos avançados  
- Notificações  

---

## 10. Conclusão

O aplicativo FITLife atende aos requisitos propostos, utilizando Flutter e Provider para fornecer uma experiência funcional e organizada, com atualização em tempo real e foco no monitoramento de atividades físicas.