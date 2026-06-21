# Minimalist Vim Configuration

Una configuración de **Vim** minimalista, eficiente y directa al grano, optimizada para el desarrollo ágil desde la terminal sin sobrecargar el editor. Recopila las directivas y plugins más útiles para transformar la experiencia nativa de edición.

## 🚀 Características Principales

* **Sin redundancias:** Solo las opciones esenciales que transforman la experiencia de edición.
* **Navegación fluida:** Configuración optimizada para moverte rápido por el código.
* **Búsqueda avanzada:** Comportamiento intuitivo para encontrar texto en archivos grandes.
* **Estética limpia:** Interfaz despejada enfocada 100% en el código fuente.

---

## 🛠️ Plugins Instalados y Atajos

### 🔍 Navegación y Búsqueda (FZF & NERDTree)

| Atajo | Acción |
| :--- | :--- |
| <kbd>F2</kbd> | Mostrar/ocultar explorador de archivos (**NERDTree**) |
| <kbd>Ctrl + P</kbd> | Buscar archivos (**FZF Files**) |
| <kbd>Ctrl + F</kbd> | Buscar texto dentro de los archivos (**FZF Ripgrep**) |
| <kbd>Ctrl + B</kbd> | Listar y buscar en buffers abiertos (**FZF Buffers**) |
| <kbd>Ctrl + L</kbd> | Buscar líneas en el archivo actual (**FZF Lines**) |

### ✍️ Edición y Estructura (`vim-surround` & `emmet-vim`)

**`vim-surround` (Manipulación de entornos)**
* <kbd>ysiw&lt;p&gt;</kbd> → Rodea la palabra actual con `<p></p>`.
* <kbd>yss&lt;div&gt;</kbd> → Rodea la línea completa con `<div></div>`.
* <kbd>cs"'</kbd> → Cambia comillas dobles `"` por simples `'`.
* <kbd>ds"</kbd> → Elimina las comillas `"`.

**`emmet-vim` (Expansión de HTML/CSS)**
* Escribe una abreviatura (ej. `div>ul>li*5`) y presiona <kbd>Ctrl + Y</kbd> , para expandirla.
* En **Modo Visual**, presiona <kbd>Ctrl + Y</kbd> , para envolver la selección en una etiqueta.

### 📝 Comentarios (`vim-commentary`)

* <kbd>gcc</kbd> → Comentar o descomentar la línea actual.
* <kbd>gc</kbd> (en Modo Visual) → Comentar o descomentar el bloque seleccionado.

### 🐙 Integración con Git (`vim-fugitive`)

Usa los comandos nativos de Git directamente desde Vim:
* `:Git status` → Ver el estado del repositorio.
* `:Git blame` → Ver quién modificó cada línea.
* `:Git commit` → Crear un nuevo commit.

### 📊 Interfaz (`vim-airline`)

* **Barra de estado mejorada:** Visualiza de forma limpia el modo actual, la rama de Git, el formato de archivo y la posición del cursor.

---

## 💾 Instalación Rápida

Puedes aplicar esta configuración instantáneamente en cualquier máquina ejecutando la siguiente línea en tu terminal:

```bash
curl -fsSL [https://raw.githubusercontent.com/javobqcol/vim-config/main/bootstrap.sh](https://raw.githubusercontent.com/javobqcol/vim-config/main/bootstrap.sh) | bash

