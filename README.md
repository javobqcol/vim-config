# Minimalist Vim Configuration

Una configuración de **Vim** minimalista, eficiente y directa al grano, optimizada para el desarrollo ágil desde la terminal sin sobrecargar el editor. Recopila las 4 directivas más útiles para transformar la experiencia nativa de edición.

## 🚀 Características Principales

* **Sin redundancias:** Solo las opciones esenciales que transforman la experiencia de edición.
* **Navegación fluida:** Configuración optimizada para moverte rápido por el código.
* **Búsqueda avanzada:** Comportamiento intuitivo para encontrar texto en archivos grandes.
* **Estética limpia:** Interfaz despejada enfocada 100% en el código fuente.

---
=======================================
## RESUMEN DE PLUGINS INSTALADOS
=======================================

* **F2**                -> NERDTree (mostrar/ocultar explorador)
* **Ctrl+P**            -> FZF Files (buscar archivos)
* **Ctrl+F**            -> FZF Ripgrep (buscar texto)
* **Ctrl+B**            -> FZF Buffers
* **Ctrl+L**            -> FZF Lines

vim-surround
* **ysiw<p>**         -> rodea palabra con <p></p>
* **yss<div>**        -> rodea línea completa
* **cs"'**            -> cambia " por '
* **ds"**             -> elimina comillas

emmet-vim
  div>ul>li*5
  Ctrl+Y ,        -> expandir abreviatura
  Visual + Ctrl+Y ,
                   -> envolver selección

vim-commentary
  gcc             -> comentar línea
  gc + selección  -> comentar bloque

vim-fugitive
  :Git status
  :Git blame
  :Git commit

vim-airline
  Barra de estado mejorada

=======================================




## 💾 Instalación Rápida con `curl`

Puedes aplicar esta configuración instantáneamente en cualquier máquina ejecutando la siguiente línea en tu terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/javobqcol/vim-config/main/bootstrap.sh | bash

