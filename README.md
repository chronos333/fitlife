# 📄 Documentação de Requisitos – FITLife  
**Padrão: ISO/IEC/IEEE 29148 (SRS – Software Requirements Specification)**

---

## 1. Introdução

### 1.1 Propósito
Este documento especifica os requisitos funcionais e não funcionais do aplicativo **FITLife**, desenvolvido em Flutter.  
O objetivo é fornecer uma base clara para desenvolvimento, validação e apresentação do sistema.

---

### 1.2 Escopo
O **FITLife** é um aplicativo mobile voltado para o monitoramento de atividades físicas, permitindo que usuários:

- Registrem atividades físicas
- Marquem atividades como concluídas
- Acompanhem progresso em tempo real
- Visualizem métricas de desempenho
- Configurem preferências do sistema

O sistema é um **protótipo funcional**, com foco em usabilidade, organização e gerenciamento de estado utilizando **Provider**.

---

### 1.3 Definições, Acrônimos e Abreviações

| Termo | Definição |
|------|--------|
| Flutter | Framework para desenvolvimento mobile |
| Provider | Gerenciador de estado |
| Dashboard | Painel de métricas |
| UI | Interface do Usuário |
| UX | Experiência do Usuário |

---

### 1.4 Referências

- Documentação oficial do Flutter  
- Documentação do Provider  
- ISO/IEC/IEEE 29148 – Engenharia de Requisitos  

---

## 2. Visão Geral do Sistema

### 2.1 Perspectiva do Produto
O FITLife é um sistema independente, podendo futuramente integrar com:

- APIs de saúde
- Dispositivos wearables (smartwatch)
- Sistemas de autenticação

---

### 2.2 Funções do Produto

O sistema deverá:

- Exibir tela inicial (splash)
- Gerenciar atividades físicas (CRUD parcial)
- Atualizar dados em tempo real
- Exibir dashboard com métricas
- Permitir configuração de preferências
- Controlar navegação entre telas

---

### 2.3 Características dos Usuários

| Tipo de Usuário | Características |
|----------------|--------------|
| Iniciante | Busca controle básico de atividades |
| Intermediário | Acompanha metas e desempenho |
| Geral | Usuário com conhecimento básico em apps mobile |

---

### 2.4 Ambiente Operacional

- Plataforma: Android
- Linguagem: Dart
- Framework: Flutter
- Gerenciamento de estado: Provider

---

### 2.5 Restrições

- Uso obrigatório de Flutter
- Uso obrigatório de Provider
- Não utiliza banco de dados externo
- Funciona offline

---

### 2.6 Suposições e Dependências

- O usuário possui conhecimento básico de navegação em apps
- O dispositivo possui suporte ao Flutter
- O app não depende de conexão com internet

---

## 3. Requisitos Funcionais

### RF01 – Tela Inicial
O sistema deve:

- Exibir nome do aplicativo
- Exibir slogan
- Exibir logo
- Possuir botão "Começar"

---

### RF02 – Navegação
O sistema deve permitir navegação através de:

- Drawer (menu lateral)
- BottomNavigationBar
- Tabs internas (TabBarView)

---

### RF03 – Gerenciamento de Atividades

O sistema deve:

- Exibir lista de atividades pendentes
- Permitir marcar atividade como concluída
- Permitir desfazer conclusão
- Atualizar listas automaticamente

---

### RF04 – Dashboard

O sistema deve exibir:

- Total de atividades concluídas
- Total de atividades pendentes
- Calorias estimadas
- Tempo total de treino
- Meta semanal

---

### RF05 – Configurações

O sistema deve permitir:

- Alternar modo escuro
- Alterar meta semanal
- Resetar progresso

---

### RF06 – Atualização em Tempo Real

O sistema deve:

- Atualizar automaticamente a interface ao alterar dados
- Utilizar Provider para gerenciamento de estado

---

### RF07 – Ajuda

O sistema deve:

- Exibir instruções básicas de uso
- Disponibilizar diálogo explicativo ao usuário

---

## 4. Requisitos Não Funcionais

### RNF01 – Usabilidade
- Interface simples e intuitiva
- Navegação clara e acessível

---

### RNF02 – Desempenho
- Atualizações em tempo real
- Baixo tempo de resposta

---

### RNF03 – Manutenibilidade
- Código modularizado
- Separação de responsabilidades
- Uso de boas práticas

---

### RNF04 – Portabilidade
- Compatível com Android
- Possibilidade de adaptação para iOS

---

### RNF05 – Escalabilidade
- Estrutura preparada para futuras integrações
- Possibilidade de adicionar banco de dados

---

## 5. Requisitos de Interface

### 5.1 Interface do Usuário

O sistema deve conter:

- AppBar
- Drawer
- BottomNavigationBar
- TabBar + TabBarView
- ListView
- GridView
- Cards

---

### 5.2 Interface de Software

- Flutter SDK
- Provider (ChangeNotifier)

---

## 6. Casos de Uso

---

### UC01 – Iniciar Aplicação

**Ator:** Usuário  

**Fluxo Principal:**
1. Usuário abre o aplicativo  
2. Visualiza tela inicial  
3. Pressiona "Começar"  
4. Sistema redireciona para tela principal  

---

### UC02 – Concluir Atividade

**Ator:** Usuário  

**Fluxo Principal:**
1. Usuário acessa aba de atividades  
2. Seleciona atividade pendente  
3. Marca como concluída  
4. Sistema atualiza listas e dashboard  

---

### UC03 – Desfazer Atividade

**Ator:** Usuário  

**Fluxo Principal:**
1. Usuário acessa atividades concluídas  
2. Seleciona atividade  
3. Retorna para pendentes  
4. Sistema atualiza dados  

---

### UC04 – Alterar Configurações

**Ator:** Usuário  

**Fluxo Principal:**
1. Acessa configurações  
2. Altera preferências (tema/meta)  
3. Sistema aplica mudanças em tempo real  

---

### UC05 – Resetar Progresso

**Ator:** Usuário  

**Fluxo Principal:**
1. Usuário solicita reset  
2. Sistema pede confirmação  
3. Dados são apagados  
4. Interface é atualizada  

---

Atividade:

nome: String
status: boolean (true = concluída)

AppState:

pendingActivities: List<String>
completedActivities: List<String>
weeklyGoal: int
isDarkMode: boolean
currentIndex: int


---

## 8. Critérios de Aceitação

O sistema será aceito se:

- ✔ Navegação funcionar corretamente  
- ✔ Atividades forem atualizadas corretamente  
- ✔ Dashboard refletir dados em tempo real  
- ✔ Provider estiver implementado corretamente  
- ✔ Interface estiver funcional e organizada  

---

## 9. Riscos

- Falhas na atualização do estado
- Erros na navegação entre telas
- Falta de persistência de dados

---

## 10. Melhorias Futuras

- Integração com banco de dados (SQLite/Firebase)
- Sistema de login
- Gráficos interativos
- Notificações
- Integração com smartwatch

---

## 11. Conclusão

O aplicativo **FITLife** atende aos requisitos definidos, oferecendo uma solução funcional para monitoramento de atividades físicas, com foco em organização, usabilidade e atualização em tempo real utilizando Provider.

## 7. Modelo de Dados
